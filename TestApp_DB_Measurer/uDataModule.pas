unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmMain = class(TDataModule)
    ADOConnection: TADOConnection;
    ADODataSetPlace: TADODataSet;
    ADODataSetMeasurer: TADODataSet;
    ADODataSetMeasurerData: TADODataSet;
    DataSourcePlace: TDataSource;
    DataSourceMeasurer: TDataSource;
    DataSourceMeasurerData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
