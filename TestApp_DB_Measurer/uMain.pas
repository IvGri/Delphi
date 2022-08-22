unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfmMain = class(TForm)
    cxGridMainDBTableViewRooms: TcxGridDBTableView;
    cxGridMainLevel1: TcxGridLevel;
    cxGridMain: TcxGrid;
    cxGridMainDBTableViewRoomsfStreet1: TcxGridDBColumn;
    cxGridMainDBTableViewRoomsfHome1: TcxGridDBColumn;
    cxGridMainDBTableViewRoomsfRoom1: TcxGridDBColumn;
    cxGridMainDBTableViewRoomsfMeasurerIndex1: TcxGridDBColumn;
    cxGridMainLevel2: TcxGridLevel;
    cxGridMainDBTableViewMeasurerData: TcxGridDBTableView;
    cxGridMainDBTableViewMeasurerDatafMeasurerIndex: TcxGridDBColumn;
    cxGridMainDBTableViewMeasurerDatafValue: TcxGridDBColumn;
    cxGridMainDBTableViewMeasurerDatafValueDate: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
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
  uDataModule;

procedure TfmMain.FormShow(Sender: TObject);
begin
  dmMain.ADOConnection.Connected := True;
  dmMain.ADODataSetPlace.Active := True;
  dmMain.ADODataSetMeasurer.Active := True;
  dmMain.ADODataSetMeasurerData.Active := True;
end;

end.
