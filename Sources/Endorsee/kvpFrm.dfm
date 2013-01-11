object FormKVP: TFormKVP
  Left = 182
  Top = 104
  Width = 992
  Height = 579
  Caption = #3619#3634#3618#3594#3639#3656#3629#3612#3641#3657#3610#3619#3636#3627#3634#3619#3649#3621#3632#3585#3619#3619#3617#3585#3634#3619
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object RzPanel1: TRzPanel
    Left = 0
    Top = 32
    Width = 984
    Height = 519
    Align = alClient
    TabOrder = 0
    object RzPanel2: TRzPanel
      Left = 2
      Top = 2
      Width = 980
      Height = 175
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 0
      object Label7: TLabel
        Left = 281
        Top = 7
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3619#3632#3604#3633#3610
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
      object Label1: TLabel
        Left = 281
        Top = 84
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3588#3635#3629#3608#3636#3610#3634#3618'2'
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
      object Label2: TLabel
        Left = 281
        Top = 34
        Width = 100
        Height = 22
        AutoSize = False
        Caption = ' '#3588#3635#3629#3608#3636#3610#3634#3618'1'
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
      object Label3: TLabel
        Left = 8
        Top = 133
        Width = 74
        Height = 22
        AutoSize = False
        Caption = ' '#3594#3639#3656#3629
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
      object Label4: TLabel
        Left = 8
        Top = 108
        Width = 74
        Height = 22
        AutoSize = False
        Caption = ' '#3605#3635#3649#3627#3609#3656#3591
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
      object Label5: TLabel
        Left = 8
        Top = 83
        Width = 74
        Height = 22
        AutoSize = False
        Caption = ' '#3627#3617#3623#3604#3627#3617#3641#3656
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
      object Label6: TLabel
        Left = 8
        Top = 58
        Width = 74
        Height = 22
        AutoSize = False
        Caption = ' '#3627#3617#3623#3604
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
      object Label8: TLabel
        Left = 8
        Top = 33
        Width = 74
        Height = 22
        AutoSize = False
        Caption = ' '#3619#3627#3633#3626
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
      object Label9: TLabel
        Left = 8
        Top = 8
        Width = 74
        Height = 22
        AutoSize = False
        Caption = ' '#3621#3635#3604#3633#3610
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
      object record_id: TRzDBEdit
        Left = 85
        Top = 9
        Width = 192
        Height = 24
        DataSource = DsKvp
        DataField = 'record_id'
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 0
      end
      object key_id: TRzDBEdit
        Left = 85
        Top = 34
        Width = 192
        Height = 24
        DataSource = DsKvp
        DataField = 'key_id'
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 1
      end
      object category_id: TRzDBEdit
        Left = 85
        Top = 59
        Width = 192
        Height = 24
        DataSource = DsKvp
        DataField = 'category_id'
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 2
      end
      object sub_category_id: TRzDBEdit
        Left = 85
        Top = 84
        Width = 192
        Height = 24
        DataSource = DsKvp
        DataField = 'sub_category_id'
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 3
      end
      object key_name: TRzDBEdit
        Left = 85
        Top = 109
        Width = 295
        Height = 24
        DataSource = DsKvp
        DataField = 'key_name'
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 4
      end
      object key_value: TRzDBEdit
        Left = 85
        Top = 134
        Width = 295
        Height = 24
        DataSource = DsKvp
        DataField = 'key_value'
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 5
      end
      object Status: TRzDBComboBox
        Left = 384
        Top = 9
        Width = 152
        Height = 24
        DataField = 'key_status'
        DataSource = DsKvp
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOnEnter = True
        TabOrder = 6
        Items.Strings = (
          'A'
          'B')
        Values.Strings = (
          'A'
          'B')
      end
      object RzPanel5: TRzPanel
        Left = 0
        Top = 164
        Width = 980
        Height = 11
        Align = alBottom
        BorderOuter = fsNone
        Color = clSilver
        TabOrder = 7
      end
      object MmDes1: TRzDBMemo
        Left = 384
        Top = 32
        Width = 257
        Height = 49
        DataField = 'describe1'
        DataSource = DsKvp
        TabOrder = 8
        FrameVisible = True
      end
      object MmDes2: TRzDBMemo
        Left = 384
        Top = 83
        Width = 257
        Height = 48
        DataField = 'describe2'
        DataSource = DsKvp
        TabOrder = 9
        FrameVisible = True
      end
      object RzDBNavigator1: TRzDBNavigator
        Left = 384
        Top = 134
        Width = 256
        Height = 25
        DataSource = DsKvp
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        BorderOuter = fsNone
        TabOrder = 10
      end
    end
    object RzPanel3: TRzPanel
      Left = 2
      Top = 475
      Width = 980
      Height = 42
      Align = alBottom
      BorderOuter = fsNone
      Color = clSilver
      TabOrder = 1
      DesignSize = (
        980
        42)
      object BtnAdd: TRzBitBtn
        Left = 444
        Top = 8
        Width = 102
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'F3-'#3648#3614#3636#3656#3617
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
        OnClick = BtnAddClick
      end
      object BtnEdit: TRzBitBtn
        Left = 548
        Top = 8
        Width = 102
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'F7-'#3649#3585#3657#3652#3586
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
        OnClick = BtnEditClick
      end
      object BtnSave: TRzBitBtn
        Left = 756
        Top = 8
        Width = 102
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'F5-'#3610#3633#3609#3607#3638#3585
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
        OnClick = BtnSaveClick
      end
      object BtnDel: TRzBitBtn
        Left = 652
        Top = 8
        Width = 102
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'F9-'#3621#3610
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
        OnClick = BtnDelClick
      end
      object BtnCancel: TRzBitBtn
        Left = 860
        Top = 8
        Width = 102
        Height = 27
        Anchors = [akTop, akRight]
        Caption = #3618#3585#3648#3621#3636#3585
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
        OnClick = BtnCancelClick
      end
    end
    object RzPanel4: TRzPanel
      Left = 2
      Top = 177
      Width = 980
      Height = 298
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 2
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 980
        Height = 298
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = DsKvp
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OnCustomDrawColumnHeader = cxGrid1DBTableView1CustomDrawColumnHeader
          object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            Caption = #3621#3635#3604#3633#3610
            MinWidth = 50
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            DataBinding.FieldName = 'record_id'
          end
          object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #3619#3627#3633#3626
            MinWidth = 50
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            DataBinding.FieldName = 'key_id'
          end
          object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
            Caption = #3627#3617#3623#3604
            MinWidth = 50
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            DataBinding.FieldName = 'category_id'
          end
          object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
            Caption = #3627#3617#3623#3604#3627#3617#3641#3656
            MinWidth = 60
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
            DataBinding.FieldName = 'sub_category_id'
          end
          object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
            Caption = #3605#3635#3649#3627#3609#3656#3591
            MinWidth = 120
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 120
            DataBinding.FieldName = 'key_name'
          end
          object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
            Caption = #3594#3639#3656#3629
            MinWidth = 331
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 331
            DataBinding.FieldName = 'key_value'
          end
          object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
            Caption = #3588#3635#3629#3608#3636#3610#3634#3618
            MinWidth = 120
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 120
            DataBinding.FieldName = 'describe1'
          end
          object cxGrid1DBTableView1DBColumn8: TcxGridDBColumn
            Caption = #3588#3635#3629#3608#3636#3610#3634#3618
            MinWidth = 120
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 120
            DataBinding.FieldName = 'describe2'
          end
          object cxGrid1DBTableView1DBColumn9: TcxGridDBColumn
            Caption = #3619#3632#3604#3633#3610
            MinWidth = 50
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 50
            DataBinding.FieldName = 'key_status'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 4
    Width = 984
    Height = 28
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 5832793
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object RzLabel2: TRzLabel
      Left = 20
      Top = 7
      Width = 463
      Height = 16
      Caption = 
        #3619#3634#3618#3594#3639#3656#3629#3612#3641#3657#3610#3619#3636#3627#3634#3619#3649#3621#3632#3585#3619#3619#3617#3585#3634#3619' ( Management Team and Board of Direct' +
        'ors )'
      Font.Charset = THAI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 2
    VisualStyle = vsGradient
  end
  object DsKvp: TDataSource
    DataSet = CdsKvp
    Left = 88
    Top = 440
  end
  object conn: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=.'
      'DataBase=fddb_temp2'
      'User_Name=sa'
      'Password=Uit@uit'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'oledb'
    Left = 88
    Top = 248
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'cds1.CommandText:='#39'select * FROM KVP_Table'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = '='#39'select * FROM KVP_Table'#39
        ParamType = ptUnknown
      end>
    SQLConnection = conn
    Left = 88
    Top = 296
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Options = [poAllowMultiRecordUpdates, poAllowCommandText]
    Left = 88
    Top = 344
  end
  object CdsKvp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    OnNewRecord = CdsKvpNewRecord
    Left = 88
    Top = 392
  end
  object Auto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 728
    Top = 321
  end
  object Autorun: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 800
    Top = 321
  end
end
