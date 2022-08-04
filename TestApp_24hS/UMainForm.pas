unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmMain = class(TForm)
    btnRunThreads: TButton;
    mmResults: TMemo;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure btnRunThreadsClick(Sender: TObject);
  strict private
    FCurrentNumber: Integer;
    FMaxNumber: Integer; // Temp
//    FMainFile: TextFile;
    function AddThread(const AIndex: Integer): TThread;
    procedure CreateThreads;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  USimpleNumberWriterThread;

function TfmMain.AddThread(const AIndex: Integer): TThread;
begin
  Result := TSimpleNumberWriterThread.Create(True);
  Result.FreeOnTerminate := True;
  Result.Priority := tpNormal;
  TSimpleNumberWriterThread(Result).Initialize('Thread' + IntToStr(AIndex), @FCurrentNumber, FMaxNumber);
end;

procedure TfmMain.CreateThreads;
var
  AThread1, AThread2: TThread;
begin
  AThread1 := AddThread(1);
  AThread2 := AddThread(2);

  AThread1.Resume;
  AThread2.Resume;
end;

procedure TfmMain.btnRunThreadsClick(Sender: TObject);
begin
  FCurrentNumber := 1;
  FMaxNumber := 100;
  mmResults.Clear;
  Memo1.Clear;
  Memo2.Clear;
  CreateThreads;
end;

end.
