unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SyncObjs, Vcl.Samples.Spin;

type
  TfmMain = class(TForm)
    btnRunThreads: TButton;
    mmResults: TMemo;
    gbParams: TGroupBox;
    seMaxValue: TSpinEdit;
    lbMaxValue: TLabel;
    lbThreadsCount: TLabel;
    seThreadsCount: TSpinEdit;
    procedure btnRunThreadsClick(Sender: TObject);
  strict private
    FCriticalSection: TCriticalSection;
    FCurrentNumber: Integer;
    //
    function AddThread(const AIndex: Integer): TThread;
    procedure CreateThreads;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //
    property CriticalSection: TCriticalSection read FCriticalSection;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  UPrimeNumberWriterThread;

constructor TfmMain.Create(AOwner: TComponent);
begin
  inherited;
  FCriticalSection := TCriticalSection.Create;
end;

destructor TfmMain.Destroy;
begin
  FreeAndNil(FCriticalSection);
  inherited;
end;

function TfmMain.AddThread(const AIndex: Integer): TThread;
begin
  Result := TPrimeNumberWriterThread.Create(True);
  Result.FreeOnTerminate := True;
  Result.Priority := tpNormal;
  TPrimeNumberWriterThread(Result).Initialize('Thread' + IntToStr(AIndex), @FCurrentNumber, seMaxValue.Value);
end;

procedure TfmMain.CreateThreads;
var
  AThread1, AThread2, AThread4, AThread3: TThread;
begin


  AThread1 := AddThread(1);
  AThread2 := AddThread(2);
//  AThread3 := AddThread(3);
//  AThread4 := AddThread(4);

  AThread1.Resume;
  AThread2.Resume;
//  AThread3.Resume;
//  AThread4.Resume;
end;

procedure TfmMain.btnRunThreadsClick(Sender: TObject);
begin
  FCurrentNumber := 1;
  mmResults.Clear;
  mmResults.Lines.Add('All: ');
  mmResults.Lines.Add('Thread 1: ');
  mmResults.Lines.Add('Thread 2: ');
  CreateThreads;
end;

end.
