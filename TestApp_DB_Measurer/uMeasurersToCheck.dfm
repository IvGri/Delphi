object fmMeasurersToCheck: TfmMeasurersToCheck
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Measurers, that need check'
  ClientHeight = 235
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
  object grMain: TcxGrid
    Left = 0
    Top = 0
    Width = 384
    Height = 235
    Align = alClient
    TabOrder = 0
    object grMainDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dmMain.dsMeasurersToCheck
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object grMainDBTableViewColumn: TcxGridDBColumn
        DataBinding.IsNullValueType = True
      end
    end
    object grMainLevel: TcxGridLevel
      GridView = grMainDBTableView
    end
  end
end
