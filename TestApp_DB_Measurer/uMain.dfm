object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Measurer Test App'
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
    Top = 0
    Width = 748
    Height = 384
    Align = alClient
    TabOrder = 0
    ExplicitTop = -8
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
      DataController.DataSource = dmMain.DataSourcePlace
      DataController.KeyFieldNames = 'fMeasurerIndex'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmSmartTag
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbWhenSelected
      object cxGridMainDBTableViewRoomsfStreet1: TcxGridDBColumn
        Caption = 'Street'
        DataBinding.FieldName = 'fStreet'
        SortIndex = 0
        SortOrder = soAscending
        Width = 246
      end
      object cxGridMainDBTableViewRoomsfHome1: TcxGridDBColumn
        Caption = 'Home'
        DataBinding.FieldName = 'fHome'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        Width = 69
      end
      object cxGridMainDBTableViewRoomsfRoom1: TcxGridDBColumn
        Caption = 'Room'
        DataBinding.FieldName = 'fRoom'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
        Width = 69
      end
      object cxGridMainDBTableViewRoomsfMeasurerIndex1: TcxGridDBColumn
        Caption = 'MeasurerIndex'
        DataBinding.FieldName = 'fMeasurerIndex'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
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
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmSmartTag
      OptionsView.ShowColumnFilterButtons = sfbWhenSelected
      object cxGridMainDBTableViewMeasurerDatafMeasurerIndex: TcxGridDBColumn
        Caption = 'MeasurerIndex'
        DataBinding.FieldName = 'fMeasurerIndex'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
      end
      object cxGridMainDBTableViewMeasurerDatafValue: TcxGridDBColumn
        Caption = 'Value'
        DataBinding.FieldName = 'fValue'
        FooterAlignmentHorz = taRightJustify
        GroupSummaryAlignment = taRightJustify
      end
      object cxGridMainDBTableViewMeasurerDatafValueDate: TcxGridDBColumn
        Caption = 'ValueDate'
        DataBinding.FieldName = 'fValueDate'
      end
    end
    object cxGridMainLevel1: TcxGridLevel
      GridView = cxGridMainDBTableViewRooms
      object cxGridMainLevel2: TcxGridLevel
        GridView = cxGridMainDBTableViewMeasurerData
      end
    end
  end
end
