object dmMain: TdmMain
  OldCreateOrder = False
  Height = 165
  Width = 373
  object ADOConnection: TADOConnection
    ConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MeasurersDB.mdb;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 64
    Top = 8
  end
  object ADOdsLocationsWithReadings: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT L.ID, L.Street, L.House, L.Room, R.Reading FROM Locations' +
      ' AS L, Readings AS R WHERE L.ID = R.ID'
    Parameters = <>
    Left = 64
    Top = 64
  end
  object dsLocationsWithReadings: TDataSource
    DataSet = ADOdsLocationsWithReadings
    Left = 64
    Top = 112
  end
end
