unit uMeasurersToCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Menus, StdCtrls,
  cxGraphics, cxControls, dxForms, cxLookAndFeels, cxLookAndFeelPainters, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  cxButtons, dxLayoutContainer, cxContainer, cxEdit, cxCustomListBox, cxListBox, cxClasses, dxLayoutControl;

type
  TfmMeasurersToCheck = class(TdxForm)
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    lbMeasurersToCheck: TcxListBox;
    lilbMeasurersToCheck: TdxLayoutItem;
    btnCopyToClipboard: TcxButton;
    libtnCopyToClipboard: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowMeasurersToCheck(AListOfMeasurersToCheck: TStringList);

implementation

{$R *.dfm}

procedure ShowMeasurersToCheck(AListOfMeasurersToCheck: TStringList);
var
  AForm: TfmMeasurersToCheck;
begin
  AForm := TfmMeasurersToCheck.Create(nil);
  try
    // Initialization
    AForm.ShowModal;
  finally
    AForm.Free;
  end;
end;

end.
