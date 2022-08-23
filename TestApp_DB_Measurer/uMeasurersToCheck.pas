unit uMeasurersToCheck;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, DB,
  dxForms, dxMessageDialog, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

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
  CInformationPattern = 'Measurers at "%s, %d" don''t require check for now';
var
  AForm: TfmMeasurersToCheck;
begin
  dmMain.ADOqMeasurersToCheck.Parameters.ParamValues['pStreet'] := AStreet;
  dmMain.ADOqMeasurersToCheck.Parameters.ParamValues['pHouse'] := AHouse;
  try
    dmMain.ADOqMeasurersToCheck.Open;
    if dmMain.ADOqMeasurersToCheck.RecordCount > 0 then
    begin
      AForm := TfmMeasurersToCheck.Create(Application.MainForm);
      try
        AForm.Caption := Format(CCaptionPattern, [AStreet, AHouse]);
//        AForm.grMainDBTableView.DataController.DataSource := dmMain.dsMeasurersToCheck;
//        AForm.grMainDBTableView.DataController.KeyFieldNames := 'ID';
//        AForm.grMainDBTableViewColumn.DataBinding.FieldName := 'ID';
        AForm.ShowModal;
      finally
        AForm.Free;
      end;
    end
    else
      dxMessageDlg(Format(CInformationPattern, [AStreet, AHouse]), mtInformation, [mbOK], 0);
  finally
    dmMain.ADOqMeasurersToCheck.Close;
  end;
end;

end.
