object FrmDnoinquiry: TFrmDnoinquiry
  Left = 183
  Top = 29
  Width = 988
  Height = 561
  Caption = 'FrmDnoinquiry'
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PaneClient: TRzPanel
    Left = 0
    Top = 4
    Width = 980
    Height = 529
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 0
    object pnHeader: TRzPanel
      Left = 0
      Top = 0
      Width = 980
      Height = 28
      Align = alTop
      BorderOuter = fsNone
      Color = 5832793
      TabOrder = 0
      object lbHeader: TRzLabel
        Left = 8
        Top = 6
        Width = 252
        Height = 16
        Caption = #3626#3629#3610#3606#3634#3617#3585#3634#3619#3610#3619#3636#3592#3634#3588' ( Donations Inquiry )'
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PageDI: TRzPageControl
      Left = 0
      Top = 28
      Width = 980
      Height = 60
      ActivePage = TB1
      Align = alTop
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowShadow = False
      TabIndex = 0
      TabOrder = 1
      TabStyle = tsRoundCorners
      FixedDimension = 20
      object TB1: TRzTabSheet
        Caption = '     '#3619#3634#3618#3623#3633#3609'   '
        object RzPanel7: TRzPanel
          Left = 0
          Top = 0
          Width = 617
          Height = 35
          Align = alLeft
          BorderOuter = fsNone
          TabOrder = 0
          DesignSize = (
            617
            35)
          object Label3: TLabel
            Left = 3
            Top = 7
            Width = 70
            Height = 24
            AutoSize = False
            Caption = '  '#3623#3633#3609#3607#3637#3656
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label1: TLabel
            Left = 248
            Top = 7
            Width = 66
            Height = 24
            AutoSize = False
            Caption = '  '#3606#3638#3591#3623#3633#3609#3607#3637#3656
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object DtStart: TRzDateTimeEdit
            Left = 76
            Top = 7
            Width = 169
            Height = 22
            EditType = etDate
            AutoSelect = False
            FrameVisible = True
            TabOrder = 0
            OnKeyDown = DtStartKeyDown
          end
          object DtEnd: TRzDateTimeEdit
            Left = 313
            Top = 7
            Width = 169
            Height = 24
            EditType = etDate
            AutoSize = False
            FrameVisible = True
            TabOrder = 1
            OnKeyDown = DtStartKeyDown
          end
          object BtnSearch1: TRzBitBtn
            Left = 500
            Top = 4
            Width = 96
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3588#3657#3609#3627#3634'...'
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
            OnClick = BtnSearch1Click
          end
        end
      end
      object TB2: TRzTabSheet
        Caption = '     '#3619#3634#3618#3591#3623#3604'    '
        object RzPanel2: TRzPanel
          Left = 0
          Top = 0
          Width = 978
          Height = 35
          Align = alClient
          BorderOuter = fsNone
          TabOrder = 0
          object RzPanel8: TRzPanel
            Left = 0
            Top = 0
            Width = 609
            Height = 35
            Align = alLeft
            BorderOuter = fsNone
            TabOrder = 0
            DesignSize = (
              609
              35)
            object Label4: TLabel
              Left = 248
              Top = 7
              Width = 66
              Height = 24
              AutoSize = False
              Caption = '  '#3606#3638#3591#3591#3623#3604#3607#3637#3656
              Color = clSilver
              Font.Charset = THAI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object Label2: TLabel
              Left = 2
              Top = 7
              Width = 70
              Height = 24
              AutoSize = False
              Caption = '  '#3591#3623#3604#3607#3637#3656
              Color = clSilver
              Font.Charset = THAI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object BtnSearch2: TRzBitBtn
              Left = 500
              Top = 4
              Width = 96
              Height = 27
              Anchors = [akTop, akRight]
              Caption = #3588#3657#3609#3627#3634'...'
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
              OnClick = BtnSearch2Click
            end
            object TxtEnd: TRzEdit
              Left = 313
              Top = 7
              Width = 169
              Height = 24
              AutoSize = False
              FrameVisible = True
              TabOrder = 0
              OnKeyDown = TxtStartKeyDown
            end
            object TxtStart: TRzEdit
              Left = 76
              Top = 7
              Width = 169
              Height = 24
              AutoSize = False
              FrameVisible = True
              TabOrder = 2
              OnKeyDown = TxtStartKeyDown
            end
          end
        end
      end
    end
    object RzPanel3: TRzPanel
      Left = 0
      Top = 486
      Width = 980
      Height = 43
      Align = alBottom
      BorderOuter = fsButtonUp
      TabOrder = 2
      object RzLabel2: TRzLabel
        Left = 187
        Top = 12
        Width = 55
        Height = 24
        AutoSize = False
        Caption = ' '#3618#3629#3604#3619#3623#3617
        Color = clBlack
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object RzLabel3: TRzLabel
        Left = 385
        Top = 12
        Width = 44
        Height = 24
        AutoSize = False
        Caption = ' '#3610#3634#3607
        Color = clBlack
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object TxtTotal: TRzDBLabel
        Left = 242
        Top = 12
        Width = 143
        Height = 24
        Alignment = taCenter
        Color = 3815994
        Font.Charset = THAI_CHARSET
        Font.Color = clLime
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        DataField = 'btotalx'
        DataSource = DsSearch
      end
      object RzLabel4: TRzLabel
        Left = 6
        Top = 12
        Width = 58
        Height = 24
        AutoSize = False
        Caption = ' '#3592#3635#3609#3623#3609
        Color = clBlack
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        BorderColor = clGreen
      end
      object TxtJ: TRzLabel
        Left = 64
        Top = 12
        Width = 48
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Color = 3815994
        Font.Charset = THAI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object RzLabel5: TRzLabel
        Left = 112
        Top = 12
        Width = 60
        Height = 24
        AutoSize = False
        Caption = ' '#3619#3634#3618#3585#3634#3619
        Color = clBlack
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        BorderColor = clSilver
      end
      object RzPanel6: TRzPanel
        Left = 590
        Top = 2
        Width = 388
        Height = 39
        Align = alRight
        BorderOuter = fsNone
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 22
          Top = 11
          Width = 65
          Height = 16
          Caption = #3612#3641#3657#3619#3633#3610#3610#3619#3636#3592#3634#3588
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TxtUser: TRzDBEdit
          Left = 97
          Top = 8
          Width = 166
          Height = 24
          DataSource = DsSearch
          DataField = 'Us_name'
          FrameVisible = True
          TabOrder = 0
        end
      end
    end
    object RzPanel4: TRzPanel
      Left = 0
      Top = 88
      Width = 980
      Height = 32
      Align = alTop
      BorderOuter = fsNone
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label5: TLabel
        Left = 4
        Top = 5
        Width = 73
        Height = 22
        AutoSize = False
        Caption = ' '#3594#3639#3656#3629#3612#3641#3657#3610#3619#3636#3592#3634#3588
        Color = clSilver
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label6: TLabel
        Left = 250
        Top = 5
        Width = 83
        Height = 22
        AutoSize = False
        Caption = ' '#3626#3585#3640#3621#3612#3641#3657#3610#3619#3636#3592#3634#3588
        Color = clSilver
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object RzDBEdit1: TRzDBEdit
        Left = 80
        Top = 4
        Width = 166
        Height = 24
        DataSource = DsSearch
        DataField = 'do_name'
        AutoSize = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        FrameVisible = True
        ParentFont = False
        TabOrder = 0
      end
      object RzDBEdit2: TRzDBEdit
        Left = 337
        Top = 4
        Width = 199
        Height = 24
        DataSource = DsSearch
        DataField = 'do_lname'
        AutoSize = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        FrameVisible = True
        ParentFont = False
        TabOrder = 1
      end
    end
    object RzPanel5: TRzPanel
      Left = 0
      Top = 120
      Width = 980
      Height = 366
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 4
      object RzPanel9: TRzPanel
        Left = 0
        Top = 0
        Width = 545
        Height = 366
        Align = alLeft
        BorderOuter = fsNone
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 545
          Height = 366
          Align = alClient
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            DataController.DataSource = DsSearch
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OnCustomDrawColumnHeader = cxGrid1DBTableView1CustomDrawColumnHeader
            object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
              Caption = #3591#3623#3604#3607#3637#3656
              MinWidth = 84
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 84
              DataBinding.FieldName = 'bperiod'
            end
            object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
              Caption = #3623#3633#3609#3607#3637#3656
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
              DataBinding.FieldName = 'bdate'
            end
            object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
              Caption = #3648#3621#3586#3607#3637#3656#3610#3636#3621
              MinWidth = 190
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 190
              DataBinding.FieldName = 'bno'
            end
            object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
              Caption = #3618#3629#3604#3610#3619#3636#3592#3634#3588
              MinWidth = 122
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 122
              DataBinding.FieldName = 'btotal'
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
      object RzPanel10: TRzPanel
        Left = 545
        Top = 0
        Width = 10
        Height = 366
        Align = alLeft
        BorderOuter = fsNone
        Color = clSilver
        TabOrder = 1
      end
      object cxGrid2: TcxGrid
        Left = 555
        Top = 0
        Width = 425
        Height = 366
        Align = alClient
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object cxGrid2DBTableView1: TcxGridDBTableView
          DataController.DataSource = DsBillDetail
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OnCustomDrawColumnHeader = cxGrid2DBTableView1CustomDrawColumnHeader
          object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #3650#3588#3619#3591#3585#3634#3619
            MinWidth = 274
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 274
            DataBinding.FieldName = 'o_title'
          end
          object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
            Caption = #3618#3629#3604#3648#3591#3636#3609
            MinWidth = 104
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 104
            DataBinding.FieldName = 'bdamount'
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
  end
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 1
    VisualStyle = vsGradient
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
      'DataBase=fddb_temp2'
      'DriverName=DevartSQLServer'
      'User_Name=sa'
      'Password=Uit@uit'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    Left = 18
    Top = 241
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataSet
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText]
    Left = 18
    Top = 337
  end
  object SQLDataSet: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 18
    Top = 289
  end
  object CdsSearch: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    AfterScroll = CdsSearchAfterScroll
    Left = 18
    Top = 385
  end
  object DsSearch: TDataSource
    DataSet = CdsSearch
    Left = 16
    Top = 433
  end
  object CdsBillDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 82
    Top = 385
  end
  object DsBillDetail: TDataSource
    DataSet = CdsBillDetail
    Left = 80
    Top = 433
  end
end
