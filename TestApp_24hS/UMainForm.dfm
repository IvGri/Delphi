object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Threads Test Application'
  ClientHeight = 263
  ClientWidth = 635
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
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = ' Run Threads'
    TabOrder = 0
    OnClick = btnRunThreadsClick
  end
  object mmResults: TMemo
    Left = 8
    Top = 39
    Width = 601
    Height = 202
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
