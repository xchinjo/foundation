object frmMain: TfrmMain
  Left = 132
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'H/P, L/S Company'
  ClientHeight = 447
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    792
    447)
  PixelsPerInch = 96
  TextHeight = 14
  object lbTitle: TLabel
    Left = 0
    Top = 0
    Width = 792
    Height = 25
    Align = alTop
    AutoSize = False
    Caption = 
      ' List of H/P, L/S Company have a capital  registered more than o' +
      'r equal 20 Million Bath'
    Color = 8421440
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object stbStatus: TStatusBar
    Left = 0
    Top = 428
    Width = 792
    Height = 19
    AutoHint = True
    Panels = <
      item
        Text = ' (C) 2005, CRG Software Co., Ltd.'
        Width = 175
      end
      item
        Width = 120
      end
      item
        Width = 50
      end>
    OnHint = stbStatusHint
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 25
    Width = 785
    Height = 369
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      785
      369)
    object Label2: TLabel
      Left = 339
      Top = 92
      Width = 115
      Height = 22
      Hint = 'Company data|Company data'
      AutoSize = False
      Caption = ' Company Name'
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 339
      Top = 121
      Width = 115
      Height = 22
      Hint = 'CEO Name|Chair Executive Name data'
      AutoSize = False
      Caption = ' CEO Name'
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 339
      Top = 150
      Width = 115
      Height = 22
      Hint = 'Address|Address data'
      AutoSize = False
      Caption = ' Address'
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 339
      Top = 209
      Width = 115
      Height = 22
      Hint = 'Telephone No.|Telephone No.'
      AutoSize = False
      Caption = ' Telephone No.'
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 339
      Top = 238
      Width = 115
      Height = 22
      Hint = 'Fax No.|Fax No.'
      AutoSize = False
      Caption = ' Fax No.'
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 339
      Top = 268
      Width = 115
      Height = 22
      Hint = 'Capital registered|Capital rigistered data'
      AutoSize = False
      Caption = ' Capital Registered'
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object lbHeader: TLabel
      Left = 336
      Top = 13
      Width = 444
      Height = 25
      AutoSize = False
      Color = 8421440
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 339
      Top = 45
      Width = 115
      Height = 22
      Hint = 'Grid order data|Grid data was ordered by this selection'
      AutoSize = False
      Caption = ' Order By'
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object Bevel1: TBevel
      Left = 336
      Top = 80
      Width = 444
      Height = 6
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 339
      Top = 297
      Width = 115
      Height = 22
      Hint = 'Web Site|Company web site data'
      AutoSize = False
      Caption = ' Web Site'
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object imgStared: TImage
      Left = 460
      Top = 324
      Width = 32
      Height = 32
      Hint = 'Filter stared data|Switch On/Off filtering of stared data'
      AutoSize = True
      ParentShowHint = False
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C0000130B0000130B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9FBFCA47768B214D652B4B5D758288A0A6A6B6BEBBE9EEEE
        FCFFFFFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF93D1DC5FAEC368B8D142889F457B864071731A4F4C205252
        214955536A7AAFB6C4E8ECF3FAFDFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF70B2C45FB6D09DFBFF80DCF575C3D366B2B865B7B84E9FA4
        3A80912B647D1A44611237512B56677C9AA5B9C5CAF9FDFFFDFEFFFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF77A9C05EABCB89E1FF7EDBFC83DCF18AE8F571DCE370DFE7
        6AD5EA5FC2DE5BAFD250A0BF30869C166B7B08506108465632616E99B2BABECA
        CEF7FBFDFDFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF86B3CE7DC4E97FD6FE8BE9FF81DDF687E9FB6FE2ED71EBF7
        6FE6FF67D8F872D7FD7DDFFF6ED8F059C5D758BED148A7BA2C82942A74862662
        720D3C4A36525F97A3AACDD1D4FCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF85B8D282CEF263BAE29AF3FF86DAF685DEF38BF2FF73E1F3
        68D4F375DAFF85E1FF86E1FF7FE2FE7AE7FD66DDF274EBFF72E2F65BC1D46CC4
        D564AFBF5692A24877851B3E4B9EADB2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF85BFD584D5F64BA3C8A0F5FF93DFFC9AE9FE8AE6F783E6FA
        84E6FF86E6FF87DFFF82DCFF7FE3FB7FECFF6CE4FA6EE8FF6EE5FB7DEDFF77DD
        F096F0FF8EDCEC7CBDCB457B861B444DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF6FB1C380D3EF63B7DB8AD8FCA6E9FFA7EAFF99E7F793EBFC
        8FEAFF8DE8FF8EE7FF8BEAFF81EEFC7AECF97EEBFF81EAFF80EAFF80E8FF86E9
        FF8DEBFE90E7F792E0ED61A1AC16475196A8ADFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF7ABDCC85D9F364B6D976C0E2B9F9FFA3E3F5A2F1FC99F2FD
        90EDFF8DEDFF8EEEFF8AF2FF7CF4F97AF0F58AF0FF92EFFF91F1FF8EF1FF8DF3
        FF8DF2FF88EAF685DEE971BEC72C6770345B63FDFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF86C7D58BDDF669BCDC61AECEBDFFFFA2E8F59DF1F790F1F5
        86EFFA87F2FF8AF8FF88FEFF7CFFF980FFF893F5FF9CF2FF96F2FF90F2FF8DF6
        FF89F5FF82EDF57CE1E9A1FCFF499397003439B6C3C5FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF80C7D583DDF66BC5E75EB6D4A0ECFFAFFCFFA4FEFF9AFCFC
        96FAFF95F8FF94F4FA8CF1EF83F5E488F5E59FF9FAA3F5FF9AF3FD94F3FC8FF7
        FE8EF9FF89F5F983ECEFA1FFFF5DAEB1347475668689FEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF6ABECD6DD6F163D0F064CCE969C5D6ADFFFF9BF9F89DFAF9
        A6FAFFAFF7FEB4EBF2ADE2DFABE4D5AAEBDBADF7F1AAFAFBA8FEFEA4FEFF9FFF
        FF99FDFF91F5F58AECECA2FEFFAAFAFB3D7F7E265A5AFAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF78BACE6ED2EF67D2F76DD9F850B2C4A1FFFF9DFFFEA4FFFC
        B4FEFFC3F9FFCAE8EDC1D3D2BCCFC0B6D4C1AFE7DCAFF2EDB7FFF9B7FFFDAFFC
        F9A3F1F095E3E28BD7D6B8FFFFB1F2F389C2C12756548EA3A2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA0C1DA8BD4FA78D1FD74D4F866C3DA80DFE9A2FFFFA4FFFC
        B5FCFFCDFBFFDCECF2D6D4D3CAC5B6BCC2AFB4D5C7B6E5DCC4F3EBC4F2ECBAE6
        E5AFDBDCA4D0D19EC7CAD2F8FCD4F7FAC8E7EA4760622E4344FEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFBAD0E3A1DEFF82D6FA6DCEEF7CE1F75AC2CF5FCAD165C9CD
        85D6DEB6F1FAE1FFFFF1FEFFF0F7F0EDF7EABAD1C3C5DFD1CFE9DCCCE3DBC1D7
        D2BCCECDBBCDCEBDCCCED9E8EBF1FFFFE5F4F6AEBEBD394A47A0A9A8FFFFFFFF
        FFFFFFFFFFFFFFFFB8D4DBA5E9F687E1F274E0F271EAFA72EFFE76F5FF5ED5E4
        74DEEF6FCAD972BECA79B7C187BFC4D5FFFBDDF4E5CDD9C5C4CEBDCBD2C3D5D9
        CEE7E9E3E2E3DFC1C2C0FDFFFFE3E8E7F7FFFECBD9D55B6D663D544CFDFEFEFF
        FFFFFFFFFFFFFFFFBFDBDDB0F3F694EFF67EEAF573EDF96EEDFC75F2FF7FF3FF
        80E9F785E1EE93E2EB9DE3EA407F8394C1BEF3FFF7F2F4E1E8E9D9EAEADCF1F2
        E8F8F9F0E9EAE6CACFCDF3F9F8EAF5F3F3FFFFEEFFFE90A7A32C4541CCD5D4FF
        FFFFFFFFFFFFFFFFC7DEE1B6F4FAA0F3FB8FF1FB87F3FE83F2FC8CF2FE84DFE8
        AAF5FDC7FFFFC0ECEDC7E6E3788C87CDD8D0A7A89FC7C4BCDDDED5E5ECE5EAF6
        F0E6F7F3E0F7F3DFFCF9DCFAFBE3FFFFDBFCFFD5F3F8ACCACF4562678E9CA0FF
        FFFFFFFFFFFFFFFFCBE0E4B2F0F8A1F2FA97F5FB96F9FF97F9FF98EFF3BFFFFF
        D3FFFFB2D2CDC1CFC49E9B8D7B6D5BDBCBBBD8CBC3E8DFDBDFDCD7C8CFC8B8C7
        BF9FB6AE8EADA697BBB5A5CCCABBE3E2ADD3D7DDFFFFDFFEFF728E99687E8AFF
        FFFFFFFFFFFFFFFFCEE3E8ADF0F9A1F5FB9CF8FD9DFCFF9FF9F9BBFFFFB5EEE6
        B4D4C9A7B1A09A8D77C1A38AFFDEC1FDD5BCD2BDAED8CEC4E2DCD1F4F4E6FBFF
        F5CCDDCF77918144635433554A99BBB493B6B293B4B792AFB6B4CAD2BDD6E6FF
        FFFFFFFFFFFFFFFFD2E7EBADF5FCA5FCFF9EFEFE9BFCFA9BF5F0B7FFF8AADFD2
        66806EB5B7A1E4CFB3FFE9C7FFEAC6FFDFBDF8DFC5E5D8C2E3D8C2F9F2D9FFFF
        EBF1F0D4AEB3987C856B3340284B5B4965776ABAD0CBFBFFFFFEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFD6E9EBA6F3F6A0FCFD9DFFFE9BFFFA9AF7EEA3F2E587C0B1
        749580ECF5DBFFFFE6FFFFE3FFFFDEFFEDC6E7D2ACD9CAA3E9D9AFFFF8CDFFFF
        DCFFFFD5FFE3BADEC49C8C745059472841371F6C6C5AFEFFFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDBEBECA4E9ECA1F4F5A0FEFAA3FFFDA6FFF6BAFFFAC4FFF0
        90B4A360705979755C9B866ABB9F7DD6B992FFFFD2EEDAAAEBD2A0FFE7B4FFF8
        C4FFFFD0FFF8C8FFDAACEFC297A17C56674D2F6A5E4BFFFFFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCFFFF94CACB80C4C3A6F3F0A3F4F1B7FFFFBEFFFBCCFFFA
        B2D8CCBBD2C4C9D1C0D2CEBBE3D6C0B3A184B8A174FFE4B1F7D6A4FFDAA6FFDD
        AADDA875FFD9A8FFE9BCFFF5CCFFEECC815F41BBB0A2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFAAC9CA88B6B791C7C878B4B47DB7B68DBDBDB2D3D1
        BACECCD7E1DFE9EEEAF5F5F3FFFFFFD1C6B2A68A67FFF2C6F2CB9EFBD2A5D8AB
        7F7C4F24D7A67EBF926CC19D7FE6CFBCDBCEC4F0EAE4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE5DEBD9B83FFEFCEFFE1C1E5C2A19C7D
        5E84694EFFFFF9FFFFFCFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFECEBBC9886E3B69BFFDFC5EFD0B97964
        4F8D8476FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFCF1D3C0CEA68DF4D5BCD9C1AD4F45
        34BEBEB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEE0CBB0A98A69FFFFE4B1A086665F
        4CFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEE6DDB7A99768E7D7AD675837B7B0
        A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAEEE2ACA69769B7AB83FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      ShowHint = True
      Transparent = True
      OnDblClick = imgStaredDblClick
    end
    object dbgList: TDBGrid
      Left = 8
      Top = 37
      Width = 326
      Height = 297
      Hint = 'Company List|Show all company list'
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dscData
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = THAI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgListDrawColumnCell
      OnDblClick = dbgListDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COMPANY_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Company Name'
          Title.Font.Charset = THAI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 296
          Visible = True
        end>
    end
    object edSearchText: TcxTextEdit
      Left = 8
      Top = 12
      Width = 296
      Height = 22
      Hint = 'Search text|Enter text to search'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = edSearchTextKeyPress
    end
    object btnSearch: TcxButton
      Left = 304
      Top = 13
      Width = 30
      Height = 20
      Hint = 'Search|Click to perform search'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnSearchClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000000000000000000000000000FF00FF0000000000FFFF
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00000000000000000000000000FF00FF0000000000FFFF
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00000000000000000000000000FF00FF00000000000000
        00000000000000000000000000000000000000000000FF00FF00000000000000
        00000000000000000000000000000000000000000000FF00FF00000000000000
        0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
        FF000000000000000000000000000000000000000000FF00FF00000000000000
        0000FFFFFF00000000000000000000000000C6C6C6000000000000000000FFFF
        FF000000000000000000000000000000000000000000FF00FF00000000000000
        0000FFFFFF00000000000000000000000000C6C6C6000000000000000000FFFF
        FF000000000000000000000000000000000000000000FF00FF00FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00000000000000000000000000FF00FF0000000000FFFF
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000000000000000000000000000FF00FF00000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      UseSystemPaint = False
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 460
      Top = 92
      Width = 317
      Height = 22
      Hint = 'Company data|Company data'
      DataBinding.DataField = 'COMPANY_NAME'
      DataBinding.DataSource = dscData
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.Font.Charset = THAI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 460
      Top = 121
      Width = 245
      Height = 22
      Hint = 'CEO Name|Chair Executive Name data'
      DataBinding.DataField = 'CEO_NAME'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 460
      Top = 150
      Width = 317
      Height = 22
      Hint = 'Address|Address data'
      DataBinding.DataField = 'ADDRESS1'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 460
      Top = 180
      Width = 317
      Height = 22
      Hint = 'Address|Address data'
      DataBinding.DataField = 'ADDRESS2'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 460
      Top = 209
      Width = 162
      Height = 22
      Hint = 'Telephone No.|Telephone No. data'
      DataBinding.DataField = 'TELEPHONE_NO'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 460
      Top = 238
      Width = 162
      Height = 22
      Hint = 'Fax No.|Fax No. data'
      DataBinding.DataField = 'FAX_NO'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 460
      Top = 268
      Width = 162
      Height = 22
      Hint = 'Capital registered|Capital rigistered data'
      DataBinding.DataField = 'REG_INVESTMENT'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 338
      Width = 189
      Height = 25
      DataSource = dscData
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbRefresh]
      Anchors = [akLeft, akBottom]
      Flat = True
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object cbOrderBy: TcxComboBox
      Left = 460
      Top = 45
      Width = 162
      Height = 22
      Hint = 'Grid order data|Grid data was ordered by this selection'
      ParentFont = False
      ParentShowHint = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'CEO Name'
        'Company Name    '
        'Capital Registered')
      Properties.OnChange = cxComboBox1PropertiesChange
      ShowHint = True
      Style.Font.Charset = THAI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object edbWWW: TcxDBTextEdit
      Left = 460
      Top = 297
      Width = 245
      Height = 22
      Hint = 'Web Site|Company web site data'
      DataBinding.DataField = 'WWW'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object btnApply: TcxButton
      Left = 200
      Top = 338
      Width = 133
      Height = 25
      Hint = 'Apply Change|Apply data has been changed'
      Caption = '&Apply Changed'
      Enabled = False
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = btnApplyClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object btnPrintAll: TcxButton
      Left = 679
      Top = 338
      Width = 98
      Height = 25
      Hint = 'Print all company|Print all company data'
      Anchors = [akRight, akBottom]
      Caption = 'Print &All'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = btnPrintAllClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object btnPrint: TcxButton
      Left = 575
      Top = 338
      Width = 98
      Height = 25
      Hint = 'Print current company|Print current company data'
      Anchors = [akRight, akBottom]
      Caption = '&Print'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = btnPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 336
      Top = 328
      Width = 121
      Height = 22
      Hint = 
        'Stared this interested record|You can stared this record by doub' +
        'le click on data row in visible grid'
      DataBinding.DataField = 'IS_INTERESTED'
      DataBinding.DataSource = dscData
      ParentShowHint = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.FullFocusRect = True
      Properties.NullStyle = nssInactive
      Properties.ReadOnly = False
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = 'Stared this record'
      ShowHint = True
      TabOrder = 16
    end
    object cxButton1: TcxButton
      Left = 705
      Top = 297
      Width = 22
      Height = 22
      Hint = 'Explore this site|Open default to explore this company web site'
      Anchors = [akRight, akBottom]
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = cxButton1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F8F8F800CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF00660042424200FF009900CC330000FF33
        3300FF336600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF66
        9900FF66CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99
        FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF
        6600FFFF9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF
        66002100A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7
        D700DDDDDD00E3E3E300EAEAEA00F1F1F10004040400080808000C0C0C001111
        1100161616001C1C1C002222220029292900555555004D4D4D0039393900807C
        FF005050FF009300D600FFECCC00C6D6EF00D6E7E70090A9AD00000033000000
        6600000099000000CC00003300000033330000336600003399000033CC000033
        FF00006600000066330000666600006699000066CC000066FF00009900000099
        330000996600009999000099CC000099FF0000CC000000CC330000CC660000CC
        990000CCCC0000CCFF0000FF660000FF990000FFCC0033000000330033003300
        6600330099003300CC003300FF00333300003333330033336600333399003333
        CC003333FF00336600003366330033666600336699003366CC003366FF003399
        00003399330033996600339999003399CC003399FF0033CC000033CC330033CC
        660033CC990033CCCC0033CCFF0033FF330033FF660033FF990033FFCC0033FF
        FF00660000006600330066006600660099006600CC006600FF00663300006633
        330066336600663399006633CC006633FF006666000066663300666666006666
        99006666CC00669900006699330066996600669999006699CC006699FF0066CC
        000066CC330066CC990066CCCC0066CCFF0066FF000066FF330066FF990066FF
        CC00CC00FF00FF00CC009999000099339900990099009900CC00990000009933
        3300990066009933CC009900FF00996600009966330099336600996699009966
        CC009933FF009999330099996600999999009999CC009999FF0099CC000099CC
        330066CC660099CC990099CCCC0099CCFF0099FF000099FF330099CC660099FF
        990099FFCC0099FFFF00CC00000099003300F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0057570F0F0F57
        57575757575757575757570FDD57570E62D80FDEDDDD57575757540F57576262
        0FDEDE143737DDDD5757530F57B9D90FDE37143737373737DD5753150E040FDE
        371457570F37373737DD53C615D9DE1437575757570F373737DD54C7370FDE37
        1457575757575757575754ECC715DE37141414141414141414145754EC381537
        3737371B1B3C3C3C3C14570FC6ED373714575757570F51423C145757D9E4F337
        141457570F1B4A51145757570FD9E40714140F0F1442513C14575757570F141C
        2314141B3C1B3C145737575757571414373737371B3C14575737575757575757
        1414141414145757571457575757575757575757571414141457}
      UseSystemPaint = False
    end
  end
  object btnCancel: TcxButton
    Left = 682
    Top = 399
    Width = 98
    Height = 25
    Hint = 'Close|Close this application'
    Anchors = [akRight, akBottom]
    Caption = '&Close'
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object Connection: TSQLConnection
    ConnectionName = 'CUSTOMER'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=E:\Database\CUSTOMER.FDb'
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
    Left = 104
    Top = 176
  end
  object ssShow: TSmoothShow
    Left = 136
    Top = 176
  end
  object tmTime: TTimer
    OnTimer = tmTimeTimer
    Left = 168
    Top = 176
  end
  object dsData: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM HP_LS_COMPANY')
    SQLConnection = Connection
    Left = 104
    Top = 224
  end
  object dspData: TDataSetProvider
    DataSet = dsData
    Left = 136
    Top = 224
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspData'
    AfterPost = cdsDataAfterPost
    Left = 168
    Top = 224
    object cdsDataCEO_NAME: TStringField
      FieldName = 'CEO_NAME'
      Required = True
      Size = 60
    end
    object cdsDataCOMPANY_NAME: TStringField
      FieldName = 'COMPANY_NAME'
      Required = True
      Size = 80
    end
    object cdsDataADDRESS1: TStringField
      FieldName = 'ADDRESS1'
      Size = 80
    end
    object cdsDataADDRESS2: TStringField
      FieldName = 'ADDRESS2'
      Size = 80
    end
    object cdsDataTELEPHONE_NO: TStringField
      FieldName = 'TELEPHONE_NO'
    end
    object cdsDataFAX_NO: TStringField
      FieldName = 'FAX_NO'
    end
    object cdsDataREG_INVESTMENT: TFMTBCDField
      FieldName = 'REG_INVESTMENT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object cdsDataWWW: TStringField
      FieldName = 'WWW'
      Size = 60
    end
    object cdsDataIS_INTERESTED: TIntegerField
      FieldName = 'IS_INTERESTED'
    end
    object cdsDataIS_CUSTOMER: TIntegerField
      FieldName = 'IS_CUSTOMER'
    end
  end
  object dscData: TDataSource
    DataSet = cdsData
    Left = 200
    Top = 224
  end
  object frData: TfrxDBDataset
    UserName = 'frData'
    CloseDataSource = False
    DataSet = cdsData
    Left = 134
    Top = 273
  end
  object frPrint: TfrxReport
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38863.069114039400000000
    ReportOptions.LastChange = 38863.085359155100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure mmCNOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (<frData."IS_INTERESTED"> = 1) then'
      '    mmCN.Color := clYellow'
      '  else'
      '    mmCN.Color := clMoneyGreen;'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 100
    Top = 273
    Datasets = <
      item
        DataSet = frData
        DataSetName = 'frData'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 226.771800000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = frData
        DataSetName = 'frData'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 26.456710000000000000
          Top = 7.559060000000017000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Color = clSilver
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3610#3619#3636#3625#3633#3607)
          ParentFont = False
          VAlign = vaCenter
        end
        object mmCN: TfrxMemoView
          Left = 215.433210000000000000
          Top = 7.559059999999988000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'mmCNOnBeforePrint'
          Color = clMoneyGreen
          DataField = 'COMPANY_NAME'
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frData."COMPANY_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 26.456710000000000000
          Top = 34.015770000000010000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Color = clSilver
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3612#3641#3657#3610#3619#3636#3627#3634#3619' / '#3610#3640#3588#3588#3621#3605#3636#3604#3605#3656#3629#3652#3604#3657)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 215.433210000000000000
          Top = 34.015770000000010000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DataField = 'CEO_NAME'
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frData."CEO_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 26.456710000000000000
          Top = 60.472480000000310000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Color = clSilver
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3607#3637#3656#3629#3618#3641#3656)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 215.433210000000000000
          Top = 60.472479999999910000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DataField = 'ADDRESS1'
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frData."ADDRESS1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 215.433210000000000000
          Top = 86.929189999999580000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DataField = 'ADDRESS2'
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frData."ADDRESS2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 26.456710000000000000
          Top = 117.165430000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Color = clSilver
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3650#3607#3619#3624#3633#3614#3607#3660)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 215.433210000000000000
          Top = 117.165430000000000000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DataField = 'TELEPHONE_NO'
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frData."TELEPHONE_NO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 26.456710000000000000
          Top = 143.622140000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Color = clSilver
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3649#3615#3585#3595#3660' (Fax)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 215.433210000000000000
          Top = 143.622140000000000000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DataField = 'FAX_NO'
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frData."FAX_NO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 26.456710000000000000
          Top = 170.078850000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Color = clSilver
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3607#3640#3609#3592#3604#3607#3632#3648#3610#3637#3618#3609)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 215.433210000000000000
          Top = 170.078850000000000000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[FormatFloat('#39'#,##0.00'#39',<frData."REG_INVESTMENT">)] '#3610#3634#3607)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 26.456710000000000000
          Top = 196.535560000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Color = clSilver
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3648#3623#3610#3652#3595#3605#3660)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 215.433210000000000000
          Top = 196.535560000000000000
          Width = 472.441250000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DataField = 'WWW'
          DataSet = frData
          DataSetName = 'frData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frData."WWW"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795300000000000000
        Top = 464.882190000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Top = 11.338590000000010000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Top = 18.897650000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            ' (C) 2006, CRG Software Co., Ltd.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baRight
          Left = 604.724800000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            'Page [<Page#>] / [TotalPages#] ')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 41.574830000000000000
        Top = 75.590600000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Align = baLeft
          Width = 718.110700000000000000
          Height = 41.574830000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' '#3610#3619#3636#3625#3633#3607' '#3648#3594#3656#3634#3595#3639#3657#3629' / '#3621#3636#3626#3595#3636#3656#3591' '#3607#3637#3656#3617#3637#3607#3640#3609#3592#3604#3607#3632#3648#3610#3637#3618#3609' 20 '#3621#3657#3634#3609#3610#3634#3607' '#3586#3638#3657#3609#3652#3611)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baLeft
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              ' Computer Research Group Company Limited -- Software Utilities (' +
              'HP/LS Companies)')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
