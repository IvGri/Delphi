object fmNewMeasurerDialog: TfmNewMeasurerDialog
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'New Measurer'
  ClientHeight = 216
  ClientWidth = 560
  Color = clBtnFace
  Constraints.MaxHeight = 255
  Constraints.MinHeight = 255
  Constraints.MinWidth = 576
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
    Width = 560
    Height = 216
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 567
    ExplicitHeight = 225
    object seDefaultReading: TcxSpinEdit
      Left = 417
      Top = 28
      AutoSize = False
      Properties.AssignedValues.MinValue = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object dePrevCheck: TcxDateEdit
      Left = 93
      Top = 85
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
      Properties.OnEditValueChanged = PrevNextCheckPropertiesEditValueChangedhandler
      Properties.OnValidate = PrevNextCheckPropertiesValidateHandler
      ShowHint = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 192
    end
    object deNextCheck: TcxDateEdit
      Left = 351
      Top = 85
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
      Properties.OnEditValueChanged = PrevNextCheckPropertiesEditValueChangedhandler
      Properties.OnValidate = PrevNextCheckPropertiesValidateHandler
      ShowHint = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 187
    end
    object teStreet: TcxTextEdit
      Left = 93
      Top = 142
      ParentShowHint = False
      Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
      Properties.OnValidate = teStreetPropertiesValidate
      ShowHint = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Width = 216
    end
    object seHouse: TcxSpinEdit
      Left = 350
      Top = 142
      Properties.MinValue = 1.000000000000000000
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      TabOrder = 5
      Value = 1
      Width = 75
    end
    object seRoom: TcxSpinEdit
      Left = 463
      Top = 142
      Properties.MinValue = 1.000000000000000000
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      TabOrder = 6
      Value = 1
      Width = 75
    end
    object seSerialNumber: TcxSpinEdit
      Left = 93
      Top = 28
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.MinValue = 1.000000000000000000
      Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
      Properties.OnValidate = seSerialNumberPropertiesValidate
      ShowHint = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.ButtonStyle = bts3D
      TabOrder = 0
      Value = 1
      Width = 236
    end
    object btnAdd: TcxButton
      Left = 363
      Top = 181
      Width = 91
      Height = 25
      Caption = 'Add Measurer'
      ModalResult = 1
      TabOrder = 7
    end
    object btnCancel: TcxButton
      Left = 460
      Top = 181
      Width = 90
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 8
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      ItemIndex = 3
      ShowBorder = False
      Index = -1
    end
    object liseDefaultReading: TdxLayoutItem
      Parent = lgMeasurerInfo
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'Default Reading'
      Control = seDefaultReading
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liteStreet: TdxLayoutItem
      Parent = lgLocationInfo
      AlignHorz = ahClient
      CaptionOptions.Text = 'Street'
      Control = teStreet
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 182
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liseHouse: TdxLayoutItem
      Parent = lgLocationInfo
      AlignHorz = ahRight
      CaptionOptions.Text = 'House'
      Control = seHouse
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liseRoom: TdxLayoutItem
      Parent = lgLocationInfo
      AlignHorz = ahRight
      CaptionOptions.Text = 'Room'
      Control = seRoom
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liseSerialNumber: TdxLayoutItem
      Parent = lgMeasurerInfo
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Serial Number'
      Control = seSerialNumber
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lgLocationInfo: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.Text = 'Location Info'
      LayoutDirection = ldHorizontal
      Index = 2
    end
    object lgMeasurerInfo: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.Text = 'Measurer Info'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object lidePrevCheck: TdxLayoutItem
      Parent = lgCheckInfo
      AlignHorz = ahClient
      CaptionOptions.Text = 'Prev Check'
      Control = dePrevCheck
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lideNextCheck: TdxLayoutItem
      Parent = lgCheckInfo
      AlignHorz = ahClient
      CaptionOptions.Text = 'Next Check'
      Control = deNextCheck
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgCheckInfo: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.Text = 'Check Info'
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object libtnAdd: TdxLayoutItem
      Parent = lgActions
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 91
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object libtnCancel: TdxLayoutItem
      Parent = lgActions
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 90
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgActions: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.Text = 'New Group'
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
  end
end
