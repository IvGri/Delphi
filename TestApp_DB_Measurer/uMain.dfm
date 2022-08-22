object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1059#1095#1077#1090' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
  ClientHeight = 384
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridMain: TcxGrid
    Left = 0
    Top = 126
    Width = 748
    Height = 258
    Align = alClient
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 384
    object cxGridMainDBTableViewRooms: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = True
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      OnFocusedRecordChanged = cxGridMainDBTableViewRoomsFocusedRecordChanged
      DataController.DataSource = dmMain.DataSourcePlace
      DataController.KeyFieldNames = 'fMeasurerIndex'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
      OptionsData.Editing = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmSmartTag
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbWhenSelected
      object cxGridMainDBTableViewRoomsfStreet: TcxGridDBColumn
        Caption = #1059#1083#1080#1094#1072
        DataBinding.FieldName = 'fStreet'
        SortIndex = 0
        SortOrder = soAscending
        Width = 246
      end
      object cxGridMainDBTableViewRoomsfHome: TcxGridDBColumn
        Caption = #1044#1086#1084
        DataBinding.FieldName = 'fHome'
        Width = 69
      end
      object cxGridMainDBTableViewRoomsfRoom: TcxGridDBColumn
        Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        DataBinding.FieldName = 'fRoom'
        Width = 69
      end
      object cxGridMainDBTableViewRoomsfMeasurerIndex: TcxGridDBColumn
        Caption = #8470' '#1089#1095#1077#1090#1095#1080#1082#1072
        DataBinding.FieldName = 'fMeasurerIndex'
        Visible = False
        Width = 69
      end
    end
    object cxGridMainDBTableViewMeasurerData: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dmMain.DataSourceMeasurerData
      DataController.DetailKeyFieldNames = 'fMeasurerIndex'
      DataController.KeyFieldNames = 'fMeasurerIndex'
      DataController.MasterKeyFieldNames = 'fMeasurerIndex'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Editing = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmSmartTag
      OptionsView.ShowColumnFilterButtons = sfbWhenSelected
      object cxGridMainDBTableViewMeasurerDatafMeasurerIndex: TcxGridDBColumn
        Caption = #8470' '#1089#1095#1077#1090#1095#1080#1082#1072
        DataBinding.FieldName = 'fMeasurerIndex'
        Visible = False
      end
      object cxGridMainDBTableViewMeasurerDatafValue: TcxGridDBColumn
        Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103
        DataBinding.FieldName = 'fValue'
      end
      object cxGridMainDBTableViewMeasurerDatafValueDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103' '#1087#1086#1082#1072#1079#1072#1085#1080#1081
        DataBinding.FieldName = 'fValueDate'
        Visible = False
      end
    end
    object cxGridMainLevelRooms: TcxGridLevel
      GridView = cxGridMainDBTableViewRooms
      object cxGridMainLevelMeasurerData: TcxGridLevel
        GridView = cxGridMainDBTableViewMeasurerData
      end
    end
  end
  object rMain: TdxRibbon
    Left = 0
    Top = 0
    Width = 748
    Height = 126
    BarManager = bmMain
    ColorSchemeName = 'Blue'
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object rtActions: TdxRibbonTab
      Active = True
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      Groups = <
        item
          ToolbarName = 'bMainActions'
        end>
      Index = 0
    end
  end
  object bmMain: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 32
    Top = 48
    PixelsPerInch = 96
    object bMainActions: TdxBar
      Caption = #1043#1083#1072#1074#1085#1099#1077
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 776
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'blbShowMeasurersToCheck'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object blbShowMeasurersToCheck: TdxBarLargeButton
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1095#1077#1090#1095#1080#1082#1080' '#1074' '#1074#1099#1073#1088#1072#1085#1085#1086#1084' '#1076#1086#1084#1077', '#1082#1086#1090#1086#1088#1099#1084' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1087#1086#1074#1077#1088#1082#1072
      Category = 0
      Enabled = False
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1095#1077#1090#1095#1080#1082#1080' '#1074' '#1074#1099#1073#1088#1072#1085#1085#1086#1084' '#1076#1086#1084#1077', '#1082#1086#1090#1086#1088#1099#1084' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1087#1086#1074#1077#1088#1082#1072
      Visible = ivAlways
      OnClick = blbShowMeasurersToCheckClick
    end
  end
end
