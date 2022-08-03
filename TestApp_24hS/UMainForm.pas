unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmMain = class(TForm)
    btnRunThreads: TButton;
    procedure btnRunThreadsClick(Sender: TObject);
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
  USimpleNumberWriterThread;

procedure TfmMain.btnRunThreadsClick(Sender: TObject);
begin
  // Open main file
  // Run threads
  // Close main file
end;

end.
