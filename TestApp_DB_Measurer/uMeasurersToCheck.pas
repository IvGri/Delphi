unit uMeasurersToCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Menus, StdCtrls, DB,
  dxForms, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfmMeasurersToCheck = class(TdxForm)
    grMainDBTableView: TcxGridDBTableView;
    grMainLevel: TcxGridLevel;
    grMain: TcxGrid;
    grMainDBTableViewColumn: TcxGridDBColumn;
  end;

procedure ShowMeasurersToCheck(const AStreet: string; const AHouse: Integer);

implementation

{$R *.dfm}

uses
  uDataModule;

procedure ShowMeasurersToCheck(const AStreet: string; const AHouse: Integer);
const
  CCaptionPattern = 'Measurers, that need check at "%s, %d"';
  CSQLPattern = 'SELECT L.ID FROM Locations AS L, Checks as C WHERE C.NextCheck <= NOW() AND L.Street = ''%s'' AND L.House = %d';
var
  AForm: TfmMeasurersToCheck;
begin
  dmMain.ADOqMeasurersToCheck.SQL.Clear;
  dmMain.ADOqMeasurersToCheck.SQL.Add(Format(CSQLPattern, [AStreet, AHouse]));
  try
    dmMain.ADOqMeasurersToCheck.Active := True;
    if dmMain.ADOqMeasurersToCheck.RecordCount > 0 then
    begin
      AForm := TfmMeasurersToCheck.Create(Application.MainForm);
      try
        AForm.Caption := Format(CCaptionPattern, [AStreet, AHouse]);

        AForm.grMainDBTableView.DataController.DataSource := dmMain.dsMeasurersToCheck;
        AForm.grMainDBTableView.DataController.KeyFieldNames := 'ID';
        AForm.grMainDBTableViewColumn.DataBinding.FieldName := 'ID';

        AForm.ShowModal;
      finally
        AForm.Free;
      end;
    end
    else
      MessageDlg('Measurers in the selected location don''t require check for now', mtInformation, [TMsgDlgBtn.mbOK], 0);
  finally
    dmMain.ADOqMeasurersToCheck.Active := False;
  end;
end;

end.
