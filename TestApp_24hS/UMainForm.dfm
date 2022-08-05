object fmMain: TfmMain
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Threads Test Application'
  ClientHeight = 248
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnRunThreads: TButton
    Left = 199
    Top = 0
    Width = 75
    Height = 97
    Caption = ' Run Test'
    Default = True
    TabOrder = 0
    OnClick = btnRunThreadsClick
  end
  object mmResults: TMemo
    Left = 0
    Top = 103
    Width = 460
    Height = 145
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    Visible = False
  end
  object gbParams: TGroupBox
    Left = 0
    Top = 0
    Width = 193
    Height = 97
    Caption = 'Parameters of test'
    TabOrder = 2
    object lbMaxValue: TLabel
      Left = 16
      Top = 21
      Width = 53
      Height = 13
      Caption = 'Max value:'
    end
    object lbThreadsCount: TLabel
      Left = 16
      Top = 47
      Width = 73
      Height = 13
      Caption = 'Threads count:'
    end
    object lbWarning1: TLabel
      Left = 8
      Top = 71
      Width = 5
      Height = 17
      Caption = '!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbWarning2: TLabel
      Left = 181
      Top = 71
      Width = 5
      Height = 19
      Caption = '!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object seMaxValue: TSpinEdit
      Left = 95
      Top = 16
      Width = 86
      Height = 22
      Increment = 10
      MaxValue = 100000000
      MinValue = 2
      TabOrder = 0
      Value = 100
      OnChange = WarningsVisibilityUpdateHandler
    end
    object seThreadsCount: TSpinEdit
      Left = 95
      Top = 44
      Width = 86
      Height = 22
      MaxValue = 32
      MinValue = 1
      TabOrder = 1
      Value = 2
    end
    object chbStoreResultToMemo: TCheckBox
      Left = 16
      Top = 72
      Width = 165
      Height = 17
      Hint = 
        'This option is not recommended if "Max value" is greater then 20' +
        '00 - in such cases information in memo can be not accurate and p' +
        'erformance of test is affected drastically.'
      Caption = 'Store results to file AND memo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = WarningsVisibilityUpdateHandler
    end
  end
  object gbResults: TGroupBox
    Left = 280
    Top = 0
    Width = 181
    Height = 97
    Caption = 'Test results'
    TabOrder = 3
    Visible = False
    object lbResultsCountCaption: TLabel
      Left = 16
      Top = 19
      Width = 119
      Height = 13
      Caption = 'Count of prime numbers:'
    end
    object lbTestDurationCaption: TLabel
      Left = 16
      Top = 57
      Width = 80
      Height = 13
      Caption = 'Duration of test:'
    end
    object lbResultsCount: TLabel
      Left = 40
      Top = 38
      Width = 17
      Height = 13
      Caption = '%d'
    end
    object lbTestDuration: TLabel
      Left = 40
      Top = 76
      Width = 58
      Height = 13
      Caption = '%s seconds'
    end
  end
end
