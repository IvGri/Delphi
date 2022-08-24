object dmMain: TdmMain
  OldCreateOrder = False
  Height = 261
  Width = 573
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Work\GitHub\Delp' +
      'hi\TestApp_DB_Measurer\MeasurersDB.mdb;'
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
      'SELECT'#13#10'  L.Street, L.House, L.Room, L.Measurer, L.PrevMeasurers' +
      ', M.Reading, M.SerialNumber'#13#10'FROM'#13#10'  Locations AS L, Measurers A' +
      'S M'#13#10'WHERE'#13#10'  L.Measurer = M.SerialNumber'
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
        Size = -1
        Value = Null
      end
      item
        Name = 'pHouse'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  C.Measurer'
      'FROM'
      '  Checks as C, Locations AS L'
      'WHERE'
      '  C.NextCheck <= NOW()'
      '  AND'
      '  L.Street = :pStreet'
      '  AND'
      '  L.House = :pHouse'
      '  AND'
      '  C.Measurer = L.Measurer')
    Left = 208
    Top = 64
  end
  object dsMeasurersToCheck: TDataSource
    DataSet = ADOqMeasurersToCheck
    Left = 208
    Top = 112
  end
  object ADOqUpdateReading: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pNewReading'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'pSerialNumber'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE'
      '  Measurers'
      'SET'
      '  Reading = :pNewReading,'
      '  ReadingDate = NOW()'
      'WHERE'
      '  SerialNumber = :pSerialNumber')
    Left = 336
    Top = 64
  end
  object ADOqFindSerialNumber: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pSerialNumber'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  SerialNumber'
      'FROM'
      '  Measurers'
      'WHERE'
      '  SerialNumber = :pSerialNumber')
    Left = 456
    Top = 64
  end
  object ADOqAddNewMeasurerToMeasurers: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pSerialNumber'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'pReading'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO'
      '  Measurers'
      '  (SerialNumber, Reading, ReadingDate)'
      'VALUES'
      '  (:pSerialNumber, :pReading, NOW())')
    Left = 456
    Top = 112
  end
  object ADOqAddNewMeasurerToChecks: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pMeasurer'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'pPrevCheck'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'pNextCheck'
        DataType = ftDateTime
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO'
      '  Checks'
      '  (Measurer, PrevCheck, NextCheck)'
      'VALUES'
      '  (:pMeasurer, :pPrevCheck, :pNextCheck)')
    Left = 456
    Top = 160
  end
  object ADOqAddNewMeasurerToLocations: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pMeasurer'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'pStreet'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pHouse'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'pRoom'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO'
      '  Locations'
      '  (Measurer, Street, House, Room)'
      'VALUES'
      '  (:pMeasurer, :pStreet, :pHouse, :pRoom)')
    Left = 456
    Top = 208
  end
end
