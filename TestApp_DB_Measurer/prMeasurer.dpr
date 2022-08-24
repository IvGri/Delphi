program prMeasurer;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uDataModule in 'uDataModule.pas' {dmMain: TDataModule},
  uMeasurersToCheck in 'uMeasurersToCheck.pas' {fmMeasurersToCheck},
  uNewMeasurerDialog in 'uNewMeasurerDialog.pas' {fmNewMeasurerDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
