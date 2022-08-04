unit USimpleNumberWriterThread;

interface

uses
  Classes, Windows, SysUtils;

type
  TSimpleNumberWriterThread = class(TThread)
  strict private
    FCanContinue: Boolean;
    FCurrentNumberRef: PInteger;
    FMaxNumber: Integer;
    FName: string;
    //
    function GetNextSimpleNumber(const ACurrentSimpleNumber: Integer): Integer;
    function IsSimpleNumber(const ANumber: Integer): Boolean;
    procedure SaveCurrentNumber;
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
  FCanContinue := ACurrentNumberRef^ < FMaxNumber;
end;

procedure TSimpleNumberWriterThread.Execute;
var
  ANewNumber: Integer;
begin
  while not Terminated and FCanContinue do
  begin
    ANewNumber := GetNextSimpleNumber(FCurrentNumberRef^);
    FCanContinue := (ANewNumber <> -1) and (ANewNumber < FMaxNumber);
    if FCanContinue then
    begin
      FCurrentNumberRef^ := ANewNumber;
      SaveCurrentNumber;
//      Synchronize(SaveCurrentNumber);
    end;
  end;
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

procedure TSimpleNumberWriterThread.SaveCurrentNumber;
begin
  fmMain.mmResults.Lines.Add(FName + ': ' + IntToStr(FCurrentNumberRef^));
end;

end.
