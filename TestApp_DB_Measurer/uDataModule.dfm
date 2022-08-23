object dmMain: TdmMain
  OldCreateOrder = False
  Height = 165
  Width = 301
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Work\GitHub\Delp' +
      'hi\TestApp_DB_Measurer\MeasurersDB.mdb;Persist Security Info=Fal' +
      'se'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 64
    Top = 8
  end
  object ADOdsLocationsWithReadings: TADODataSet
    Active = True
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
  object ADOqMeasurersToCheck: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pStreet'
        DataType = ftString
        Value = Null
      end
      item
        Name = 'pHouse'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  L.ID'
      'FROM'
      '  Locations AS L, Checks as C'
      'WHERE'
      '  C.NextCheck <= NOW()'
      '  AND'
      '  L.Street = :pStreet'
      '  AND'
      '  L.House = :pHouse'
      '  AND'
      '  L.ID = C.ID')
    Left = 208
    Top = 64
  end
  object dsMeasurersToCheck: TDataSource
    DataSet = ADOqMeasurersToCheck
    Left = 208
    Top = 112
  end
end
