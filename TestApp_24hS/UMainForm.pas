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
    procedure ThreadTerminationHandler(Sender: TObject);
    procedure btnRunThreadsClick(Sender: TObject);
  strict private
    FActiveThreadsCount: Integer;
    FCriticalSection: TCriticalSection;
    FPrimeNumber: Integer;
    FResultFile: TextFile;
    FThreadsArray: array of TThread;
  protected
    function AddThread(const AIndex: Integer): TThread;
    procedure ChangeControlsState(const AEnabled: Boolean);
    procedure CreateThreads;
    procedure PrepareResultsStorage;
    procedure RunThreads;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //
    property CriticalSection: TCriticalSection read FCriticalSection;
    property ResultFile: TextFile read FResultFile;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses
  UPrimeNumberWriterThread;

{ TfmMain }

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
  Result.OnTerminate := ThreadTerminationHandler;
  TPrimeNumberWriterThread(Result).Initialize(AIndex, @FPrimeNumber, seMaxValue.Value);
end;

procedure TfmMain.ChangeControlsState(const AEnabled: Boolean);
begin
  gbParams.Enabled := AEnabled;
  btnRunThreads.Enabled := AEnabled;
  if AEnabled then
    Cursor := crDefault
  else
    Cursor := crHourGlass;
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
//var
//  I: Integer;
begin
//  mmResults.Clear;
//  mmResults.Lines.Add('All: ');
//  for I := 1 to seThreadsCount.Value do
//    mmResults.Lines.Add('Thread ' + IntToStr(I) + ': ');
  AssignFile(FResultFile, 'Result.txt');
  Rewrite(FResultFile);
end;

procedure TfmMain.RunThreads;
var
  I: Integer;
begin
  FActiveThreadsCount := 0;
  ChangeControlsState(False);
  for I := 0 to Length(FThreadsArray) - 1 do
  begin
    FThreadsArray[I].Resume;
    Inc(FActiveThreadsCount);
  end;
end;

procedure TfmMain.ThreadTerminationHandler(Sender: TObject);
begin
  Dec(FActiveThreadsCount);
  if FActiveThreadsCount = 0 then
  begin
    ChangeControlsState(True);
    CloseFile(FResultFile);
  end;
end;

procedure TfmMain.btnRunThreadsClick(Sender: TObject);
begin
  FPrimeNumber := 1;
  PrepareResultsStorage;
  CreateThreads;
  RunThreads;
end;

end.
