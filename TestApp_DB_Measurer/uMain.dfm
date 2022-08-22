object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Measurers App'
  ClientHeight = 384
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grMain: TcxGrid
    Left = 0
    Top = 126
    Width = 550
    Height = 258
    Align = alClient
    TabOrder = 0
    object grMainDBTableViewLR: TcxGridDBTableView
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
      OnFocusedRecordChanged = grMainDBTableViewLRFocusedRecordChanged
      DataController.DataSource = dmMain.dsLocationsWithReadings
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.DataRowSizing = True
      OptionsData.Appending = True
      OptionsData.Editing = False
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmSmartTag
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object grMainDBTableViewLRID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object grMainDBTableViewLRStreet: TcxGridDBColumn
        DataBinding.FieldName = 'Street'
      end
      object grMainDBTableViewLRHouse: TcxGridDBColumn
        DataBinding.FieldName = 'House'
        Width = 54
      end
      object grMainDBTableViewLRRoom: TcxGridDBColumn
        DataBinding.FieldName = 'Room'
        Width = 49
      end
      object grMainDBTableViewLRReading: TcxGridDBColumn
        DataBinding.FieldName = 'Reading'
      end
    end
    object grMainLevelLR: TcxGridLevel
      GridView = grMainDBTableViewLR
    end
  end
  object rMain: TdxRibbon
    Left = 0
    Top = 0
    Width = 550
    Height = 126
    BarManager = bmMain
    ColorSchemeName = 'Blue'
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object rtActions: TdxRibbonTab
      Active = True
      Caption = 'Actions'
      Groups = <
        item
          ToolbarName = 'bMainActions'
        end>
      Index = 0
    end
    object rtSettings: TdxRibbonTab
      Caption = 'Settings'
      Groups = <
        item
          ToolbarName = 'bGridViewSettings'
        end>
      Index = 1
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
    Left = 304
    Top = 8
    PixelsPerInch = 96
    object bMainActions: TdxBar
      Caption = 'Actions for selected location'
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
        end
        item
          Visible = True
          ItemName = 'blbUpdateReading'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bGridViewSettings: TdxBar
      Caption = 'Grid settings'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 550
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'blbShowGroupByBox'
        end
        item
          Visible = True
          ItemName = 'blbShowNewItemRow'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object blbShowMeasurersToCheck: TdxBarLargeButton
      Caption = 'Show measurers, that need check'
      Category = 0
      Enabled = False
      Hint = 'Show measurers, that need check'
      Visible = ivAlways
      OnClick = blbShowMeasurersToCheckClick
    end
    object blbUpdateReading: TdxBarLargeButton
      Caption = 'Update reading'
      Category = 0
      Enabled = False
      Hint = 'Update reading'
      Visible = ivAlways
      OnClick = blbUpdateReadingClick
    end
    object blbShowGroupByBox: TdxBarLargeButton
      Caption = 'Show Group Box'
      Category = 0
      Hint = 'Show Group Box'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = blbShowGroupByBoxClick
    end
    object blbShowNewItemRow: TdxBarLargeButton
      Caption = 'Show New Item Row'
      Category = 0
      Hint = 'Show New Item Row'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = blbShowNewItemRowClick
    end
  end
end
