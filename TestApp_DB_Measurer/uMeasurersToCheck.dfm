object fmMeasurersToCheck: TfmMeasurersToCheck
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsDialog
  Caption = #1057#1095#1077#1090#1095#1080#1082#1080', '#1082#1086#1090#1086#1088#1099#1084' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1087#1086#1074#1077#1088#1082#1072
  ClientHeight = 250
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 300
    Height = 250
    TabOrder = 0
    AutoSize = True
    object lbMeasurersToCheck: TcxListBox
      Left = 10
      Top = 28
      Width = 239
      Height = 165
      ItemHeight = 13
      ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = cbs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 0
    end
    object btnCopyToClipboard: TcxButton
      Left = 10
      Top = 199
      Width = 239
      Height = 25
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
      TabOrder = 1
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lilbMeasurersToCheck: TdxLayoutItem
      Parent = lcMainGroup_Root
      CaptionOptions.Text = #1057#1095#1077#1090#1095#1080#1082#1080' '#1076#1086#1084#1072' '#1061', '#1082#1086#1090#1086#1088#1099#1084' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1087#1086#1074#1077#1088#1082#1072
      CaptionOptions.Layout = clTop
      Control = lbMeasurersToCheck
      ControlOptions.OriginalHeight = 165
      ControlOptions.OriginalWidth = 215
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object libtnCopyToClipboard: TdxLayoutItem
      Parent = lcMainGroup_Root
      Control = btnCopyToClipboard
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
