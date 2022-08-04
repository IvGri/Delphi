unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, SyncObjs, Spin;

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
    FPrimeNumber: Integer;
    FThreadsArray: array of TThread;
    //
    function AddThread(const AIndex: Integer): TThread;
    procedure CreateThreads;
    procedure PrepareResultsStorage;
    procedure RunThreads;
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
  TPrimeNumberWriterThread(Result).Initialize(AIndex, @FPrimeNumber, seMaxValue.Value);
end;

procedure TfmMain.CreateThreads;
var
  I: Integer;
begin
  SetLength(FThreadsArray, seThreadsCount.Value);

  for I := 1 to Length(FThreadsArray) do
    FThreadsArray[I - 1] := AddThread(I);
end;

procedure TfmMain.PrepareResultsStorage;
var
  I: Integer;
begin
  mmResults.Clear;
  mmResults.Lines.Add('All: ');
  for I := 1 to Length(FThreadsArray) do
    mmResults.Lines.Add('Thread ' + IntToStr(I) + ': ');
end;

procedure TfmMain.RunThreads;
var
  I: Integer;
begin
  for I := 0 to Length(FThreadsArray) - 1 do
    FThreadsArray[I].Resume;
end;

procedure TfmMain.btnRunThreadsClick(Sender: TObject);
begin
  FPrimeNumber := 1;
  CreateThreads;
  PrepareResultsStorage;
  RunThreads;
end;

end.
