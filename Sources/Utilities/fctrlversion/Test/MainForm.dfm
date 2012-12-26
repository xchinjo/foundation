object Form1: TForm1
  Left = 192
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 313
    Height = 21
    TabOrder = 1
    Text = 'd:\menuseditor.dll'
  end
  object JvUIBDataBase1: TJvUIBDataBase
    Params.Strings = (
      'sql_dialect=3'
      'lc_ctype=NONE'
      'password=masterkey'
      'user_name=sysdba')
    DatabaseName = 'ctrlverdb'
    UserName = 'sysdba'
    PassWord = 'masterkey'
    LibraryName = 'fbclient.dll'
    Connected = True
    Left = 88
    Top = 120
  end
  object JvUIBTransaction1: TJvUIBTransaction
    DataBase = JvUIBDataBase1
    Left = 136
    Top = 120
  end
  object JvUIBQuery1: TJvUIBQuery
    SQL.Strings = (
      
        'SELECT * FROM SP_GET_FILE_DATA('#39'NGFS'#39', '#39'menuseditor.dll'#39', '#39'00000' +
        '000000000000000'#39')')
    Transaction = JvUIBTransaction1
    Left = 192
    Top = 120
  end
end
