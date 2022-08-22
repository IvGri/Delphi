object dmMain: TdmMain
  OldCreateOrder = False
  Height = 173
  Width = 373
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Work\GitHub\Delp' +
      'hi\TestApp_DB_Measurer\TestDB.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 8
  end
  object ADODataSetPlace: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select fHome, fMeasurerIndex, fRoom, fStreet from tPlace'
    Parameters = <>
    Left = 32
    Top = 64
  end
  object ADODataSetMeasurer: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select fLastCheck, fMeasurerIndex, fNextCheck from tMeasurer'
    Parameters = <>
    Left = 152
    Top = 64
  end
  object ADODataSetMeasurerData: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select fMeasurerIndex, fValue, fValueDate from tMeasurerData'
    Parameters = <>
    Left = 280
    Top = 64
  end
  object DataSourcePlace: TDataSource
    DataSet = ADODataSetPlace
    Left = 32
    Top = 120
  end
  object DataSourceMeasurer: TDataSource
    DataSet = ADODataSetMeasurer
    Left = 152
    Top = 120
  end
  object DataSourceMeasurerData: TDataSource
    DataSet = ADODataSetMeasurerData
    Left = 280
    Top = 120
  end
end
