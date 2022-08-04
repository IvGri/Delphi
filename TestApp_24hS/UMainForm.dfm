object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Threads Test Application'
  ClientHeight = 297
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbThreadsCount: TLabel
    Left = 24
    Top = 55
    Width = 73
    Height = 13
    Caption = 'Threads count:'
  end
  object btnRunThreads: TButton
    Left = 207
    Top = 8
    Width = 75
    Height = 73
    Caption = ' Run Test'
    TabOrder = 0
    OnClick = btnRunThreadsClick
  end
  object mmResults: TMemo
    Left = 8
    Top = 87
    Width = 461
    Height = 202
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object gbParams: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 73
    Caption = 'Parameters of test'
    TabOrder = 2
    object lbMaxValue: TLabel
      Left = 16
      Top = 19
      Width = 53
      Height = 13
      Caption = 'Max value:'
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
    end
  end
  object seThreadsCount: TSpinEdit
    Left = 103
    Top = 52
    Width = 86
    Height = 22
    MaxValue = 8
    MinValue = 1
    TabOrder = 3
    Value = 2
  end
end
