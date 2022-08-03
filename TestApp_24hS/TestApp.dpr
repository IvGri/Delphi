program TestApp;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {fmMain},
  USimpleNumberWriterThread in 'USimpleNumberWriterThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
