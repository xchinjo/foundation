object frmBackForm: TfrmBackForm
  Left = 193
  Top = 113
  Width = 570
  Height = 600
  Caption = 'CRG - Firebird Backup/Restore Utilities'
  Color = clBtnFace
  Constraints.MinWidth = 570
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnConfig: TPanel
    Left = 0
    Top = 32
    Width = 562
    Height = 105
    Align = alTop
    TabOrder = 1
    DesignSize = (
      562
      105)
    object lbHost: TLabel
      Left = 11
      Top = 5
      Width = 169
      Height = 21
      AutoSize = False
      Caption = '  Database Server'
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lbDatabaseName: TLabel
      Left = 11
      Top = 29
      Width = 169
      Height = 21
      AutoSize = False
      Caption = '  Database Name'
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lbBakcupFileType: TLabel
      Left = 11
      Top = 53
      Width = 169
      Height = 21
      AutoSize = False
      Caption = '  Backup File Type'
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lbBakcupFileName: TLabel
      Left = 11
      Top = 77
      Width = 169
      Height = 21
      AutoSize = False
      Caption = '  Backup Full Path&&File Name'
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object edHost: TEdit
      Left = 182
      Top = 5
      Width = 230
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = edHostChange
    end
    object edDatabaseName: TEdit
      Left = 182
      Top = 29
      Width = 230
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = edDatabaseNameChange
    end
    object cbBackupType: TComboBox
      Left = 182
      Top = 53
      Width = 230
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      OnChange = cbBackupTypeChange
      Items.Strings = (
        'Full Path Name'
        'By Date (yyyymmdd.fbk)'
        'By Date/Time (yyyymmdd.hhmmss.fbk)'
        'By Day of Week Days (DayOfWeek.fbk)')
    end
    object edBackupFile: TEdit
      Left = 182
      Top = 77
      Width = 230
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnChange = edBackupFileChange
    end
    object btnStart: TButton
      Left = 473
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'S&tart'
      TabOrder = 4
      OnClick = btnStartClick
    end
    object btnSave: TButton
      Left = 473
      Top = 28
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Save'
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object btnClose: TButton
      Left = 473
      Top = 76
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      TabOrder = 6
      OnClick = btnCloseClick
    end
  end
  object pnVerbose: TPanel
    Left = 0
    Top = 137
    Width = 562
    Height = 410
    Align = alClient
    TabOrder = 2
    object mmVerbose: TMemo
      Left = 1
      Top = 1
      Width = 560
      Height = 408
      Align = alClient
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      WordWrap = False
    end
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 547
    Width = 562
    Height = 19
    Panels = <
      item
        Text = ' (C) 2006, The CRG Software'
        Width = 150
      end
      item
        Width = 110
      end
      item
        Width = 130
      end
      item
        Width = 50
      end>
  end
  object pnBackupList: TPanel
    Left = 0
    Top = 0
    Width = 562
    Height = 32
    Align = alTop
    TabOrder = 0
    Visible = False
    DesignSize = (
      562
      32)
    object lbBackupList: TLabel
      Left = 11
      Top = 5
      Width = 169
      Height = 21
      AutoSize = False
      Caption = '  Setting Up List of Backup'
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
    object cbBackupList: TComboBox
      Left = 182
      Top = 5
      Width = 367
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = cbBackupListChange
    end
  end
  object jvBackUp: TJvUIBBackup
    Protocol = proTCPIP
    LibraryName = 'fbclient.dll'
    OnVerbose = jvBackUpVerbose
    Left = 32
    Top = 160
  end
  object tmTime: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmTimeTimer
    Left = 128
    Top = 160
  end
  object jvRestore: TJvUIBRestore
    Protocol = proTCPIP
    LibraryName = 'fbclient.dll'
    OnVerbose = jvBackUpVerbose
    Options = [roReplace, roCreateNewDB]
    Left = 80
    Top = 160
  end
end
