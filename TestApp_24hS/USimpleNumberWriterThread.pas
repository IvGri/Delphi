unit USimpleNumberWriterThread;

interface

uses
  Classes, Windows;

type
  TSimpleNumberWriterThread = class(TThread)
  strict private
    FCurrentNumberRef: PInteger;
    FMaxNumber: Integer;
    FName: string;
    //
    function GetNextSimpleNumber(const ACurrentSimpleNumber: Integer): Integer;
    function IsSimpleNumber(const ANumber: Integer; const AInitialIteratorValue: Integer): Boolean;
    procedure SaveCurrentNumberToFile;
  protected
    procedure Execute; override;
  public
    procedure Initialize(const AThreadName: string; ACurrentNumberRef: PInteger; const AMaxNumber: Integer);
  end;

implementation

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
  // Get new simple number after the current one
  // Save it to the files

  // Do not forget about Terminated check!
end;

function TSimpleNumberWriterThread.GetNextSimpleNumber(const ACurrentSimpleNumber: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  I := ACurrentSimpleNumber + 2;
  while (I < FMaxNumber) do
  begin
    if IsSimpleNumber(I, ACurrentSimpleNumber) then
    begin
      Result := I;
      Break;
    end
    else
      Inc(I, 2);
  end;
end;

function TSimpleNumberWriterThread.IsSimpleNumber(
  const ANumber: Integer; const AInitialIteratorValue: Integer): Boolean;
var
  I: Integer;
begin
  Result := ANumber = 2;
  if (ANumber > 2) and not Odd(ANumber) then
  begin
    Result := True;
    I := AInitialIteratorValue;
    while I <= Sqrt(ANumber) do
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

procedure TSimpleNumberWriterThread.SaveCurrentNumberToFile;
begin
  // Save current number to the main and to the personal file
end;

end.
