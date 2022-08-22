object fmMeasurersToCheck: TfmMeasurersToCheck
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1057#1095#1077#1090#1095#1080#1082#1080', '#1082#1086#1090#1086#1088#1099#1084' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1087#1086#1074#1077#1088#1082#1072
  ClientHeight = 162
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 130
  Constraints.MinWidth = 400
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
    Width = 384
    Height = 162
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 300
    ExplicitHeight = 250
    object lbMeasurersToCheck: TcxListBox
      Left = 10
      Top = 28
      Width = 364
      Height = 93
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
      Top = 127
      Width = 364
      Height = 25
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
      TabOrder = 1
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lilbMeasurersToCheck: TdxLayoutItem
      Parent = lcMainGroup_Root
      AlignVert = avClient
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
