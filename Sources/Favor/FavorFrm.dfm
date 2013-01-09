object frmFavor: TfrmFavor
  Left = 73
  Top = 69
  Width = 1202
  Height = 694
  Caption = 'Favor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object xTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 1194
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
  end
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 30
    Width = 1194
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 1
    VisualStyle = vsGradient
  end
  object pnClientContainer: TPanel
    Left = 0
    Top = 34
    Width = 1194
    Height = 632
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 0
      Top = 128
      Width = 1194
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter2: TSplitter
      Left = 0
      Top = 564
      Width = 1194
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object pnHeader: TRzPanel
      Left = 0
      Top = 0
      Width = 1194
      Height = 28
      Align = alTop
      BorderOuter = fsNone
      Color = 5832793
      TabOrder = 0
      object lbHeader: TRzLabel
        Left = 8
        Top = 6
        Width = 153
        Height = 16
        Caption = #3610#3633#3605#3619#3629#3640#3611#3585#3634#3619#3632#3588#3640#3603' ( Favor )'
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnButtom: TRzPanel
      Left = 0
      Top = 567
      Width = 1194
      Height = 65
      Align = alBottom
      BorderOuter = fsGroove
      Color = 11579568
      TabOrder = 1
      object btnAddFavor: TRzBitBtn
        Left = 12
        Top = 7
        Width = 126
        Height = 27
        Caption = 'F3-'#3648#3614#3636#3656#3617#3611#3619#3632#3623#3633#3605#3636
        Color = 16753994
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 0
        TabStop = False
        OnClick = btnAddFavorClick
      end
      object BtnEditFavor: TRzBitBtn
        Left = 140
        Top = 7
        Width = 126
        Height = 27
        Caption = 'F7-'#3649#3585#3657#3652#3586#3611#3619#3632#3623#3633#3605#3636
        Color = 16753994
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 1
        TabStop = False
        OnClick = BtnEditFavorClick
      end
      object BtnHistFavor: TRzBitBtn
        Left = 397
        Top = 7
        Width = 215
        Height = 27
        Caption = 'F8-'#3611#3619#3632#3623#3633#3605#3636#3585#3634#3619#3586#3629#3610#3633#3605#3619#3612#3641#3657#3617#3637#3629#3640#3611#3585#3634#3619#3588#3640#3603
        Color = 16753994
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 2
        TabStop = False
        OnClick = BtnHistFavorClick
      end
      object RzBitBtn4: TRzBitBtn
        Left = 614
        Top = 7
        Width = 213
        Height = 27
        Caption = #3648#3614#3636#3656#3617#3619#3632#3604#3633#3610#3610#3633#3605#3619#3612#3641#3657#3617#3637#3629#3640#3611#3585#3634#3619#3588#3640#3603
        Color = 16753994
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 3
        TabStop = False
        OnClick = RzBitBtn4Click
      end
      object BtnDelFavor: TRzBitBtn
        Left = 268
        Top = 7
        Width = 126
        Height = 27
        Caption = 'F9-'#3621#3610#3611#3619#3632#3623#3633#3605#3636
        Color = 16753994
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 4
        TabStop = False
        OnClick = BtnDelFavorClick
      end
    end
    object pnBody: TRzPanel
      Left = 0
      Top = 131
      Width = 1194
      Height = 433
      Align = alClient
      BorderOuter = fsLowered
      Color = 11579568
      TabOrder = 2
      object Splitter3: TSplitter
        Left = 2
        Top = 28
        Width = 1190
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object RzPanel1: TRzPanel
        Left = 2
        Top = 2
        Width = 1190
        Height = 26
        Align = alTop
        BorderOuter = fsNone
        Color = 11579568
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 16
          Top = 5
          Width = 44
          Height = 16
          Caption = #3592#3635#3609#3623#3609' '
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TxtJ: TRzLabel
          Left = 88
          Top = 5
          Width = 8
          Height = 16
          Alignment = taCenter
          Caption = '0'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzLabel3: TRzLabel
          Left = 128
          Top = 5
          Width = 46
          Height = 16
          Caption = #3619#3634#3618#3585#3634#3619
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object cxGrid2: TcxGrid
        Left = 2
        Top = 259
        Width = 1190
        Height = 172
        Align = alClient
        TabOrder = 1
        object cxGrid2DBTableView1: TcxGridDBTableView
          DataController.DataSource = DsBill
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
            Caption = #3648#3621#3586#3607#3637#3656#3651#3610#3648#3626#3619#3655#3592
            MinWidth = 118
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 118
            DataBinding.FieldName = 'bno'
          end
          object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #3623#3633#3609#3607#3637#3656#3610#3619#3636#3592#3634#3588
            MinWidth = 131
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 131
            DataBinding.FieldName = 'bdate'
          end
          object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
            Caption = #3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660
            MinWidth = 293
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 293
            DataBinding.FieldName = 'o_title'
          end
          object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
            Caption = #3585#3629#3591#3607#3640#3609
            MinWidth = 280
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 280
            DataBinding.FieldName = 'o_abbr'
          end
          object cxGrid2DBTableView1DBColumn5: TcxGridDBColumn
            Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
            MinWidth = 143
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 143
            DataBinding.FieldName = 'btotal'
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
      object RzPanel2: TRzPanel
        Left = 2
        Top = 31
        Width = 1190
        Height = 228
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 2
        object RzPanel3: TRzPanel
          Left = 0
          Top = 202
          Width = 1190
          Height = 26
          Align = alBottom
          BorderOuter = fsNone
          BorderColor = clBlack
          Color = 11579568
          TabOrder = 0
          object RzLabel2: TRzLabel
            Left = 16
            Top = 6
            Width = 82
            Height = 16
            Caption = #3592#3635#3609#3623#3609#3651#3610#3648#3626#3619#3655#3592
            Font.Charset = THAI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LbB: TRzLabel
            Left = 117
            Top = 6
            Width = 8
            Height = 16
            Alignment = taCenter
            Caption = '0'
            Font.Charset = THAI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RzLabel5: TRzLabel
            Left = 149
            Top = 6
            Width = 15
            Height = 16
            Caption = #3651#3610
            Font.Charset = THAI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 1190
          Height = 202
          Align = alClient
          TabOrder = 1
          object cxGrid1DBTableView1: TcxGridDBTableView
            OnDblClick = cxGrid1DBTableView1DblClick
            DataController.DataSource = DsSp
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
              Caption = #3648#3621#3586#3607#3637#3656
              MinWidth = 119
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 119
              DataBinding.FieldName = 'spiid'
            end
            object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
              Caption = #3623#3633#3609#3607#3637#3656#3586#3629
              MinWidth = 100
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 100
              DataBinding.FieldName = 'spdate'
            end
            object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
              Caption = #3619#3632#3604#3633#3610#3610#3633#3605#3619
              MinWidth = 195
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 195
              DataBinding.FieldName = 'sp_title'
            end
            object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
              Caption = #3612#3641#3657#3610#3619#3636#3592#3634#3588
              MinWidth = 238
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 238
            end
            object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
              Caption = #3617#3629#3610#3651#3627#3657' '#3594#3639#3656#3629'-'#3626#3585#3640#3621
              MinWidth = 238
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 238
            end
            object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
              Caption = #3618#3629#3604#3648#3591#3636#3609
              MinWidth = 163
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 163
              DataBinding.FieldName = 'sptotal'
            end
            object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
              Visible = False
              MinWidth = 64
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              DataBinding.FieldName = 'spend'
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
    object pnTop: TRzPanel
      Left = 0
      Top = 28
      Width = 1194
      Height = 100
      Align = alTop
      BorderOuter = fsGroove
      TabOrder = 3
      object Label39: TLabel
        Left = 215
        Top = 11
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3594#3639#3656#3629#3612#3641#3657#3610#3619#3636#3592#3634#3588
        Color = 11579568
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label40: TLabel
        Left = 215
        Top = 37
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3609#3634#3617#3626#3585#3640#3621#3612#3641#3657#3610#3619#3636#3592#3634#3588
        Color = 11579568
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object edSearchName: TRzEdit
        Left = 318
        Top = 11
        Width = 305
        Height = 22
        Ctl3D = False
        FocusColor = 16766975
        ParentCtl3D = False
        TabOrder = 0
        OnKeyDown = edSearchNameKeyDown
      end
      object edSearchLName: TRzEdit
        Left = 318
        Top = 37
        Width = 305
        Height = 22
        Ctl3D = False
        FocusColor = 16766975
        ParentCtl3D = False
        TabOrder = 1
        OnKeyDown = edSearchLNameKeyDown
      end
      object btnSearch: TRzBitBtn
        Left = 492
        Top = 62
        Width = 131
        Height = 27
        Caption = #3588#3657#3609#3627#3634#3612#3641#3657#3610#3619#3636#3592#3634#3588'..(F6)'
        Color = 16753919
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 2
        TabStop = False
        OnClick = btnSearchClick
      end
      object DtStart: TRzDateTimeEdit
        Left = 215
        Top = 63
        Width = 135
        Height = 24
        EditType = etDate
        FrameVisible = True
        TabOrder = 3
      end
      object DtEnd: TRzDateTimeEdit
        Left = 351
        Top = 63
        Width = 136
        Height = 24
        EditType = etDate
        FrameVisible = True
        TabOrder = 4
      end
      object RzGroupBox1: TRzGroupBox
        Left = 20
        Top = -1
        Width = 190
        Height = 95
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object R1: TRzRadioButton
          Left = 16
          Top = 17
          Width = 119
          Height = 16
          Caption = #3594#3639#3656#3629'-'#3609#3634#3617#3626#3585#3640#3621#3612#3641#3657#3610#3619#3636#3592#3634#3588
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = R1Click
          OnKeyDown = R1KeyDown
        end
        object R2: TRzRadioButton
          Left = 16
          Top = 41
          Width = 140
          Height = 16
          Caption = #3594#3639#3656#3629'-'#3609#3634#3617#3626#3585#3640#3621' '#3648#3592#3657#3634#3586#3629#3591#3610#3640#3605#3619
          TabOrder = 1
          OnClick = R2Click
          OnKeyDown = R2KeyDown
        end
        object R3: TRzRadioButton
          Left = 16
          Top = 65
          Width = 130
          Height = 16
          Caption = #3623#3633#3609#3607#3637#3656#3586#3629#3610#3633#3605#3619#3629#3640#3611#3585#3634#3619#3632#3588#3640#3603
          TabOrder = 2
          OnClick = R3Click
          OnKeyDown = R3KeyDown
        end
      end
    end
  end
  object Conn: TSQLConnection
    ConnectionName = 'Devart SQL Server'
    DriverName = 'DevartSQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=.'
      'DataBase=fddb_temp'
      'DriverName=DevartSQLServer'
      'User_Name=sa'
      'Password=123456'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    Left = 34
    Top = 297
  end
  object SQLDataSet: TSQLDataSet
    CommandText = 'select 0 as chkbill,* from bill where bryid is null'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 34
    Top = 345
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataSet
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText]
    Left = 34
    Top = 393
  end
  object CdsSp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    AfterScroll = CdsSpAfterScroll
    Left = 88
    Top = 446
  end
  object DsSp: TDataSource
    DataSet = CdsSp
    Left = 88
    Top = 502
  end
  object CdsSearch: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 32
    Top = 446
  end
  object DsSearch: TDataSource
    DataSet = CdsSearch
    Left = 32
    Top = 502
  end
  object CdsBill: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 152
    Top = 446
  end
  object DsBill: TDataSource
    DataSet = CdsBill
    Left = 152
    Top = 502
  end
  object CdsHist: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    OnReconcileError = CdsHistReconcileError
    Left = 600
    Top = 453
  end
  object DsHist: TDataSource
    DataSet = CdsHist
    Left = 600
    Top = 504
  end
  object CdsSp_Code: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 704
    Top = 453
  end
  object DsSpCode: TDataSource
    DataSet = CdsSp_Code
    Left = 704
    Top = 504
  end
end
