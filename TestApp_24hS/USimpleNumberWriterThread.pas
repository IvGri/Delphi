unit USimpleNumberWriterThread;

interface

uses
  Classes, Windows, SysUtils;

type
  TSimpleNumberWriterThread = class(TThread)
  strict private
    FCurrentNumberRef: PInteger;
    FMaxNumber: Integer;
    FName: string;
    //
    function CanContinue: Boolean; inline;
    function GetNextSimpleNumber(const ACurrentSimpleNumber: Integer): Integer;
    function IsSimpleNumber(const ANumber: Integer): Boolean;
    procedure SaveCurrentNumber(const ACurrentSimpleNumber: Integer);
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
var
  ANewNumber: Integer;
begin
  while not Terminated do
  begin
    if fmMain.CriticalSection.TryEnter and CanContinue then
    begin
      ANewNumber := GetNextSimpleNumber(FCurrentNumberRef^);
      if (ANewNumber <> -1) and (ANewNumber < FMaxNumber) then
      begin
        FCurrentNumberRef^ := ANewNumber;
        SaveCurrentNumber(ANewNumber);
  //      Synchronize(SaveCurrentNumber);
      end;
      fmMain.CriticalSection.Leave;
    end;
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

procedure TSimpleNumberWriterThread.SaveCurrentNumber(const ACurrentSimpleNumber: Integer);
begin
  fmMain.mmResults.Lines.Add(FName + ': ' + IntToStr(ACurrentSimpleNumber));
  if FName[Length(FName)] = '1' then
    fmMain.Memo1.Lines.Add(FName + ': ' + IntToStr(ACurrentSimpleNumber))
  else
    fmMain.Memo2.Lines.Add(FName + ': ' + IntToStr(ACurrentSimpleNumber));
end;

end.
