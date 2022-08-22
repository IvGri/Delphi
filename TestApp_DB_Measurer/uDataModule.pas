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
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
