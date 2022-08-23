object fmMeasurersToCheck: TfmMeasurersToCheck
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Measurers, that need check'
  ClientHeight = 91
  ClientWidth = 284
  Color = clBtnFace
  Constraints.MinHeight = 130
  Constraints.MinWidth = 300
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grMain: TcxGrid
    Left = 0
    Top = 0
    Width = 284
    Height = 91
    Align = alClient
    TabOrder = 0
    object grMainDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dmMain.dsMeasurersToCheck
      DataController.KeyFieldNames = 'Measurer'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object grMainDBTableViewColumn: TcxGridDBColumn
        DataBinding.FieldName = 'Measurer'
        DataBinding.IsNullValueType = True
      end
    end
    object grMainLevel: TcxGridLevel
      GridView = grMainDBTableView
    end
  end
end
