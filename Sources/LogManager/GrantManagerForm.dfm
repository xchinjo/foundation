object frmUserHistoryLog: TfrmUserHistoryLog
  Left = 192
  Top = 114
  ActiveControl = lbPrivilagesFor
  BorderStyle = bsSingle
  Caption = 'User History Log Manager'
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
    Left = 255
    Top = 0
    Height = 526
  end
  object pnMenuItemList: TPanel
    Left = 0
    Top = 0
    Width = 255
    Height = 526
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      255
      526)
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 255
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Privilages for'
      Color = clAppWorkSpace
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbPrivilagesFor: TcxComboBox
      Left = 3
      Top = 27
      Width = 253
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
      Top = 50
      Width = 253
      Height = 474
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 14
      ParentColor = False
      TabOrder = 2
      OnClick = lbPrivilagesForClick
    end
  end
  object pnMenuItemEditor: TPanel
    Left = 258
    Top = 0
    Width = 534
    Height = 526
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      534
      526)
    object btnGrantToAll: TSpeedButton
      Tag = 1
      Left = 268
      Top = 27
      Width = 80
      Height = 22
      Caption = 'Grant to All'
      Flat = True
      OnClick = btnGrantToAllClick
    end
    object btnRevokeToAll: TSpeedButton
      Left = 349
      Top = 27
      Width = 80
      Height = 22
      Caption = 'Revoke to All'
      Flat = True
      OnClick = btnGrantToAllClick
    end
    object btnDenyToAll: TSpeedButton
      Tag = 2
      Left = 430
      Top = 27
      Width = 80
      Height = 22
      Caption = 'Deny to All'
      Flat = True
      OnClick = btnGrantToAllClick
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 534
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Grants on'
      Color = clAppWorkSpace
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbGrantsOn: TcxComboBox
      Left = 0
      Top = 27
      Width = 261
      Height = 22
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #13'All Objects'#10
        'Menus')
      TabOrder = 1
    end
    object cxgGrantObject: TcxGrid
      Left = 0
      Top = 50
      Width = 530
      Height = 473
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
        OptionsSelection.HideFocusRect = False
        OptionsView.GroupByBox = False
        object mnCaption: TcxGridDBColumn
          Caption = 'Caption'
          HeaderAlignmentHorz = taCenter
          MinWidth = 135
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 135
          DataBinding.FieldName = 'NAME_TH'
        end
        object mnDescription: TcxGridDBColumn
          Caption = 'Description'
          HeaderAlignmentHorz = taCenter
          MinWidth = 185
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 185
          DataBinding.FieldName = 'DESCRIPTION'
        end
        object mnApplicationName: TcxGridDBColumn
          Caption = 'Application'
          HeaderAlignmentHorz = taCenter
          MinWidth = 90
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 90
          DataBinding.FieldName = 'APP_NAME'
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
    Color = clAppWorkSpace
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
      UseSystemPaint = False
    end
  end
  object ssShow: TSmoothShow
    Left = 984
    Top = 696
  end
  object DBTrans: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 88
    Top = 128
  end
  object dsTemp: TpFIBDataSet
    Transaction = DBTrans
    Options = [poTrimCharFields, poRefreshAfterPost, poStartTransaction, poAutoFormatFields, poAllowChangeSqls]
    BufferChunks = 32
    CachedUpdates = False
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      '')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'
    Left = 128
    Top = 128
    poUseBooleanField = True
    poSQLINT64ToBCD = True
  end
  object dsObjectList: TpFIBDataSet
    Transaction = DBTrans
    Options = [poTrimCharFields, poRefreshAfterPost, poStartTransaction, poAutoFormatFields, poAllowChangeSqls]
    BufferChunks = 32
    CachedUpdates = False
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'EXECUTE PROCEDURE SP_UPDATE_GRANTED_MENU('
      '  ?UR_TYPE, ?REF_NAME, ?RECORD_ID, ?ALLOWED, ?DENIED)')
    DeleteSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'SELECT * FROM SP_GET_ALL_GRANTED_MENU(:TYPE, :REF_NAME)')
    SelectSQL.Strings = (
      'SELECT'
      '  RECORD_ID,'
      '  NAME_TH,'
      '  NAME_EN,'
      '  APP_NAME,'
      '  DESCRIPTION,'
      '  ALLOWED,'
      '  DENIED'
      'FROM '
      '  SP_GET_ALL_GRANTED_MENU(?UR_TYPE, ?REF_NAME)')
    AfterScroll = dsObjectListAfterScroll
    BeforeEdit = dsObjectListBeforeEdit
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'
    Left = 88
    Top = 184
    poUseBooleanField = True
    poSQLINT64ToBCD = True
    object dsObjectListRECORD_ID: TFIBIntegerField
      FieldName = 'RECORD_ID'
    end
    object dsObjectListNAME_TH: TFIBStringField
      FieldName = 'NAME_TH'
      Size = 40
      EmptyStrToNull = True
    end
    object dsObjectListNAME_EN: TFIBStringField
      FieldName = 'NAME_EN'
      Size = 40
      EmptyStrToNull = True
    end
    object dsObjectListAPP_NAME: TFIBStringField
      FieldName = 'APP_NAME'
      Size = 60
      EmptyStrToNull = True
    end
    object dsObjectListDESCRIPTION: TFIBStringField
      FieldName = 'DESCRIPTION'
      Size = 80
      EmptyStrToNull = True
    end
    object dsObjectListALLOWED: TFIBIntegerField
      FieldName = 'ALLOWED'
    end
    object dsObjectListDENIED: TFIBIntegerField
      FieldName = 'DENIED'
    end
  end
  object dscObjectList: TDataSource
    DataSet = dsObjectList
    Left = 128
    Top = 184
  end
end
