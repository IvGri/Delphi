unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, cxGraphics, cxControls, DB,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxCore, dxRibbonSkins, dxRibbon, dxBar, dxRibbonForm;

type
  TfmMain = class(TdxRibbonForm)
    cxGridMainDBTableViewRooms: TcxGridDBTableView;
    cxGridMainLevelRooms: TcxGridLevel;
    cxGridMain: TcxGrid;
    cxGridMainDBTableViewRoomsfStreet: TcxGridDBColumn;
    cxGridMainDBTableViewRoomsfHome: TcxGridDBColumn;
    cxGridMainDBTableViewRoomsfRoom: TcxGridDBColumn;
    cxGridMainDBTableViewRoomsfMeasurerIndex: TcxGridDBColumn;
    cxGridMainLevelMeasurerData: TcxGridLevel;
    cxGridMainDBTableViewMeasurerData: TcxGridDBTableView;
    cxGridMainDBTableViewMeasurerDatafMeasurerIndex: TcxGridDBColumn;
    cxGridMainDBTableViewMeasurerDatafValue: TcxGridDBColumn;
    cxGridMainDBTableViewMeasurerDatafValueDate: TcxGridDBColumn;
    bmMain: TdxBarManager;
    rtActions: TdxRibbonTab;
    rMain: TdxRibbon;
    bMainActions: TdxBar;
    blbShowMeasurersToCheck: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure blbShowMeasurersToCheckClick(Sender: TObject);
    procedure cxGridMainDBTableViewRoomsFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  uDataModule, uMeasurersToCheck;

procedure TfmMain.blbShowMeasurersToCheckClick(Sender: TObject);
begin
  ShowMeasurersToCheck(nil); // TODO: change nil to the correct value
end;

procedure TfmMain.cxGridMainDBTableViewRoomsFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  blbShowMeasurersToCheck.Enabled := AFocusedRecord <> nil;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  dmMain.ADOConnection.Connected := True;
  dmMain.ADODataSetPlace.Active := True;
  dmMain.ADODataSetMeasurer.Active := True;
  dmMain.ADODataSetMeasurerData.Active := True;
end;

end.
