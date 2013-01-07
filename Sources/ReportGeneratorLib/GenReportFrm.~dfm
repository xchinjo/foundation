object frmGenReport: TfrmGenReport
  Left = 364
  Top = 120
  Width = 671
  Height = 423
  BorderIcons = [biSystemMenu]
  Caption = 'Report  Generator '
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    663
    395)
  PixelsPerInch = 96
  TextHeight = 18
  object RzLabel1: TRzLabel
    Left = 572
    Top = 90
    Width = 80
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Version 1.0.0.64'
    Font.Charset = THAI_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 564
    Top = 300
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Button1'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 249
    Top = 184
    Width = 307
    Height = 147
    Anchors = [akLeft, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object btnOK: TButton
    Left = 529
    Top = 8
    Width = 125
    Height = 38
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnOKClick
  end
  object pnContainer: TRzPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 395
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsGroove
    TabOrder = 3
    object ListView1: TListViewEx
      Left = 2
      Top = 2
      Width = 518
      Height = 391
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Columns = <
        item
          Width = 150
        end
        item
          Width = 150
        end
        item
        end
        item
        end>
      ColumnClick = False
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Data = {
        6C0000000400000000000000FFFFFFFFFFFFFFFF000000000000000004616161
        6100000000FFFFFFFFFFFFFFFF0000000000000000046262626200000000FFFF
        FFFFFFFFFFFF0000000000000000046363636300000000FFFFFFFFFFFFFFFF00
        000000000000000464646464}
      OwnerDraw = True
      ParentFont = False
      ShowColumnHeaders = False
      TabOrder = 0
      ViewStyle = vsReport
      IncRowHeight = 10
    end
  end
  object btnClose: TButton
    Left = 529
    Top = 48
    Width = 125
    Height = 38
    Anchors = [akTop, akRight]
    Caption = 'Cancel'
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object DBGrid2: TDBGrid
    Left = 160
    Top = 200
    Width = 320
    Height = 120
    DataSource = dsRepTemp
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object cdsParamsList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsParamsList'
    Left = 120
    Top = 160
  end
  object cdsParamsObj: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsParamsObj'
    Left = 200
    Top = 160
  end
  object cdsRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsRec'
    Left = 192
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = cdsParamsObjValue
    Left = 144
    Top = 8
  end
  object cdsParamsObjValue: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsParamsObjValue'
    Left = 200
    Top = 232
    object cdsParamsObjValueID: TIntegerField
      FieldName = 'ID'
    end
    object cdsParamsObjValueTYPE: TStringField
      FieldName = 'TYPE'
      Size = 30
    end
    object cdsParamsObjValueDESC: TStringField
      FieldName = 'DESC'
      Size = 200
    end
    object cdsParamsObjValueCODE: TStringField
      FieldName = 'CODE'
      Size = 30
    end
    object cdsParamsObjValueVALUE: TStringField
      FieldName = 'VALUE'
      Size = 80
    end
  end
  object ClientDataSet1: TClientDataSet
    Tag = 99
    Aggregates = <>
    CommandText = 'select * from hppdta.hpmcon00 fetch first 2 rows only'
    Params = <>
    ProviderName = 'DSP1'
    Left = 360
    Top = 256
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ';'
    OEMCodepage = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 352
    Top = 128
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 288
    Top = 184
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 312
    Top = 144
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 248
    Top = 176
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Left = 432
    Top = 192
  end
  object frxChartObject1: TfrxChartObject
    Left = 288
    Top = 216
  end
  object cdsReport4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsReport4'
    Left = 168
    Top = 88
  end
  object cdsReport2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsReport2'
    Left = 104
    Top = 216
  end
  object cdsReport3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsReport3'
    Left = 208
    Top = 256
  end
  object cdsReport5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsReport5'
    Left = 104
    Top = 296
  end
  object frxDBXComponents1: TfrxDBXComponents
    Left = 432
    Top = 120
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 504
    Top = 96
  end
  object frxBDEComponents1: TfrxBDEComponents
    DefaultSession = 'Default'
    Left = 488
    Top = 184
  end
  object frxIBXComponents1: TfrxIBXComponents
    Left = 504
    Top = 128
  end
  object frxADOComponents1: TfrxADOComponents
    Left = 336
    Top = 192
  end
  object frxReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40930.735662835650000000
    ReportOptions.LastChange = 40930.735662835650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 368
    Top = 104
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDataset5: TfrxDBDataset
    UserName = 'frxDBDataset5'
    CloseDataSource = False
    DataSet = cdsReport5
    BCDToCurrency = False
    Left = 288
    Top = 112
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = cdsReport2
    BCDToCurrency = False
    Left = 240
    Top = 16
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = cdsReport
    BCDToCurrency = False
    Left = 240
    Top = 40
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSet = cdsReport3
    BCDToCurrency = False
    Left = 296
    Top = 8
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = cdsReport1
    BCDToCurrency = False
    Left = 424
    Top = 64
  end
  object cdsRepTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 72
    Top = 128
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsReport'
    Left = 32
    Top = 184
  end
  object cdsReport1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsReport1'
    Left = 136
    Top = 168
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'frxDBDataset4'
    CloseDataSource = False
    DataSet = cdsReport4
    BCDToCurrency = False
    Left = 304
    Top = 80
  end
  object Conn: TSQLConnection
    ConnectionName = 'Devart SQL Server'
    DriverName = 'DevartSQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName='
      'DataBase='
      'DriverName=DevartSQLServer'
      'User_Name=sa'
      'Password='
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    Left = 48
    Top = 72
  end
  object SQLDataset: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 24
    Top = 32
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataset
    Left = 72
    Top = 32
  end
  object _cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'cdsReport'
    Left = 160
    Top = 344
  end
  object dsRepTemp: TDataSource
    DataSet = cdsRepTemp
    Left = 48
    Top = 256
  end
  object CdsName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 392
    Top = 336
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 112
    Top = 88
  end
end
