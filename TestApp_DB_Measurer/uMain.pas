unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, cxGraphics, cxControls, DB,
  dxRibbonForm, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxCore, dxRibbonSkins, dxRibbon, dxBar, dxInputDialogs, dxMessageDialog;

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
    grMainDBTableViewLRID: TcxGridDBColumn;
    grMainDBTableViewLRStreet: TcxGridDBColumn;
    grMainDBTableViewLRHouse: TcxGridDBColumn;
    grMainDBTableViewLRRoom: TcxGridDBColumn;
    grMainDBTableViewLRReading: TcxGridDBColumn;
    rtSettings: TdxRibbonTab;
    bGridViewSettings: TdxBar;
    blbShowGroupByBox: TdxBarLargeButton;
    blbShowNewItemRow: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure blbShowMeasurersToCheckClick(Sender: TObject);
    procedure blbUpdateReadingClick(Sender: TObject);
    procedure grMainDBTableViewLRFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure blbShowGroupByBoxClick(Sender: TObject);
    procedure blbShowNewItemRowClick(Sender: TObject);
  strict private
    FUpdatingReading: string;
    //
    procedure MeasurerValueUpdaterValidationProc(ValueIndex: Integer; const Value: string; var IsValid: Boolean);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  uDataModule, uMeasurersToCheck;

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
    VarToStr(grMainDBTableViewLR.Controller.FocusedRow.Values[grMainDBTableViewLRStreet.Index]),
    grMainDBTableViewLR.Controller.FocusedRow.Values[grMainDBTableViewLRHouse.Index]);
end;

procedure TfmMain.blbUpdateReadingClick(Sender: TObject);
var
  AUpdatingID, AValue: string;
begin
  FUpdatingReading :=
    grMainDBTableViewLR.Controller.FocusedRecord.DisplayTexts[grMainDBTableViewLRReading.Index];
  AUpdatingID := grMainDBTableViewLR.Controller.FocusedRecord.DisplayTexts[grMainDBTableViewLRID.Index];
  try
    if dxInputQuery('Update measurer ' + AUpdatingID + ' reading', 'Input actual reading:', FUpdatingReading,
      MeasurerValueUpdaterValidationProc) then
    begin
      dmMain.ADOqUpdateReading.Parameters.ParamValues['pNewReading'] := StrToInt(FUpdatingReading);
      dmMain.ADOqUpdateReading.Parameters.ParamValues['pUpdatingID'] := StrToInt(AUpdatingID);
      try
        if dmMain.ADOqUpdateReading.ExecSQL <> 1 then
          dxMessageDlg('Reading was not updated', mtError, [mbOK], 0);
        //TODO: update grid content
      except
        dxMessageDlg('Attempt to update reading has failed', mtError, [mbOK], 0);
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

end.
