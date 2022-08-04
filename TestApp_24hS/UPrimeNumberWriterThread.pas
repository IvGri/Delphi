unit UPrimeNumberWriterThread;

interface

uses
  Classes, Windows, SysUtils, SyncObjs;

type
  TPrimeNumberWriterThread = class(TThread)
  strict private
    FCurrentNumberRef: PInteger;
    FMaxNumber: Integer;
    FName: string;
    FNewNumber: Integer;
    //
    function CanContinue: Boolean; inline;
    function GetNextPrimeNumber(const ACurrentPrimeNumber: Integer): Integer;
    function IsPrimeNumber(const ANumber: Integer): Boolean;
    procedure SaveNewNumber;
  protected
    procedure Execute; override;
  public
    procedure Initialize(const AThreadName: string; ACurrentNumberRef: PInteger; const AMaxNumber: Integer);
  end;

implementation

uses
  UMainForm; // TEMP!

{ TPrimeNumberWriterThread }

procedure TPrimeNumberWriterThread.Initialize(const AThreadName: string; ACurrentNumberRef: PInteger;
  const AMaxNumber: Integer);
begin
  FName := AThreadName;
  FCurrentNumberRef := ACurrentNumberRef;
  FMaxNumber := AMaxNumber;
end;

procedure TPrimeNumberWriterThread.Execute;
begin
  while not Terminated do
    if fmMain.CriticalSection.TryEnter and CanContinue then
    begin
      FNewNumber := GetNextPrimeNumber(FCurrentNumberRef^);
      if (FNewNumber <> -1) and (FNewNumber < FMaxNumber) then
      begin
        FCurrentNumberRef^ := FNewNumber;
        Synchronize(SaveNewNumber);
      end
      else
        Terminate;
      fmMain.CriticalSection.Leave;
    end;
end;

function TPrimeNumberWriterThread.CanContinue: Boolean;
begin
  Result := FCurrentNumberRef^ < FMaxNumber;
end;

function TPrimeNumberWriterThread.GetNextPrimeNumber(const ACurrentPrimeNumber: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
//  I := ACurrentPrimeNumber + 2;
  I := ACurrentPrimeNumber + 1;
  while (I < FMaxNumber) and not Terminated {Is needed?} do
  begin
    if IsPrimeNumber(I) then
    begin
      Result := I;
      Break;
    end
    else
//      Inc(I, 2);
      Inc(I);
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

procedure TPrimeNumberWriterThread.SaveNewNumber;

  procedure AppendLine(const ALineIndex: Integer; const AValue: string);
  begin
    fmMain.mmResults.Lines[ALineIndex] := fmMain.mmResults.Lines[ALineIndex] + AValue;
  end;

var
  AAppendValue: string;
begin
  AAppendValue := IntToStr(FNewNumber) + ' ';
  AppendLine(0, AAppendValue);
  AppendLine(StrToInt(FName[Length(FName)]), AAppendValue);
end;

end.
