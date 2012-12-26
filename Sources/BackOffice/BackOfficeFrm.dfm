object frmBackOffice: TfrmBackOffice
  Left = 302
  Top = 114
  Width = 870
  Height = 540
  Caption = 'BackOffice'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object xTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
  end
  object pnClientContainer: TPanel
    Left = 0
    Top = 34
    Width = 862
    Height = 478
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnHeader: TRzPanel
      Left = 0
      Top = 0
      Width = 862
      Height = 28
      Align = alTop
      BorderOuter = fsNone
      Color = 5832793
      TabOrder = 0
      object lbHeader: TRzLabel
        Left = 8
        Top = 6
        Width = 172
        Height = 16
        Caption = ' '#3648#3610#3636#3585#3592#3656#3634#3618#3585#3629#3591#3607#3640#3609' (BackOffce)'
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnClients: TRzPanel
      Left = 0
      Top = 28
      Width = 862
      Height = 128
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 1
      DesignSize = (
        862
        128)
      object lbOrderItem: TLabel
        Left = 140
        Top = 8
        Width = 73
        Height = 23
        AutoSize = False
        Caption = ' '#3594#3639#3656#3629#3585#3629#3591#3607#3640#3609
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
      object Label4: TLabel
        Left = 285
        Top = 45
        Width = 97
        Height = 22
        AutoSize = False
        Caption = ' '#3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
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
      object Label9: TLabel
        Left = 5
        Top = 68
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3627#3617#3634#3618#3648#3627#3605#3640
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
        Left = 563
        Top = 43
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3623#3633#3609#3607#3637#3656#3610#3633#3609#3607#3638#3585
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
        Left = 5
        Top = 44
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3607#3637#3656#3648#3610#3636#3585
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
      object btnAddItem: TRzBitBtn
        Left = 3
        Top = 98
        Width = 126
        Height = 27
        Anchors = [akLeft, akBottom]
        Caption = 'F6-'#3648#3614#3636#3656#3617#3619#3634#3618#3585#3634#3619
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
        OnClick = btnAddItemClick
      end
      object btnEditItem: TRzBitBtn
        Left = 129
        Top = 98
        Width = 106
        Height = 27
        Anchors = [akLeft, akBottom]
        Caption = 'F7 '#3649#3585#3657#3652#3586#3619#3634#3618#3585#3634#3619
        Color = 16753994
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 1
        TabStop = False
      end
      object btnClear: TRzBitBtn
        Left = 235
        Top = 98
        Width = 137
        Height = 27
        Anchors = [akLeft, akBottom]
        Caption = 'Ctrl+F7 '#3621#3610#3619#3634#3618#3585#3634#3619
        Color = 16753994
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 2
        TabStop = False
      end
      object btnSearch: TRzBitBtn
        Left = 4
        Top = 6
        Width = 133
        Height = 27
        Caption = #3588#3657#3609#3627#3634#3585#3629#3591#3607#3640#3609'..'
        Color = 16753919
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 3
        TabStop = False
        OnClick = btnSearchClick
      end
      object btnSave: TRzBitBtn
        Left = 470
        Top = 98
        Width = 118
        Height = 28
        Anchors = [akLeft, akBottom]
        Caption = 'F4-'#3610#3633#3609#3607#3638#3585#3619#3634#3618#3585#3634#3619
        Color = 12320631
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 4
        TabStop = False
        OnClick = btnSaveClick
      end
      object edDonatorName: TRzEdit
        Left = 215
        Top = 8
        Width = 440
        Height = 24
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FocusColor = 16766975
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnKeyDown = edDonatorNameKeyDown
      end
      object edAmount: TRzNumericEdit
        Left = 108
        Top = 43
        Width = 169
        Height = 24
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FrameVisible = True
        ParentFont = False
        TabOnEnter = True
        TabOrder = 6
        DisplayFormat = ',0;(,0)'
      end
      object edRefCode: TRzEdit
        Left = 384
        Top = 45
        Width = 169
        Height = 22
        Ctl3D = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FocusColor = 16766975
        ParentCtl3D = False
        ParentFont = False
        TabOnEnter = True
        TabOrder = 7
      end
      object edRemark: TRzEdit
        Left = 108
        Top = 68
        Width = 445
        Height = 22
        Ctl3D = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FocusColor = 16766975
        MaxLength = 255
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnKeyDown = edRemarkKeyDown
      end
      object dtRecDate: TRzDateTimeEdit
        Left = 661
        Top = 43
        Width = 163
        Height = 21
        EditType = etDate
        TabOrder = 9
      end
      object btnBillingInfo: TRzBitBtn
        Left = 692
        Top = 6
        Width = 129
        Height = 27
        Caption = #3619#3634#3618#3585#3634#3619#3648#3610#3636#3585#3592#3656#3634#3618
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 10
        TabStop = False
      end
      object BitBtn1: TBitBtn
        Left = 632
        Top = 88
        Width = 75
        Height = 25
        Caption = 'BitBtn1'
        TabOrder = 11
        Visible = False
      end
      object btnCancel: TRzBitBtn
        Left = 373
        Top = 98
        Width = 92
        Height = 28
        Anchors = [akLeft, akBottom]
        Caption = #3618#3585#3648#3621#3636#3585#3619#3634#3618#3585#3634#3619
        Color = 4227327
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 12
        TabStop = False
      end
    end
    object pnAllClients: TRzPanel
      Left = 0
      Top = 156
      Width = 862
      Height = 322
      Align = alClient
      BorderOuter = fsLowered
      TabOrder = 2
      object cxGridDisbursement: TcxGrid
        Left = 2
        Top = 2
        Width = 858
        Height = 318
        Align = alClient
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        object cxGridDisbursementDBTableView1: TcxGridDBTableView
          DataController.DataSource = dsDisbursement
          DataController.DetailKeyFieldNames = 'item'
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDisbursementDBTableView1Item: TcxGridDBColumn
            Caption = 'No.'
            DataBinding.FieldName = 'Item'
          end
          object cxGridDisbursementDBTableView1DocNo: TcxGridDBColumn
            Caption = #3648#3621#3586#3607#3637#3656#3648#3629#3585#3626#3634#3619
            Width = 94
            DataBinding.FieldName = 'DocNo'
          end
          object cxGridDisbursementDBTableView1RefNo: TcxGridDBColumn
            Caption = #3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
            Width = 90
            DataBinding.FieldName = 'RefNo'
          end
          object cxGridDisbursementDBTableView1AccNo: TcxGridDBColumn
            Caption = #3619#3627#3633#3626#3610#3633#3597#3594#3637
            Width = 80
            DataBinding.FieldName = 'AccNo'
          end
          object cxGridDisbursementDBTableView1Description: TcxGridDBColumn
            Caption = #3619#3634#3618#3585#3634#3619
            Width = 399
            DataBinding.FieldName = 'Description'
          end
          object cxGridDisbursementDBTableView1FundCode: TcxGridDBColumn
            Caption = #3585#3629#3591#3607#3640#3609
            Width = 73
            DataBinding.FieldName = 'FundCode'
          end
          object cxGridDisbursementDBTableView1Amount: TcxGridDBColumn
            Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
            Width = 87
            DataBinding.FieldName = 'Amount'
          end
          object cxGridDisbursementDBTableView1Remark: TcxGridDBColumn
            Caption = #3627#3617#3634#3618#3648#3627#3605#3640
            Width = 300
            DataBinding.FieldName = 'Remark'
          end
        end
        object cxGridDisbursementLevel1: TcxGridLevel
          GridView = cxGridDisbursementDBTableView1
        end
      end
    end
  end
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 30
    Width = 862
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 2
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
      'DataBase=fddb_temp'
      'DriverName=DevartSQLServer'
      'User_Name=sa'
      'Password=123456'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    Left = 64
    Top = 418
  end
  object SQLDataSet: TSQLDataSet
    CommandText = 'select top 1 * from disbursement'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 104
    Top = 418
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataSet
    Options = [poAllowMultiRecordUpdates, poAllowCommandText]
    Left = 152
    Top = 418
  end
  object cdsDisbursement: TClientDataSet
    Aggregates = <>
    CommandText = 'select top 1 * from disbursement'
    Params = <>
    ProviderName = 'dsp'
    Left = 168
    Top = 282
  end
  object dsDisbursement: TDataSource
    DataSet = cdsDisbursement
    Left = 248
    Top = 286
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 408
    Top = 330
  end
  object cdsDisbursementHdr: TClientDataSet
    Aggregates = <>
    CommandText = 'select top 1 * from disbursementhdr'
    Params = <>
    ProviderName = 'dsp'
    Left = 80
    Top = 242
  end
  object cdsTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 480
    Top = 306
  end
  object cdsTemp3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 576
    Top = 338
  end
  object cdsMaterReceiveHdr: TClientDataSet
    Aggregates = <>
    CommandText = 'select top 1 * from MttReceiveHdr'
    Params = <>
    ProviderName = 'dsp'
    Left = 288
    Top = 338
  end
  object cdsMaterReceive: TClientDataSet
    Aggregates = <>
    CommandText = 'select top 1 * from MttReceive'
    Params = <>
    ProviderName = 'dsp'
    Left = 240
    Top = 402
  end
end
