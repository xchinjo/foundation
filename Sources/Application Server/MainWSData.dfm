object WSData: TWSData
  OldCreateOrder = False
  OnCreate = SoapDataModuleCreate
  Left = 194
  Top = 107
  Height = 306
  Width = 263
  object scConnection: TSQLConnection
    ConnectionName = 'HP/LS'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=E:\Database\DATA.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 32
    Top = 16
  end
  object dspMenuData: TDataSetProvider
    DataSet = dsMenuData
    Left = 104
    Top = 104
  end
  object dspData: TDataSetProvider
    DataSet = dsData
    Left = 144
    Top = 16
  end
  object dsMenuData: TSQLDataSet
    CommandText = 'SELECT * FROM SP_GET_MENU_LIST(:USER_ID, -1);'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USER_ID'
        ParamType = ptInput
        Value = 'ADMIN'
      end>
    SQLConnection = scConnection
    Left = 32
    Top = 104
  end
  object dsData: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scConnection
    Left = 96
    Top = 16
  end
end
