unit UPrimeNumberWriterThread;

interface

uses
  Classes, Windows, SysUtils, SyncObjs;

type
  TPrimeNumberWriterThread = class(TThread)
  strict private
    FPrimeNumberRef: PInteger;
    FMaxNumber: Integer;
    FNewNumber: Integer;
    FResultFile: TextFile;
    FThreadIndex: Integer;
  protected
    procedure Execute; override;
    //
    function CanContinue: Boolean; inline;
    procedure CloseResultFile;
    function GetNextPrimeNumber(const APrevPrimeNumber: Integer): Integer;
    function IsPrimeNumber(const ANumber: Integer): Boolean;
    procedure OpenResultFile;
    procedure SaveNewNumber;
  public
    procedure Initialize(const AThreadIndex: Integer; APrimeNumberRef: PInteger; const AMaxNumber: Integer);
  end;

implementation

uses
  UMainForm;

{ TPrimeNumberWriterThread }

procedure TPrimeNumberWriterThread.Initialize(const AThreadIndex: Integer; APrimeNumberRef: PInteger;
  const AMaxNumber: Integer);
begin
  FThreadIndex := AThreadIndex;
  FPrimeNumberRef := APrimeNumberRef;
  FMaxNumber := AMaxNumber;
end;

procedure TPrimeNumberWriterThread.Execute;
begin
  OpenResultFile;
  while not Terminated do
    if fmMain.CriticalSection.TryEnter and CanContinue then
    begin
      FNewNumber := GetNextPrimeNumber(FPrimeNumberRef^);
      if (FNewNumber <> -1) and (FNewNumber < FMaxNumber) then
      begin
        FPrimeNumberRef^ := FNewNumber;
        Synchronize(SaveNewNumber);
      end
      else
        Terminate;
      fmMain.CriticalSection.Leave;
    end;
  CloseResultFile;
end;

function TPrimeNumberWriterThread.CanContinue: Boolean;
begin
  Result := FPrimeNumberRef^ < FMaxNumber;
end;

procedure TPrimeNumberWriterThread.CloseResultFile;
begin
  CloseFile(FResultFile);
end;

function TPrimeNumberWriterThread.GetNextPrimeNumber(const APrevPrimeNumber: Integer): Integer;
var
  AStep, I: Integer;
begin
  Result := -1;
  if APrevPrimeNumber >= 3 then
    AStep := 2
  else
    AStep := 1;
  I := APrevPrimeNumber + AStep;
  while (I < FMaxNumber) and not Terminated {Is needed?} do
  begin
    if IsPrimeNumber(I) then
    begin
      Result := I;
      Break;
    end
    else
      Inc(I, AStep);
  end;
end;

function TPrimeNumberWriterThread.IsPrimeNumber(
  const ANumber: Integer): Boolean;
var
  I: Integer;
begin
  Result := ANumber = 2;
  if (ANumber > 2) and Odd(ANumber) then
  begin
    Result := True;
    I := 3;
    while (I <= Sqrt(ANumber)) and not Terminated {Is needed?} do
    begin
      if (ANumber mod I) = 0 then
      begin
        Result := False;
        Break;
      end
      else
        Inc(I, 2);
    end;
  end;
end;

procedure TPrimeNumberWriterThread.OpenResultFile;
begin
  AssignFile(FResultFile, 'Thread' + IntToStr(FThreadIndex) + '.txt');
  Rewrite(FResultFile);
end;

procedure TPrimeNumberWriterThread.SaveNewNumber;
//
//  procedure AppendLine(const ALineIndex: Integer; const AValue: string);
//  begin
//    fmMain.mmResults.Lines[ALineIndex] := fmMain.mmResults.Lines[ALineIndex] + AValue;
//  end;
//
var
  AAppendValue: string;
begin
  AAppendValue := IntToStr(FNewNumber) + ' ';
//  AppendLine(0, AAppendValue);
//  AppendLine(FThreadIndex, AAppendValue);
  Writeln(fmMain.ResultFile, AAppendValue);
  Writeln(FResultFile, AAppendValue);
end;

end.
