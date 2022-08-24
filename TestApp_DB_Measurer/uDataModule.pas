unit uDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmMain = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOdsLocationsWithReadings: TADODataSet;
    dsLocationsWithReadings: TDataSource;
    ADOqMeasurersToCheck: TADOQuery;
    dsMeasurersToCheck: TDataSource;
    ADOqUpdateReading: TADOQuery;
    ADOqFindSerialNumber: TADOQuery;
    ADOqAddNewMeasurer: TADOQuery;
    ADOqAddNewCheck: TADOQuery;
    ADOqAddNewLocation: TADOQuery;
    ADOqDeleteFromMeasurers: TADOQuery;
    ADOqDeleteFromChecks: TADOQuery;
    ADOqDeleteFromLocations: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MeasurersDB.mdb;'
end;

end.
