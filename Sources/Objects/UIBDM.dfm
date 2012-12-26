object MDM: TMDM
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 150
  Width = 215
  object DBConn: TJvUIBDataBase
    Params.Strings = (
      'sql_dialect=3'
      'lc_ctype=NONE'
      'sql_role_name='
      'user_name=SYSDBA'
      'password=masterkey')
    DatabaseName = 'ngfdb'
    UserName = 'SYSDBA'
    PassWord = 'masterkey'
    LibraryName = 'fbclient.dll'
    Left = 24
    Top = 16
  end
  object DbTrans: TJvUIBTransaction
    DataBase = DBConn
    Left = 72
    Top = 16
  end
end
