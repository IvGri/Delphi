unit USimpleNumberWriterThread;

interface

uses
  Classes, Windows, SysUtils, SyncObjs;

type
  TSimpleNumberWriterThread = class(TThread)
  strict private
    FCurrentNumberRef: PInteger;
    FMaxNumber: Integer;
    FName: string;
    FNewNumber: Integer;
    //
    function CanContinue: Boolean; inline;
    function GetNextSimpleNumber(const ACurrentSimpleNumber: Integer): Integer;
    function IsSimpleNumber(const ANumber: Integer): Boolean;
    procedure SaveNewNumber;
  protected
    procedure Execute; override;
  public
    procedure Initialize(const AThreadName: string; ACurrentNumberRef: PInteger; const AMaxNumber: Integer);
  end;

implementation

uses
  UMainForm; // TEMP!

{ TSimpleNumberWriterThread }

procedure TSimpleNumberWriterThread.Initialize(const AThreadName: string; ACurrentNumberRef: PInteger;
  const AMaxNumber: Integer);
begin
  FName := AThreadName;
  FCurrentNumberRef := ACurrentNumberRef;
  FMaxNumber := AMaxNumber;
end;

procedure TSimpleNumberWriterThread.Execute;
begin
  while not Terminated do
    if fmMain.CriticalSection.TryEnter and CanContinue then
    begin
      FNewNumber := GetNextSimpleNumber(FCurrentNumberRef^);
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

function TSimpleNumberWriterThread.CanContinue: Boolean;
begin
  Result := FCurrentNumberRef^ < FMaxNumber;
end;

function TSimpleNumberWriterThread.GetNextSimpleNumber(const ACurrentSimpleNumber: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
//  I := ACurrentSimpleNumber + 2;
  I := ACurrentSimpleNumber + 1;
  while (I < FMaxNumber) and not Terminated {Is needed?} do
  begin
    if IsSimpleNumber(I) then
    begin
      Result := I;
      Break;
    end
    else
//      Inc(I, 2);
      Inc(I);
  end;
end;

function TSimpleNumberWriterThread.IsSimpleNumber(
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

procedure TSimpleNumberWriterThread.SaveNewNumber;
begin
  fmMain.mmResults.Lines.Add(FName + ': ' + IntToStr(FNewNumber));
  if FName[Length(FName)] = '1' then
    fmMain.Memo1.Lines.Add(FName + ': ' + IntToStr(FNewNumber))
  else
    fmMain.Memo2.Lines.Add(FName + ': ' + IntToStr(FNewNumber));
end;

end.
