object FrmSearchDonatorSp: TFrmSearchDonatorSp
  Left = 388
  Top = 131
  Width = 660
  Height = 480
  Caption = 'FrmSearchDonatorSp'
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 442
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 0
    object pnHeader: TRzPanel
      Left = 0
      Top = 0
      Width = 644
      Height = 28
      Align = alTop
      BorderOuter = fsNone
      Color = 8404992
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
    object cxGrid1: TcxGrid
      Left = 0
      Top = 28
      Width = 644
      Height = 414
      Align = alClient
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        DataController.DataSource = frmFavorRegister.DsSearch
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          Caption = #3627#3617#3634#3618#3648#3621#3586
          MinWidth = 101
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 101
          DataBinding.FieldName = 'do_id'
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          Caption = #3594#3639#3656#3629#3627#3609#3657#3634
          MinWidth = 149
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 149
          DataBinding.FieldName = 'do_prename'
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          Caption = #3594#3639#3656#3629
          MinWidth = 180
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 180
          DataBinding.FieldName = 'do_name'
        end
        object cxGrid1DBTableView1Column4: TcxGridDBColumn
          Caption = #3609#3634#3617#3626#3585#3640#3621
          MinWidth = 180
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 180
          DataBinding.FieldName = 'do_lname'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
end
