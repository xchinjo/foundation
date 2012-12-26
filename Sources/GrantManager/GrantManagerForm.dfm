object frmGrantManager: TfrmGrantManager
  Left = 418
  Top = 114
  ActiveControl = lbPrivilagesFor
  BorderStyle = bsSingle
  Caption = 'Grant Manager'
  ClientHeight = 566
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 245
    Top = 0
    Height = 526
  end
  object pnMenuItemList: TPanel
    Left = 0
    Top = 0
    Width = 245
    Height = 526
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      245
      526)
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 245
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Privilages for'
      Color = clGrayText
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbPrivilagesFor: TcxComboBox
      Left = 3
      Top = 25
      Width = 243
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #13'Roles'#10
        'Users')
      Properties.OnChange = cbPrivilagesForPropertiesChange
      TabOrder = 1
    end
    object lbPrivilagesFor: TcxListBox
      Left = 3
      Top = 48
      Width = 243
      Height = 476
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 14
      ParentColor = False
      TabOrder = 2
      OnClick = lbPrivilagesForClick
    end
  end
  object pnMenuItemEditor: TPanel
    Left = 248
    Top = 0
    Width = 544
    Height = 526
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      544
      526)
    object btnGrantToAll: TSpeedButton
      Tag = 1
      Left = 261
      Top = 25
      Width = 120
      Height = 22
      Caption = 'Grant to All'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A0600060AAAA
        AAAAAA00FF0AAAAAAAAAAA0FF00AAAAAAAAAA000FFF0AAAAAAAA000FFFF0A000
        000A0000FFFF0FFFFFF00000FF00FF7FFFF000000FF0FF17FFF0A0000000F110
        FFF0AA00000F11F17FF0AAAAA8FFFFFF17F0AAAAA8FFFFFFF070AAAAA8FFFFFF
        FF00AAAAA8FF00000FF0AAAAAA880F77088AAAAAAAAAA888AAAA}
      OnClick = btnGrantToAllClick
    end
    object btnRevokeToAll: TSpeedButton
      Left = 381
      Top = 25
      Width = 120
      Height = 22
      Caption = 'Revoke to All'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A0600060AAAA
        AAAAAA00FF0AAAAAAAAAAA0FF00AAAAAAAAAA000FFF0AAAAAAAA000FFFF0A000
        000A0000FFFF0FFFFFF00000FF00FF7FFFF000000FF0FF17F1F0A0000000F110
        11F0AA00000F11F11FF0AAAAA8FFFFF117F0AAAAA8FFF111F070AAAAA8FFFFFF
        FF00AAAAA8FF00000FF0AAAAAA880F77088AAAAAAAAAA888AAAA}
      OnClick = btnGrantToAllClick
    end
    object btnDenyToAll: TSpeedButton
      Tag = 2
      Left = 501
      Top = 25
      Width = 120
      Height = 22
      Caption = 'Deny to All'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A0600060AAAA
        AAAAAA00FF0AAAAAAAAAAA0FF00AAAAAAAAAA000FFF0AAAAAAAA000FFFF0A000
        000A0000FFFF0FFFFFF00000FF00FF7FFFF000000FF0FF17F1F0A0000000F110
        11F0AA00000F11F11FF0AAAAA8FFFFF117F0AAAAA8FFF111F070AAAAA8FFFFFF
        FF00AAAAA8FF00000FF0AAAAAA880F77088AAAAAAAAAA888AAAA}
      OnClick = btnGrantToAllClick
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 544
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Grants on'
      Color = clGrayText
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbGrantsOn: TcxComboBox
      Left = 0
      Top = 25
      Width = 261
      Height = 22
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #13'All Objects'#10
        'Menus'
        'Organize Chart')
      Properties.OnChange = cbGrantsOnPropertiesChange
      TabOrder = 1
    end
    object cxgGrantObject: TcxGrid
      Left = 0
      Top = 48
      Width = 540
      Height = 475
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object cxgGrantObjectDBTableView: TcxGridDBTableView
        DataController.DataSource = dscObjectList
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object mnObjectType: TcxGridDBColumn
          Caption = 'Object Type'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 85
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 85
          DataBinding.FieldName = 'OBJ_DESC'
        end
        object mnCaption: TcxGridDBColumn
          Caption = 'Object Description'
          HeaderAlignmentHorz = taCenter
          MinWidth = 420
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 420
          DataBinding.FieldName = 'DESCRIPTION'
        end
        object mnAllowed: TcxGridDBColumn
          Caption = 'Allowed'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
          MinWidth = 50
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 50
          DataBinding.FieldName = 'ALLOWED'
        end
        object mnDenied: TcxGridDBColumn
          Caption = 'Denied'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          FooterAlignmentHorz = taCenter
          MinWidth = 50
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 50
          DataBinding.FieldName = 'DENIED'
        end
      end
      object cxgGrantObjectLevel: TcxGridLevel
        GridView = cxgGrantObjectDBTableView
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 526
    Width = 792
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clGrayText
    TabOrder = 2
    DesignSize = (
      792
      40)
    object lbRecord: TLabel
      Left = 10
      Top = 8
      Width = 4
      Height = 14
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnClose: TcxButton
      Left = 704
      Top = 8
      Width = 79
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object dscObjectList: TDataSource
    DataSet = cdsObjectList
    Left = 148
    Top = 112
  end
  object trnsDefault: TJvUIBTransaction
    Left = 24
    Top = 64
  end
  object dsTemp: TJvUIBDataSet
    Transaction = trnsDefault
    Left = 64
    Top = 64
  end
  object dsObjectList: TJvUIBDataSet
    Transaction = trnsDefault
    SQL.Strings = (
      'SELECT'
      '  RECORD_ID,'
      '  OBJ_TYPE,'
      '  DESCRIPTION,'
      '  ALLOWED,'
      '  DENIED'
      'FROM'
      '  SP_GET_ALL_GRANTED_OBJECTS('
      '    :USER_ROLE_INC, :REF_NAME, :OBJECT_TYPE, :LANGUAGE)')
    Left = 24
    Top = 112
  end
  object dsObjectListUpdate: TJvUIBQuery
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_UPDATE_GRANTED_OBJECT('
      
        '  :OBJECT_TYPE, :USER_ROLE_INC, :REF_NAME, :RECORD_ID, :ALLOWED,' +
        ' :DENIED)')
    Transaction = trnsDefault
    Left = 106
    Top = 64
  end
  object dspObjectList: TDataSetProvider
    DataSet = dsObjectList
    Left = 64
    Top = 112
  end
  object cdsObjectList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspObjectList'
    BeforeEdit = cdsObjectListBeforeEdit
    AfterPost = cdsObjectListAfterPost
    OnCalcFields = cdsObjectListCalcFields
    Left = 106
    Top = 112
    object cdsObjectListRECORD_ID: TIntegerField
      FieldName = 'RECORD_ID'
    end
    object cdsObjectListOBJ_TYPE: TIntegerField
      FieldName = 'OBJ_TYPE'
    end
    object cdsObjectListDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 80
    end
    object cdsObjectListALLOWED: TIntegerField
      FieldName = 'ALLOWED'
    end
    object cdsObjectListDENIED: TIntegerField
      FieldName = 'DENIED'
    end
    object cdsObjectListOBJ_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBJ_DESC'
      Size = 15
      Calculated = True
    end
  end
end
