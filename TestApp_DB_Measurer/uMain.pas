unit uMain;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Dialogs, DB,
  dxRibbonForm, dxInputDialogs, dxMessageDialog, cxClasses, cxGraphics, cxControls, dxCore, dxBar, dxRibbon,
  dxRibbonSkins, cxStyles, cxCustomData, cxLookAndFeels, cxLookAndFeelPainters, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid;

type
  TfmMain = class(TdxRibbonForm)
    grMainLevelLR: TcxGridLevel;
    grMain: TcxGrid;
    bmMain: TdxBarManager;
    rtActions: TdxRibbonTab;
    rMain: TdxRibbon;
    bMainActions: TdxBar;
    blbShowMeasurersToCheck: TdxBarLargeButton;
    blbUpdateReading: TdxBarLargeButton;
    grMainDBTableViewLR: TcxGridDBTableView;
    grMainDBTableViewLRSerialNumber: TcxGridDBColumn;
    grMainDBTableViewLRStreet: TcxGridDBColumn;
    grMainDBTableViewLRHouse: TcxGridDBColumn;
    grMainDBTableViewLRRoom: TcxGridDBColumn;
    grMainDBTableViewLRReading: TcxGridDBColumn;
    rtSettings: TdxRibbonTab;
    bGridViewSettings: TdxBar;
    blbShowGroupByBox: TdxBarLargeButton;
    blbShowNewItemRow: TdxBarLargeButton;
    bMeasurerActions: TdxBar;
    blbAddNewMeasurer: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure blbShowMeasurersToCheckClick(Sender: TObject);
    procedure blbUpdateReadingClick(Sender: TObject);
    procedure grMainDBTableViewLRFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure blbShowGroupByBoxClick(Sender: TObject);
    procedure blbShowNewItemRowClick(Sender: TObject);
    procedure blbAddNewMeasurerClick(Sender: TObject);
  strict private
    FUpdatingReading: string;
    //
    function GetFocusedRowValue(AColumn: TcxGridDBColumn): Variant; inline;
    procedure MeasurerValueUpdaterValidationProc(ValueIndex: Integer; const Value: string; var IsValid: Boolean);
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  uDataModule, uMeasurersToCheck, uNewMeasurerDialog;

function TfmMain.GetFocusedRowValue(AColumn: TcxGridDBColumn): Variant;
begin
  if grMainDBTableViewLR.Controller.FocusedRowIndex >= 0 then
    Result := grMainDBTableViewLR.Controller.FocusedRow.Values[AColumn.Index]
  else
    Result := Null;
end;

procedure TfmMain.MeasurerValueUpdaterValidationProc(ValueIndex: Integer; const Value: string; var IsValid: Boolean);
var
  AReading: Integer;
begin
  IsValid := TryStrToInt(Value, AReading) and (AReading > StrToInt(FUpdatingReading));
end;

{ Events }

procedure TfmMain.FormShow(Sender: TObject);
begin
  dmMain.ADOConnection.Connected := True;
  dmMain.ADOdsLocationsWithReadings.Open;
end;

procedure TfmMain.FormHide(Sender: TObject);
begin
  dmMain.ADOConnection.Connected := False;
end;

procedure TfmMain.blbShowMeasurersToCheckClick(Sender: TObject);
begin
  ShowMeasurersToCheck(
    VarToStr(GetFocusedRowValue(grMainDBTableViewLRStreet)), GetFocusedRowValue(grMainDBTableViewLRHouse));
end;

procedure TfmMain.blbUpdateReadingClick(Sender: TObject);
var
  AMeasurer: string;
  ASerialNumber: Integer;
begin
  FUpdatingReading := VarToStr(GetFocusedRowValue(grMainDBTableViewLRReading));
  ASerialNumber := GetFocusedRowValue(grMainDBTableViewLRSerialNumber);
  AMeasurer := 'measurer ' + VarToStr(ASerialNumber) + ' at "' +
    VarToStr(GetFocusedRowValue(grMainDBTableViewLRStreet)) + ', ' +
    VarToStr(GetFocusedRowValue(grMainDBTableViewLRHouse)) + ', ' +
    VarToStr(GetFocusedRowValue(grMainDBTableViewLRRoom)) + '"';
  try
    if dxInputQuery('Update measurer reading', 'Input actual reading of ' + AMeasurer + ':', FUpdatingReading,
      MeasurerValueUpdaterValidationProc) then
    begin
      dmMain.ADOqUpdateReading.Parameters.ParamValues['pNewReading'] := StrToInt(FUpdatingReading);
      dmMain.ADOqUpdateReading.Parameters.ParamValues['pSerialNumber'] := ASerialNumber;
      try
        if dmMain.ADOqUpdateReading.ExecSQL <> 1 then
          raise EDatabaseError.Create('');
        dmMain.ADOdsLocationsWithReadings.Refresh;
      except
        dxMessageDlg('Attempt to update reading of ' + AMeasurer + ' has failed', mtError, [mbOK], 0);
      end;
    end;
  finally
    FUpdatingReading := '';
  end;
end;

procedure TfmMain.grMainDBTableViewLRFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  blbShowMeasurersToCheck.Enabled := AFocusedRecord <> nil;
  blbUpdateReading.Enabled := AFocusedRecord <> nil;
end;

procedure TfmMain.blbShowGroupByBoxClick(Sender: TObject);
begin
  grMainDBTableViewLR.OptionsView.GroupByBox := blbShowGroupByBox.Down;
end;

procedure TfmMain.blbShowNewItemRowClick(Sender: TObject);
begin
  grMainDBTableViewLR.OptionsView.NewItemRow := blbShowNewItemRow.Down;
end;

procedure TfmMain.blbAddNewMeasurerClick(Sender: TObject);
begin
  if AddNewMeasurer > 0 then
  begin
    // TODO: Find better way to refresh grid's content
    dmMain.ADOdsLocationsWithReadings.Close;
    dmMain.ADOdsLocationsWithReadings.Open;
  end;
end;

end.
