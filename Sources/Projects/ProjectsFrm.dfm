object frmProjects: TfrmProjects
  Left = 362
  Top = 35
  Width = 796
  Height = 594
  Caption = 'Projects'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object xTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
  end
  object pnClientContainer: TPanel
    Left = 0
    Top = 34
    Width = 780
    Height = 522
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object pnClients: TRzPanel
      Left = 0
      Top = 200
      Width = 780
      Height = 322
      Align = alClient
      BorderOuter = fsLowered
      TabOrder = 0
      object grdPeroid: TcxGrid
        Left = 2
        Top = 2
        Width = 776
        Height = 318
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        object grdPeroidDBTableView1: TcxGridDBTableView
          DataController.DataSource = dsProjects
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grdPeroidDBTableView1PjCode: TcxGridDBColumn
            Caption = #3619#3627#3633#3626
            Width = 60
            DataBinding.FieldName = 'PjCode'
          end
          object grdPeroidDBTableView1PjName: TcxGridDBColumn
            Caption = #3594#3639#3656#3629#3650#3588#3619#3591#3585#3634#3619
            Width = 250
            DataBinding.FieldName = 'PjName'
          end
          object grdPeroidDBTableView1PjCreateDate: TcxGridDBColumn
            Caption = #3623#3633#3609#3607#3637#3656#3626#3619#3657#3634#3591
            Width = 100
            DataBinding.FieldName = 'PjCreateDate'
          end
          object grdPeroidDBTableView1PjStatus: TcxGridDBColumn
            Caption = #3626#3606#3634#3609#3632
            Width = 100
            DataBinding.FieldName = 'PjStatus'
          end
        end
        object grdPeroidLevel1: TcxGridLevel
          GridView = grdPeroidDBTableView1
        end
      end
    end
    object pnTop: TRzPanel
      Left = 0
      Top = 28
      Width = 780
      Height = 172
      Align = alTop
      BorderOuter = fsGroove
      TabOrder = 1
      DesignSize = (
        778
        170)
      object Label2: TLabel
        Left = 7
        Top = 9
        Width = 127
        Height = 22
        AutoSize = False
        Caption = ' '#3619#3627#3633#3626#3650#3588#3619#3591#3585#3634#3619
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
        Left = 7
        Top = 34
        Width = 127
        Height = 22
        AutoSize = False
        Caption = ' '#3594#3639#3656#3629#3650#3588#3619#3591#3585#3634#3619
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
        Left = 7
        Top = 60
        Width = 127
        Height = 22
        AutoSize = False
        Caption = ' '#3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660
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
        Left = 7
        Top = 85
        Width = 127
        Height = 22
        AutoSize = False
        Caption = ' '#3585#3629#3591#3607#3640#3609
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
        Left = 7
        Top = 110
        Width = 127
        Height = 22
        AutoSize = False
        Caption = ' '#3592#3634#3585'/'#3617#3634#3592#3634#3585
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
      object BtnAdd: TRzBitBtn
        Left = 321
        Top = 140
        Width = 89
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'F3-'#3648#3614#3636#3656#3617
        Color = 16759929
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
        Left = 412
        Top = 140
        Width = 89
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'F7-'#3649#3585#3657#3652#3586
        Color = 16759929
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
      object BtnDel: TRzBitBtn
        Left = 502
        Top = 140
        Width = 89
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'F9-'#3621#3610
        Color = 16759929
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 2
        TabStop = False
        OnClick = BtnDelClick
      end
      object BtnSave: TRzBitBtn
        Left = 592
        Top = 140
        Width = 89
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'F5-'#3610#3633#3609#3607#3638#3585
        Color = 16759929
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 3
        TabStop = False
        OnClick = BtnSaveClick
      end
      object BtnCancel: TRzBitBtn
        Left = 682
        Top = 140
        Width = 89
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'F6-'#3618#3585#3648#3621#3636#3585
        Color = 16759929
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
      object TxtCode: TRzDBEdit
        Left = 137
        Top = 8
        Width = 278
        Height = 24
        DataSource = dsProjects
        DataField = 'PjCode'
        FrameVisible = True
        TabOrder = 5
      end
      object Txt2: TRzDBEdit
        Left = 137
        Top = 33
        Width = 278
        Height = 24
        DataSource = dsProjects
        DataField = 'PjName'
        FrameVisible = True
        TabOrder = 6
      end
      object Lbc1: TRzDBLookupComboBox
        Left = 137
        Top = 59
        Width = 372
        Height = 24
        Ctl3D = False
        DataField = 'PjObjectiveCode'
        DataSource = dsProjects
        KeyField = 'o_code'
        ListField = 'o_title'
        ListSource = DsOPJ
        ParentCtl3D = False
        TabOrder = 7
        FrameVisible = True
      end
      object Lbc2: TRzDBLookupComboBox
        Left = 137
        Top = 85
        Width = 372
        Height = 24
        Ctl3D = False
        DataField = 'PjFundCode'
        DataSource = dsProjects
        KeyField = 'fd_code'
        ListField = 'fd_title'
        ListSource = DsFund
        ParentCtl3D = False
        TabOrder = 8
        FrameVisible = True
      end
      object Txt3: TRzDBEdit
        Left = 137
        Top = 111
        Width = 372
        Height = 24
        DataSource = dsProjects
        DataField = 'PjDesc'
        FrameVisible = True
        TabOrder = 9
      end
      object RdgStatus: TRzDBRadioGroup
        Left = 514
        Top = 67
        Width = 169
        Height = 67
        DataField = 'PjStatus'
        DataSource = dsProjects
        Items.Strings = (
          #3651#3594#3657#3591#3634#3609
          #3652#3617#3656#3651#3594#3657#3591#3634#3609)
        Values.Strings = (
          'A'
          'I')
        Caption = #3626#3606#3634#3609#3632
        TabOrder = 10
      end
    end
    object pnHeader: TRzPanel
      Left = 0
      Top = 0
      Width = 780
      Height = 28
      Align = alTop
      BorderOuter = fsNone
      Color = 5832793
      TabOrder = 2
      object lbHeader: TRzLabel
        Left = 8
        Top = 6
        Width = 123
        Height = 16
        Caption = #3650#3588#3619#3591#3585#3634#3619' ( Project )'
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 30
    Width = 780
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
    Left = 16
    Top = 274
  end
  object SQLDataSet: TSQLDataSet
    CommandText = 'select * from projects'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 56
    Top = 274
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataSet
    Options = [poAllowMultiRecordUpdates, poAllowCommandText]
    Left = 104
    Top = 274
  end
  object cdsProjects: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    OnNewRecord = cdsProjectsNewRecord
    Left = 16
    Top = 357
  end
  object dsProjects: TDataSource
    DataSet = cdsProjects
    Left = 16
    Top = 400
  end
  object CdsOPJ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 80
    Top = 357
  end
  object CdsFund: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 144
    Top = 355
  end
  object DsOPJ: TDataSource
    DataSet = CdsOPJ
    Left = 80
    Top = 403
  end
  object DsFund: TDataSource
    DataSet = CdsFund
    Left = 144
    Top = 401
  end
  object Auto_id: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 152
    Top = 274
  end
end
