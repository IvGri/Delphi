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
    function IsSimpleNumber(const ANumber: Integer; const AInitialIteratorValue: Integer = 3): Boolean;
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
end;

function TSimpleNumberWriterThread.IsSimpleNumber(
  const ANumber: Integer; const AInitialIteratorValue: Integer = 3): Boolean;
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
      end;
      Inc(I, 2);
    end;
  end;
end;

procedure TSimpleNumberWriterThread.SaveCurrentNumberToFile;
begin
  // Save current number to the main and to the personal file
end;

end.
