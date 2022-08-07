object frmGIBDDHelper: TfrmGIBDDHelper
  Left = 0
  Top = 0
  AutoSize = True
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' '#1074' '#1043#1048#1041#1044#1044
  ClientHeight = 377
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoadPhoto: TButton
    Left = 0
    Top = 0
    Width = 600
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1102
    TabOrder = 0
    OnClick = btnLoadPhotoClick
  end
  object pnControls: TPanel
    Left = 0
    Top = 26
    Width = 600
    Height = 351
    BevelOuter = bvNone
    TabOrder = 1
    object imPhoto: TImage
      Left = 0
      Top = 5
      Width = 201
      Height = 346
      ParentShowHint = False
      Proportional = True
      ShowHint = False
    end
    object lbDateTime: TLabel
      Left = 207
      Top = 9
      Width = 72
      Height = 13
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103':'
    end
    object lbGN: TLabel
      Left = 207
      Top = 35
      Width = 58
      Height = 13
      Caption = #1043#1086#1089'. '#1085#1086#1084#1077#1088':'
    end
    object lbGN2: TLabel
      Left = 385
      Top = 35
      Width = 18
      Height = 13
      Caption = '(2):'
    end
    object lbGN3: TLabel
      Left = 488
      Top = 35
      Width = 18
      Height = 13
      Caption = '(3):'
    end
    object lbPlace: TLabel
      Left = 207
      Top = 62
      Width = 35
      Height = 13
      Caption = #1052#1077#1089#1090#1086':'
    end
    object lbGN1: TLabel
      Left = 282
      Top = 35
      Width = 18
      Height = 13
      Caption = '(1):'
    end
    object btnGenerateReport: TButton
      Left = 207
      Top = 132
      Width = 393
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      TabOrder = 0
      OnClick = btnGenerateReportClick
    end
    object cbPlace: TComboBox
      Left = 306
      Top = 59
      Width = 294
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        #1058#1088#1086#1090#1091#1072#1088' '#1091' '#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1090#1088#1072#1084#1074#1072#1103
        #1055#1086' '#1051#1077#1081#1090#1077#1081#1079#1077#1085#1072' '#1074' '#1089#1090#1086#1088#1086#1085#1091' '#1052#1086#1089#1080#1085#1072
        #1055#1077#1096#1077#1093#1086#1076#1085#1099#1081' '#1087#1077#1088#1077#1093#1086#1076' '#1088#1103#1076#1086#1084' '#1089' '#1086#1089#1090#1072#1085#1086#1074#1082#1086#1081' '#1090#1088#1072#1084#1074#1072#1103
        #1053#1072#1087#1088#1086#1090#1080#1074' '#1050#1086#1085#1089#1091#1083#1100#1090#1072#1085#1090'-'#1072)
    end
    object chbIncludeEditedPhoto: TCheckBox
      Left = 207
      Top = 109
      Width = 158
      Height = 17
      Caption = #1059#1082#1072#1079#1072#1085#1072' '#1079#1086#1085#1072' '#1090#1088#1086#1090#1091#1072#1088#1072
      TabOrder = 2
    end
    object chbMultiplePhotos: TCheckBox
      Left = 207
      Top = 86
      Width = 130
      Height = 17
      Caption = #1052#1085#1086#1075#1086' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1081
      TabOrder = 3
    end
    object meGN1: TMaskEdit
      Left = 306
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 4
    end
    object meGN2: TMaskEdit
      Left = 409
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 5
    end
    object meGN3: TMaskEdit
      Left = 512
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 6
    end
    object mmReport: TMemo
      Left = 207
      Top = 163
      Width = 393
      Height = 188
      ScrollBars = ssVertical
      TabOrder = 7
    end
  end
  object edDate: TEdit
    Left = 306
    Top = 31
    Width = 119
    Height = 21
    TabOrder = 2
  end
  object edTime: TEdit
    Left = 431
    Top = 31
    Width = 73
    Height = 21
    TabOrder = 3
  end
  object OPD: TOpenPictureDialog
    Filter = 
      'All|*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wm' +
      'f'
    Left = 16
    Top = 40
  end
end
