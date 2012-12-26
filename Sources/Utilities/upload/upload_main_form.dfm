object Form1: TForm1
  Left = 192
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Upload Program to NGF System'
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 420
    Width = 91
    Height = 14
    Caption = 'Application Type'
  end
  object Label2: TLabel
    Left = 184
    Top = 420
    Width = 25
    Height = 14
    Caption = 'Path'
  end
  object Button1: TButton
    Left = 606
    Top = 416
    Width = 75
    Height = 25
    Caption = '&Update'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edAppType: TEdit
    Left = 104
    Top = 416
    Width = 73
    Height = 22
    TabOrder = 1
    Text = 'dll'
  end
  object dcbDrive: TDriveComboBox
    Left = 8
    Top = 8
    Width = 169
    Height = 20
    DirList = dlbDir
    TabOrder = 2
  end
  object dlbDir: TDirectoryListBox
    Left = 8
    Top = 32
    Width = 169
    Height = 377
    FileList = flbFiles
    ItemHeight = 16
    TabOrder = 3
  end
  object flbFiles: TFileListBox
    Left = 184
    Top = 8
    Width = 497
    Height = 401
    ItemHeight = 14
    TabOrder = 4
  end
  object cbPath: TComboBox
    Left = 216
    Top = 416
    Width = 105
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    ItemIndex = 0
    TabOrder = 5
    Text = '<CUR_DIR>'
    Items.Strings = (
      '<CUR_DIR>'
      '<SYSTEM>')
  end
  object dcDefault: TJvUIBDataBase
    Params.Strings = (
      'sql_dialect=3'
      'lc_ctype=NONE'
      'password=masterkey'
      'user_name=sysdba')
    DatabaseName = 'ngfdb'
    UserName = 'sysdba'
    PassWord = 'masterkey'
    LibraryName = 'fbclient.dll'
    Connected = True
    Left = 40
    Top = 184
  end
  object trnsDefault: TJvUIBTransaction
    DataBase = dcDefault
    Left = 40
    Top = 232
  end
  object sqlData: TJvUIBQuery
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_INSERT_UPDATE_FILE('
      '  :SYSTEM,'
      '  :FILE_NAME,'
      '  :FILE_DATA,'
      '  :FILE_PATH,'
      '  :FILE_VERSION);')
    Transaction = trnsDefault
    Left = 40
    Top = 280
  end
end
