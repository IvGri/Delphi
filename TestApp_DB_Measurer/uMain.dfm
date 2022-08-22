object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Measurers App'
  ClientHeight = 384
  ClientWidth = 522
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
    Width = 522
    Height = 258
    Align = alClient
    TabOrder = 0
    object cxGridMainDBTableViewLR: TcxGridDBTableView
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
      OptionsView.ShowColumnFilterButtons = sfbWhenSelected
      object cxGridMainDBTableViewLRID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cxGridMainDBTableViewLRStreet: TcxGridDBColumn
        DataBinding.FieldName = 'Street'
      end
      object cxGridMainDBTableViewLRHouse: TcxGridDBColumn
        DataBinding.FieldName = 'House'
        Width = 54
      end
      object cxGridMainDBTableViewLRRoom: TcxGridDBColumn
        DataBinding.FieldName = 'Room'
        Width = 49
      end
      object cxGridMainDBTableViewLRReading: TcxGridDBColumn
        DataBinding.FieldName = 'Reading'
      end
    end
    object cxGridMainLevelLR: TcxGridLevel
      GridView = cxGridMainDBTableViewLR
    end
  end
  object rMain: TdxRibbon
    Left = 0
    Top = 0
    Width = 522
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
          ToolbarName = 'bmMainBar1'
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
    Left = 32
    Top = 48
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
          ItemName = 'blbUpdateMeasurerValue'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bmMainBar1: TdxBar
      Caption = 'Custom 1'
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
          ItemName = 'dxBarLargeButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
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
    object blbUpdateMeasurerValue: TdxBarLargeButton
      Caption = 'Update reading'
      Category = 0
      Enabled = False
      Hint = 'Update reading'
      Visible = ivAlways
      OnClick = blbUpdateMeasurerValueClick
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'group by box'
      Category = 0
      Hint = 'group by box'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'new item row'
      Category = 0
      Hint = 'new item row'
      Visible = ivAlways
    end
  end
end
