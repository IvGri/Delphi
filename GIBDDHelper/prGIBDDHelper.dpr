program prGIBDDHelper;

uses
  Forms,
  uGIBDDHelper in 'uGIBDDHelper.pas' {frmGIBDDHelper};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGIBDDHelper, frmGIBDDHelper);
  Application.Run;
end.
