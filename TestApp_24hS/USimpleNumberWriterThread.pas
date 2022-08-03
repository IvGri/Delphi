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

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TSimpleNumberWriterThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

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
  NameThreadForDebugging('SimpleNumberWriter');
  { Place thread code here }
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
