object frmHeaderDataEditor: TfrmHeaderDataEditor
  Left = 316
  Top = 187
  ActiveControl = dbeCODE
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Miscellaneous Header Data Editor'
  ClientHeight = 373
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    564
    373)
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 332
    Width = 564
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clAppWorkSpace
    TabOrder = 0
    DesignSize = (
      564
      41)
    object btnCancel: TcxButton
      Left = 476
      Top = 8
      Width = 79
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancel'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
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
    object btnSave: TcxButton
      Left = 394
      Top = 8
      Width = 79
      Height = 25
      Hint = 'Save Change'
      Anchors = [akRight, akBottom]
      Caption = '&Save'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
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
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 0
    Width = 555
    Height = 328
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 19
      Top = 17
      Width = 115
      Height = 22
      AutoSize = False
      Caption = ' Code'
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
    object Label1: TLabel
      Left = 19
      Top = 45
      Width = 115
      Height = 22
      AutoSize = False
      Caption = ' Description'
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
    object Label4: TLabel
      Left = 19
      Top = 104
      Width = 115
      Height = 22
      AutoSize = False
      Caption = ' Field Code Label'
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
    object Label2: TLabel
      Left = 19
      Top = 152
      Width = 115
      Height = 22
      AutoSize = False
      Caption = ' Field Code Label'
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
    object Label5: TLabel
      Left = 19
      Top = 200
      Width = 115
      Height = 22
      AutoSize = False
      Caption = ' Field Code Label'
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
    object Label6: TLabel
      Left = 19
      Top = 248
      Width = 115
      Height = 22
      AutoSize = False
      Caption = ' Field Code Label'
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
    object Label7: TLabel
      Left = 19
      Top = 296
      Width = 115
      Height = 22
      AutoSize = False
      Caption = ' Field Code Label'
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
    object Bevel1: TBevel
      Left = 7
      Top = 76
      Width = 540
      Height = 6
      Shape = bsTopLine
    end
    object dbeCODE: TcxDBTextEdit
      Left = 138
      Top = 17
      Width = 175
      Height = 22
      Hint = 
        'User Identity|Specific user identity of current user profile, us' +
        'er id. must be unique'
      DataBinding.DataField = 'CODE'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      ShowHint = False
      TabOrder = 0
    end
    object dbeDECSCRIPTION: TcxDBTextEdit
      Left = 138
      Top = 45
      Width = 403
      Height = 22
      Hint = 
        'User Identity|Specific user identity of current user profile, us' +
        'er id. must be unique'
      DataBinding.DataField = 'DECSCRIPTION'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      ShowHint = False
      TabOrder = 1
    end
    object dbeFCODE_LABEL: TcxDBTextEdit
      Left = 138
      Top = 104
      Width = 403
      Height = 22
      Hint = 
        'User Identity|Specific user identity of current user profile, us' +
        'er id. must be unique'
      DataBinding.DataField = 'FCODE_LABEL'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      ShowHint = False
      TabOrder = 2
    end
    object dcbFCODE_USED: TcxDBCheckBox
      Left = 15
      Top = 81
      Width = 119
      Height = 22
      DataBinding.DataField = 'FCODE_USED'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = 'Used Field Code'
      TabOrder = 3
    end
    object dbeFDESC_LABEL: TcxDBTextEdit
      Left = 138
      Top = 152
      Width = 403
      Height = 22
      Hint = 
        'User Identity|Specific user identity of current user profile, us' +
        'er id. must be unique'
      DataBinding.DataField = 'FDESC_LABEL'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      ShowHint = False
      TabOrder = 4
    end
    object dcbFDESC_USED: TcxDBCheckBox
      Left = 15
      Top = 129
      Width = 119
      Height = 22
      DataBinding.DataField = 'FDESC_USED'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = 'Used Field Code'
      TabOrder = 5
    end
    object dbeFMONEY_LABEL: TcxDBTextEdit
      Left = 138
      Top = 200
      Width = 403
      Height = 22
      Hint = 
        'User Identity|Specific user identity of current user profile, us' +
        'er id. must be unique'
      DataBinding.DataField = 'FMONEY_LABEL'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      ShowHint = False
      TabOrder = 6
    end
    object dcbFMONEY_USED: TcxDBCheckBox
      Left = 15
      Top = 177
      Width = 119
      Height = 22
      DataBinding.DataField = 'FMONEY_USED'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = 'Used Field Code'
      TabOrder = 7
    end
    object dbeFDATE_LABEL: TcxDBTextEdit
      Left = 138
      Top = 248
      Width = 403
      Height = 22
      Hint = 
        'User Identity|Specific user identity of current user profile, us' +
        'er id. must be unique'
      DataBinding.DataField = 'FDATE_LABEL'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      ShowHint = False
      TabOrder = 8
    end
    object dcbFDATE_USED: TcxDBCheckBox
      Left = 15
      Top = 225
      Width = 119
      Height = 22
      DataBinding.DataField = 'FDATE_USED'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = 'Used Field Code'
      TabOrder = 9
    end
    object dbeFTEXT_EX_USED: TcxDBTextEdit
      Left = 138
      Top = 296
      Width = 403
      Height = 22
      Hint = 
        'User Identity|Specific user identity of current user profile, us' +
        'er id. must be unique'
      DataBinding.DataField = 'FTEXT_EX_USED'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      ShowHint = False
      TabOrder = 10
    end
    object dcbFTEXT_EX_USED: TcxDBCheckBox
      Left = 15
      Top = 273
      Width = 119
      Height = 22
      DataBinding.DataField = 'FTEXT_EX_USED'
      DataBinding.DataSource = frmMainMiscData.dscMiscHeaderData
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = 'Used Field Code'
      TabOrder = 11
    end
  end
end
