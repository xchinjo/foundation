object frmEndMonth: TfrmEndMonth
  Left = 385
  Top = 108
  Width = 870
  Height = 500
  Caption = 'frmEndMonth'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
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
    Height = 438
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
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
  object SQLDataSet: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 18
    Top = 289
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataSet
    Options = [poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText]
    Left = 18
    Top = 337
  end
end
