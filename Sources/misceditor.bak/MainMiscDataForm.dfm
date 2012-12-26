object frmMainMiscData: TfrmMainMiscData
  Left = 192
  Top = 114
  Width = 800
  Height = 600
  Caption = 'Configure Setup Data'
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
    Left = 350
    Top = 24
    Height = 502
  end
  object tbBar: TToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 24
    AutoSize = True
    Caption = 'tbBar'
    Flat = True
    Images = imgButton
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object btnRefresh: TToolButton
      Left = 0
      Top = 0
      Hint = 'Reload Header Data'
      Caption = 'btnRefresh'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnRefreshClick
    end
    object ToolButton11: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnAddHeader: TToolButton
      Left = 31
      Top = 0
      Hint = 'Insert New Header data'
      Caption = 'btnAddHeader'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddHeaderClick
    end
    object btnEditHeader: TToolButton
      Left = 54
      Top = 0
      Hint = 'Edit Current Header Data'
      Caption = 'btnEditHeader'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditHeaderClick
    end
    object ToolButton3: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnDeleteHeader: TToolButton
      Left = 85
      Top = 0
      Hint = 'Delete Current Header Data'
      Caption = 'btnDeleteHeader'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteHeaderClick
    end
  end
  object pnHeaderDataList: TPanel
    Left = 0
    Top = 24
    Width = 350
    Height = 502
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    OnResize = pnHeaderDataListResize
    DesignSize = (
      350
      502)
    object pnHeaderTitle: TPanel
      Left = 0
      Top = 0
      Width = 350
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Configuration Header List'
      Color = clAppWorkSpace
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbgHeaderData: TDBGrid
      Left = 2
      Top = 27
      Width = 347
      Height = 474
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = False
      DataSource = dscMiscHeaderData
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = THAI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = 16119285
          Expanded = False
          FieldName = 'CODE'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Charset = THAI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DECSCRIPTION'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = THAI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 217
          Visible = True
        end>
    end
  end
  object pnDetailDataEditor: TPanel
    Left = 353
    Top = 24
    Width = 439
    Height = 502
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = pnDetailDataEditorResize
    DesignSize = (
      439
      502)
    object gbDetailDataEditor: TGroupBox
      Left = 0
      Top = 21
      Width = 438
      Height = 480
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      DesignSize = (
        438
        480)
      object btnEdit: TcxButton
        Left = 96
        Top = 447
        Width = 79
        Height = 25
        Hint = 'Edit Current Detail Data'
        Anchors = [akLeft, akBottom]
        Caption = '&Edit'
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnClick = btnEditClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDD0D0D0D0DDDDDDDDDDDDDDD00DDDDDDDDDDDDDD000DDDDD1DDDDDDD0B8
          0DDDD11DDDDDD0B70DDDD111DDDDDD0B80DDD1111DDDDD0B70DDD11111DDDDD0
          B80DD1111DDDDDD0B00DD111DDDDDDDD0110D11DDDDDDDDD000DD1DDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        UseSystemPaint = False
      end
      object btnSave: TcxButton
        Left = 264
        Top = 447
        Width = 79
        Height = 25
        Hint = 'Save Current Appended/Edited Detail Data'
        Anchors = [akLeft, akBottom]
        Caption = '&Save'
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnClick = btnSaveClick
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
      object btnCancel: TcxButton
        Left = 348
        Top = 447
        Width = 79
        Height = 25
        Hint = 'Cancel Current Appended/Edited Detail Data'
        Anchors = [akLeft, akBottom]
        Caption = '&Cancel'
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
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
      object pnEditorData: TPanel
        Left = 1
        Top = 271
        Width = 436
        Height = 169
        Anchors = [akLeft, akRight, akBottom]
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        Visible = False
        DesignSize = (
          436
          169)
        object lbFDESC_LABEL: TLabel
          Left = 11
          Top = 30
          Width = 132
          Height = 22
          AutoSize = False
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbFMONEY_LABEL: TLabel
          Left = 11
          Top = 59
          Width = 132
          Height = 22
          AutoSize = False
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbFDOUBLE_LABEL: TLabel
          Left = 11
          Top = 88
          Width = 132
          Height = 22
          AutoSize = False
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbFDATE_LABEL: TLabel
          Left = 11
          Top = 117
          Width = 132
          Height = 22
          AutoSize = False
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbFTEXT_EX_LABEL: TLabel
          Left = 11
          Top = 146
          Width = 132
          Height = 22
          AutoSize = False
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbFCODE_LABEL: TLabel
          Left = 11
          Top = 1
          Width = 132
          Height = 22
          AutoSize = False
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object dlbFCODE_LABEL: TDBText
          Left = 16
          Top = 5
          Width = 94
          Height = 14
          AutoSize = True
          Color = clSilver
          DataField = 'FCODE_LABEL'
          DataSource = dscMiscHeaderData
          ParentColor = False
        end
        object dlbFDESC_LABEL: TDBText
          Left = 16
          Top = 34
          Width = 92
          Height = 14
          AutoSize = True
          Color = clSilver
          DataField = 'FDESC_LABEL'
          DataSource = dscMiscHeaderData
          ParentColor = False
        end
        object dlbFMONEY_LABEL: TDBText
          Left = 16
          Top = 63
          Width = 104
          Height = 14
          AutoSize = True
          Color = clSilver
          DataField = 'FMONEY_LABEL'
          DataSource = dscMiscHeaderData
          ParentColor = False
        end
        object dlbFDOUBLE_LABEL: TDBText
          Left = 16
          Top = 92
          Width = 108
          Height = 14
          AutoSize = True
          Color = clSilver
          DataField = 'FDOUBLE_LABEL'
          DataSource = dscMiscHeaderData
          ParentColor = False
        end
        object dlbFDATE_LABEL: TDBText
          Left = 16
          Top = 121
          Width = 94
          Height = 14
          AutoSize = True
          Color = clSilver
          DataField = 'FDATE_LABEL'
          DataSource = dscMiscHeaderData
          ParentColor = False
        end
        object dlbFTEXT_EX_LABEL: TDBText
          Left = 16
          Top = 150
          Width = 114
          Height = 14
          AutoSize = True
          Color = clSilver
          DataField = 'FTEXT_EX_LABEL'
          DataSource = dscMiscHeaderData
          ParentColor = False
        end
        object dbeFCODE: TcxDBTextEdit
          Left = 145
          Top = 1
          Width = 176
          Height = 22
          Hint = 'Organization Name such as Company Name, Branch Name etc.'
          DataBinding.DataField = 'FCODE'
          DataBinding.DataSource = dscMiscDetailData
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object dbeFDESC: TcxDBTextEdit
          Left = 145
          Top = 30
          Width = 283
          Height = 22
          Hint = 
            'Tax identity number for organization'#13#10'It'#39's not neccesary for eve' +
            'ry organization'
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'FDESC'
          DataBinding.DataSource = dscMiscDetailData
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
        end
        object dbeFMONEY: TcxDBTextEdit
          Left = 145
          Top = 59
          Width = 176
          Height = 22
          Hint = 
            'Bulding or Office No.'#13#10'It'#39's a number repesented an identity of a' +
            'ny place.'
          DataBinding.DataField = 'FMONEY'
          DataBinding.DataSource = dscMiscDetailData
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
        object dbeFTEXT_EX: TcxDBTextEdit
          Left = 145
          Top = 146
          Width = 283
          Height = 22
          Hint = 'Main road name'
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'FTEXT_EX'
          DataBinding.DataSource = dscMiscDetailData
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
        end
        object dbeFDOUBLE: TcxDBTextEdit
          Left = 145
          Top = 88
          Width = 176
          Height = 22
          Hint = 'Building name, if it'#39's existed'
          DataBinding.DataField = 'FDOUBLE'
          DataBinding.DataSource = dscMiscDetailData
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
        end
        object dbeFDATE: TcxDBDateEdit
          Left = 145
          Top = 117
          Width = 176
          Height = 22
          DataBinding.DataField = 'FDATE'
          DataBinding.DataSource = dscMiscDetailData
          TabOrder = 5
        end
      end
      object dbgDetailData: TDBGrid
        Left = 3
        Top = 8
        Width = 433
        Height = 257
        Anchors = [akLeft, akTop, akRight, akBottom]
        Ctl3D = False
        DataSource = dscMiscDetailData
        Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = THAI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Color = 16119285
            Expanded = False
            FieldName = 'FCODE'
            Title.Alignment = taCenter
            Title.Caption = 'Code'
            Title.Font.Charset = THAI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FDESC'
            Title.Alignment = taCenter
            Title.Caption = 'Description'
            Title.Font.Charset = THAI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 362
            Visible = True
          end>
      end
      object btnAddNew: TcxButton
        Left = 12
        Top = 447
        Width = 79
        Height = 25
        Hint = 'Add New Detail Data'
        Anchors = [akLeft, akBottom]
        Caption = '&New'
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = btnAddNewClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD1DDDDDDDDDD
          DDDDD11DDDDDDDD4DDDDD111DDDDD4D4D4DDD1111DDDDD444DDDD11111DD4444
          444DD1111DDDDD444DDDD111DDDDD4D4D4DDD11DDDDDDDD4DDDDD1DDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        UseSystemPaint = False
      end
      object btnDelete: TcxButton
        Left = 180
        Top = 447
        Width = 79
        Height = 25
        Hint = 'Delete Current Detail Data'
        Anchors = [akLeft, akBottom]
        Caption = '&Delete'
        Enabled = False
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = btnDeleteClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD18DDDDDDD8D1DDDD118DDD
          DD18D11DDD811DDDD81DD111DDD118DD818DD1111DD8118811DDD11111DD1111
          1DDDD1111DDD8111DDDDD111DD8811118DDDD11DD1111DD118DDD1DDD11DDDDD
          118DDDDDDDDDDDDDD11DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        UseSystemPaint = False
      end
    end
    object pnDetailTitle: TPanel
      Left = 0
      Top = 0
      Width = 439
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Configuration Detail Editor'
      Color = clAppWorkSpace
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
    TabOrder = 3
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
    object cxButton1: TcxButton
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
      OnClick = cxButton1Click
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
  object dsMiscHeaderData: TpFIBDataSet
    Options = [poTrimCharFields, poRefreshAfterPost, poStartTransaction, poAutoFormatFields, poAllowChangeSqls]
    SQLScreenCursor = crSQLWait
    BufferChunks = 32
    CachedUpdates = False
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'EXECUTE PROCEDURE SP_INSERT_UPDATE_MISC_HEADER('
      '  :RECORD_ID,'
      '  :CODE,'
      '  :DECSCRIPTION,'
      '  :FCODE_USED,'
      '  :FCODE_LABEL,'
      '  :FDESC_USED,'
      '  :FDESC_LABEL,'
      '  :FMONEY_USED,'
      '  :FMONEY_LABEL,'
      '  :FDOUBLE_USED,'
      '  :FDOUBLE_LABEL,'
      '  :FDATE_USED,'
      '  :FDATE_LABEL,'
      '  :FTEXT_EX_USED,'
      '  :FTEXT_EX_LABEL);'
      '')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE SP_DELETE_MISC_HEADER(:RECORD_ID);')
    InsertSQL.Strings = (
      'EXECUTE PROCEDURE SP_INSERT_UPDATE_MISC_HEADER('
      '  :RECORD_ID,'
      '  :CODE,'
      '  :DECSCRIPTION,'
      '  :FCODE_USED,'
      '  :FCODE_LABEL,'
      '  :FDESC_USED,'
      '  :FDESC_LABEL,'
      '  :FMONEY_USED,'
      '  :FMONEY_LABEL,'
      '  :FDOUBLE_USED,'
      '  :FDOUBLE_LABEL,'
      '  :FDATE_USED,'
      '  :FDATE_LABEL,'
      '  :FTEXT_EX_USED,'
      '  :FTEXT_EX_LABEL);'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  RECORD_ID,'
      '  CODE,'
      '  DECSCRIPTION,'
      '  FCODE_USED,'
      '  FCODE_LABEL,'
      '  FDESC_USED,'
      '  FDESC_LABEL,'
      '  FMONEY_USED,'
      '  FMONEY_LABEL,'
      '  FDOUBLE_USED,'
      '  FDOUBLE_LABEL,'
      '  FDATE_USED,'
      '  FDATE_LABEL,'
      '  FTEXT_EX_USED,'
      '  FTEXT_EX_LABEL,'
      '  IS_SYSTEM'
      'FROM'
      '  SP_GET_MISC_HEADER_DATA_LIST')
    SelectSQL.Strings = (
      'SELECT'
      '  RECORD_ID,'
      '  CODE,'
      '  DECSCRIPTION,'
      '  FCODE_USED,'
      '  FCODE_LABEL,'
      '  FDESC_USED,'
      '  FDESC_LABEL,'
      '  FMONEY_USED,'
      '  FMONEY_LABEL,'
      '  FDOUBLE_USED,'
      '  FDOUBLE_LABEL,'
      '  FDATE_USED,'
      '  FDATE_LABEL,'
      '  FTEXT_EX_USED,'
      '  FTEXT_EX_LABEL,'
      '  IS_SYSTEM'
      'FROM'
      '  SP_GET_MISC_HEADER_DATA_LIST')
    AfterOpen = dsMiscHeaderDataAfterOpen
    AfterPost = dsMiscHeaderDataAfterPost
    AfterScroll = dsMiscHeaderDataAfterScroll
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'
    Left = 34
    Top = 217
    poUseBooleanField = True
    poSQLINT64ToBCD = True
    object dsMiscHeaderDataRECORD_ID: TFIBBCDField
      FieldName = 'RECORD_ID'
      Size = 0
      RoundByScale = True
    end
    object dsMiscHeaderDataCODE: TFIBStringField
      FieldName = 'CODE'
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataDECSCRIPTION: TFIBStringField
      FieldName = 'DECSCRIPTION'
      Size = 80
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFCODE_USED: TFIBStringField
      FieldName = 'FCODE_USED'
      Size = 1
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFCODE_LABEL: TFIBStringField
      FieldName = 'FCODE_LABEL'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFDESC_USED: TFIBStringField
      FieldName = 'FDESC_USED'
      Size = 1
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFDESC_LABEL: TFIBStringField
      FieldName = 'FDESC_LABEL'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFMONEY_USED: TFIBStringField
      FieldName = 'FMONEY_USED'
      Size = 1
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFMONEY_LABEL: TFIBStringField
      FieldName = 'FMONEY_LABEL'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFDOUBLE_USED: TFIBStringField
      FieldName = 'FDOUBLE_USED'
      Size = 1
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFDOUBLE_LABEL: TFIBStringField
      FieldName = 'FDOUBLE_LABEL'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFDATE_USED: TFIBStringField
      FieldName = 'FDATE_USED'
      Size = 1
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFDATE_LABEL: TFIBStringField
      FieldName = 'FDATE_LABEL'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFTEXT_EX_USED: TFIBStringField
      FieldName = 'FTEXT_EX_USED'
      Size = 1
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataFTEXT_EX_LABEL: TFIBStringField
      FieldName = 'FTEXT_EX_LABEL'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMiscHeaderDataIS_SYSTEM: TSmallintField
      FieldName = 'IS_SYSTEM'
    end
  end
  object DBTrans: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 35
    Top = 171
  end
  object dsMiscDetailData: TpFIBDataSet
    Options = [poTrimCharFields, poRefreshAfterPost, poStartTransaction, poAutoFormatFields, poAllowChangeSqls]
    BufferChunks = 32
    CachedUpdates = False
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'EXECUTE PROCEDURE SP_INSERT_UPDATE_MISC_DETAIL('
      '  :RECORD_ID,'
      '  :PARENT_ID,'
      '  :FCODE,'
      '  :FDESC,'
      '  :FMONEY,'
      '  :FDOUBLE,'
      '  :FDATE,'
      '  :FTEXT_EX)')
    DeleteSQL.Strings = (
      'UPDATE TB_MISC_DETAIL'
      'SET ACTIVE_FLAG = '#39'I'#39
      'WHERE'
      '  (RECORD_ID = :RECORD_ID);')
    InsertSQL.Strings = (
      'EXECUTE PROCEDURE SP_INSERT_UPDATE_MISC_DETAIL('
      '  :RECORD_ID,'
      '  :PARENT_ID,'
      '  :FCODE,'
      '  :FDESC,'
      '  :FMONEY,'
      '  :FDOUBLE,'
      '  :FDATE,'
      '  :FTEXT_EX)')
    RefreshSQL.Strings = (
      'SELECT'
      '  RECORD_ID,'
      '  PARENT_ID,'
      '  FCODE,'
      '  FDESC,'
      '  FMONEY,'
      '  FDOUBLE,'
      '  FDATE,'
      '  FTEXT_EX,'
      '  IS_SYSTEM'
      'FROM'
      '  SP_GET_MISC_DETAIL_DATA_LIST(:PARENT_ID)')
    SelectSQL.Strings = (
      'SELECT'
      '  RECORD_ID,'
      '  PARENT_ID,'
      '  FCODE,'
      '  FDESC,'
      '  FMONEY,'
      '  FDOUBLE,'
      '  FDATE,'
      '  FTEXT_EX,'
      '  IS_SYSTEM'
      'FROM'
      '  SP_GET_MISC_DETAIL_DATA_LIST(:PARENT_ID)')
    AfterOpen = dsMiscDetailDataAfterOpen
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'
    Left = 32
    Top = 265
    poUseBooleanField = True
    poSQLINT64ToBCD = True
    object dsMiscDetailDataRECORD_ID: TFIBBCDField
      FieldName = 'RECORD_ID'
      Size = 0
      RoundByScale = True
    end
    object dsMiscDetailDataPARENT_ID: TFIBBCDField
      FieldName = 'PARENT_ID'
      Size = 0
      RoundByScale = True
    end
    object dsMiscDetailDataFCODE: TFIBStringField
      FieldName = 'FCODE'
      EmptyStrToNull = True
    end
    object dsMiscDetailDataFDESC: TFIBStringField
      FieldName = 'FDESC'
      Size = 80
      EmptyStrToNull = True
    end
    object dsMiscDetailDataFMONEY: TFIBBCDField
      FieldName = 'FMONEY'
      Size = 2
      RoundByScale = True
    end
    object dsMiscDetailDataFDOUBLE: TFIBFloatField
      FieldName = 'FDOUBLE'
    end
    object dsMiscDetailDataFDATE: TFIBDateTimeField
      FieldName = 'FDATE'
    end
    object dsMiscDetailDataFTEXT_EX: TFIBStringField
      FieldName = 'FTEXT_EX'
      Size = 80
      EmptyStrToNull = True
    end
    object dsMiscDetailDataIS_SYSTEM: TSmallintField
      FieldName = 'IS_SYSTEM'
    end
  end
  object dscMiscDetailData: TDataSource
    AutoEdit = False
    DataSet = dsMiscDetailData
    Left = 72
    Top = 265
  end
  object imgButton: TImageList
    Left = 112
    Top = 89
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000800000008000000080000000800000008000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000800000008000
      000080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000000000000000000000000000000000000000000000000000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000000000000000000000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF0080000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF00000000000000000000FFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000000000
      0000FFFFFF00FFFF0000FFFFFF00FFFF000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000000000000000000000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF008000000080000000800000008000
      00008000000080000000800000008000000080000000800000000000000000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000000000000000000000000000000000000080000000000000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00800000008000
      0000FFFFFF008000000080000000FFFFFF0080000000800000000000000000FF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000000000000000000000000000000000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000000000
      000000FFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      000080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000800080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF01FFFFFFFFFF
      FC3F01FF000FFFFBF00F01FF000FEFFFE3C701FF000FC7F7E7E701FF000FC7EF
      CFF3FF60000FE3CFCFF3FE600007F19FCFF3FC000007F83FCFF3FE600003FC7F
      E7A7FF600003F83FE78701FF0001F1BFFF8F01FFFFE1C3CFFF8701FFFFF087E7
      FFFF01FFFFF09FF3FFFF01FFFFF9FFFF00000000000000000000000000000000
      000000000000}
  end
  object dscMiscHeaderData: TDataSource
    AutoEdit = False
    DataSet = dsMiscHeaderData
    Left = 72
    Top = 217
  end
end
