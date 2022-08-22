unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, cxGraphics, cxControls, DB,
  dxRibbonForm, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxCore, dxRibbonSkins, dxRibbon, dxBar;

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
    FMeasurerUpdatingValue: Integer;
    //
    procedure MeasurerValueUpdaterCloseFunc(Sender: TObject; const Values: array of string; var CanClose: Boolean);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  uDataModule, uMeasurersToCheck;

procedure TfmMain.MeasurerValueUpdaterCloseFunc(Sender: TObject; const Values: array of string; var CanClose: Boolean);
begin
  CanClose := StrToInt(Values[0]) > FMeasurerUpdatingValue;
end;

{ Events }

procedure TfmMain.FormShow(Sender: TObject);
begin
  dmMain.ADOConnection.Connected := True;
  dmMain.ADOdsLocationsWithReadings.Active := True;
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
  AValues: array of string;
begin
  FMeasurerUpdatingValue := 0; // TODO: get actual value
  try
    SetLength(AValues, 1);
    AValues[0] := IntToStr(FMeasurerUpdatingValue);
    if InputQuery('¬вод показаний счетчика', ['”кажите актуальные показани€ счетчика X:'], AValues,
      MeasurerValueUpdaterCloseFunc) then
    begin
      // TODO: update value in DB
    end;
  finally
    FMeasurerUpdatingValue := -1;
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
