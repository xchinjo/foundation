object FrmSearchDonator: TFrmSearchDonator
  Left = 484
  Top = 137
  Width = 724
  Height = 514
  Caption = 'FrmSearchDonator'
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pnHeader: TRzPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 28
    Align = alTop
    BorderOuter = fsNone
    Color = 6702336
    TabOrder = 0
    object lbHeader: TRzLabel
      Left = 8
      Top = 6
      Width = 182
      Height = 16
      Caption = #3619#3634#3618#3594#3639#3656#3629#3612#3641#3657#3610#3619#3636#3592#3634#3588'(Donator List)'
      Font.Charset = THAI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 28
    Width = 708
    Height = 448
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 708
      Height = 448
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        DataController.DataSource = frmInsigniaRegister.DsSearch
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGrid1DBTableView1do_id: TcxGridDBColumn
          Caption = #3627#3617#3634#3618#3648#3621#3586
          MinWidth = 117
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 117
          DataBinding.FieldName = 'do_id'
        end
        object cxGrid1DBTableView1do_prename2: TcxGridDBColumn
          Caption = #3594#3639#3656#3629#3627#3609#3657#3634
          MinWidth = 164
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 164
          DataBinding.FieldName = 'do_prename'
        end
        object cxGrid1DBTableView1do_name: TcxGridDBColumn
          Caption = #3594#3639#3656#3629
          MinWidth = 201
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 201
          DataBinding.FieldName = 'do_name'
        end
        object cxGrid1DBTableView1do_lname: TcxGridDBColumn
          Caption = #3609#3634#3617#3626#3585#3640#3621
          MinWidth = 204
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 204
          DataBinding.FieldName = 'do_lname'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
end
