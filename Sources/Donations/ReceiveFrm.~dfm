object frmReceive: TfrmReceive
  Left = 213
  Top = 54
  Width = 951
  Height = 643
  Caption = 'Front Donations'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object xTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 943
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
  end
  object pnClientContainer: TPanel
    Left = 0
    Top = 34
    Width = 943
    Height = 581
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object cxGridBillDetails: TcxGrid
      Left = 0
      Top = 467
      Width = 943
      Height = 114
      Align = alClient
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      object cxGridBillDetailsDBTableView1: TcxGridDBTableView
        DataController.DataSource = dsBillDetails
        DataController.DetailKeyFieldNames = 'item'
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OnCustomDrawColumnHeader = cxGridBillDetailsDBTableView1CustomDrawColumnHeader
        object cxGridBillDetailsDBTableView1item: TcxGridDBColumn
          Caption = 'No.'
          Options.Sorting = False
          Width = 30
          DataBinding.FieldName = 'item'
        end
        object cxGridBillDetailsDBTableView1bdobjectdesc: TcxGridDBColumn
          Caption = #3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660
          Options.Sorting = False
          Width = 376
          DataBinding.FieldName = 'bdobjectdesc'
        end
        object cxGridBillDetailsDBTableView1bdfounddesc: TcxGridDBColumn
          Caption = #3585#3629#3591#3607#3640#3609
          Options.Sorting = False
          Width = 372
          DataBinding.FieldName = 'bdfounddesc'
        end
        object cxGridBillDetailsDBTableView1bdamount: TcxGridDBColumn
          Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
          Options.Sorting = False
          Width = 151
          DataBinding.FieldName = 'bdamount'
        end
        object cxGridBillDetailsDBTableView1bdbankbook: TcxGridDBColumn
          Caption = #3594#3639#3656#3629#3610#3633#3597#3594#3637#3608#3609#3634#3588#3634#3619
          Visible = False
          Options.Sorting = False
          Width = 178
          DataBinding.FieldName = 'bdbankbook'
        end
        object cxGridBillDetailsDBTableView1bdacccode: TcxGridDBColumn
          Caption = #3627#3617#3634#3618#3648#3621#3586#3610#3633#3597#3594#3637
          Visible = False
          Options.Sorting = False
          Width = 122
          DataBinding.FieldName = 'bdacccode'
        end
      end
      object cxGridBillDetailsLevel1: TcxGridLevel
        GridView = cxGridBillDetailsDBTableView1
      end
    end
    object pnHeader: TRzPanel
      Left = 0
      Top = 0
      Width = 943
      Height = 28
      Align = alTop
      BorderOuter = fsNone
      Color = 5832793
      TabOrder = 1
      object lbHeader: TRzLabel
        Left = 8
        Top = 6
        Width = 183
        Height = 16
        Caption = #3619#3633#3610#3610#3619#3636#3592#3634#3588' ( Front Donations )'
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPeroidNo: TRzLabel
        Left = 317
        Top = 2
        Width = 76
        Height = 26
        AutoSize = False
        Caption = '00000 '
        Color = clGray
        Font.Charset = THAI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        BlinkColor = clWhite
        BorderColor = clWhite
        BorderShadow = clWhite
        FlyByColor = clWhite
        FlyByEnabled = True
        ShadowColor = 64
        TextStyle = tsShadow
      end
      object RzLabel1: TRzLabel
        Left = 232
        Top = 2
        Width = 81
        Height = 26
        Alignment = taRightJustify
        AutoSize = False
        Caption = #3648#3621#3586#3607#3637#3656#3648#3623#3619' :'
        Color = clGray
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        BlinkColor = clYellow
        BorderColor = clYellow
        BorderShadow = clBlack
        FlyByColor = clYellow
        FlyByEnabled = True
        ShadowColor = 64
        TextStyle = tsShadow
      end
      object RzLabel2: TRzLabel
        Left = 384
        Top = 2
        Width = 97
        Height = 26
        Alignment = taRightJustify
        AutoSize = False
        Caption = #3594#3639#3656#3629'-'#3609#3634#3617#3626#3585#3640#3621' :'
        Color = clGray
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        BlinkColor = clYellow
        BorderColor = clYellow
        BorderShadow = clBlack
        FlyByColor = clYellow
        FlyByEnabled = True
        ShadowColor = 64
        TextStyle = tsShadow
      end
      object lbUserName: TRzLabel
        Left = 482
        Top = 2
        Width = 191
        Height = 26
        AutoSize = False
        Caption = #3609#3634#3618#3585#3585#3585' '#3586#3586#3586
        Color = clGray
        Font.Charset = THAI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        BlinkColor = clWhite
        BorderColor = clWhite
        BorderShadow = clWhite
        FlyByColor = clWhite
        FlyByEnabled = True
        ShadowColor = 64
        TextStyle = tsShadow
      end
      object RzLabel3: TRzLabel
        Left = 669
        Top = 2
        Width = 97
        Height = 26
        Alignment = taRightJustify
        AutoSize = False
        Caption = #3592#3640#3604#3619#3633#3610#3610#3619#3636#3592#3634#3588' :'
        Color = clGray
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        BlinkColor = clYellow
        BorderColor = clYellow
        BorderShadow = clBlack
        FlyByColor = clYellow
        FlyByEnabled = True
        ShadowColor = 64
        TextStyle = tsShadow
      end
      object lbDonationPoint: TRzLabel
        Left = 767
        Top = 2
        Width = 180
        Height = 26
        AutoSize = False
        Caption = #3617#3641#3621#3609#3636#3608#3636
        Color = clGray
        Font.Charset = THAI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        BlinkColor = clWhite
        BorderColor = clWhite
        BorderShadow = clWhite
        FlyByColor = clWhite
        FlyByEnabled = True
        ShadowColor = 64
        TextStyle = tsShadow
      end
    end
    object pnTop: TRzPanel
      Left = 0
      Top = 28
      Width = 943
      Height = 439
      Align = alTop
      BorderOuter = fsPopup
      TabOrder = 2
      object pnProject: TRzPanel
        Left = 1
        Top = 1
        Width = 941
        Height = 41
        Align = alTop
        BorderOuter = fsGroove
        Color = clSilver
        TabOrder = 0
        object lbProject: TLabel
          Left = 143
          Top = 8
          Width = 70
          Height = 23
          AutoSize = False
          Caption = ' '#3650#3588#3619#3591#3585#3634#3619
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object spProject: TSpeedButton
          Left = 4
          Top = 5
          Width = 67
          Height = 30
          GroupIndex = 1
          Caption = #3650#3588#3619#3591#3585#3634#3619
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = spProjectClick
        end
        object spNormal: TSpeedButton
          Left = 71
          Top = 5
          Width = 67
          Height = 30
          GroupIndex = 1
          Down = True
          Caption = #3611#3585#3605#3636
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = spProjectClick
        end
        object edProject: TRzEdit
          Left = 214
          Top = 8
          Width = 440
          Height = 24
          Color = clInfoBk
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnKeyDown = edProjectKeyDown
        end
      end
      object pnClients: TRzPanel
        Left = 1
        Top = 81
        Width = 941
        Height = 357
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 1
        object Label1: TLabel
          Left = 4
          Top = 143
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3607#3637#3656#3610#3619#3636#3592#3634#3588
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 4
          Top = 192
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
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
          Left = 4
          Top = 167
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3594#3639#3656#3629#3608#3609#3634#3588#3634#3619
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
          Left = 341
          Top = 191
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3629#3629#3585' '#3603' '#3623#3633#3609#3607#3637#3656
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
          Left = 341
          Top = 143
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3594#3635#3619#3632#3648#3591#3636#3609#3649#3610#3610
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
        object Label8: TLabel
          Left = 341
          Top = 167
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3626#3634#3586#3634
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
        object Label9: TLabel
          Left = 4
          Top = 217
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3626#3635#3627#3619#3633#3610' / '#3617#3634#3592#3634#3585
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
        object lbAmount: TLabel
          Left = 591
          Top = 244
          Width = 318
          Height = 28
          Alignment = taRightJustify
          AutoSize = False
          Caption = #3618#3629#3604#3605#3633#3657#3591#3610#3619#3636#3592#3634#3588' 1,000,000.00 '#3610#3634#3607
          Color = clBlack
          Font.Charset = THAI_CHARSET
          Font.Color = clYellow
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label3: TLabel
          Left = 5
          Top = 273
          Width = 73
          Height = 22
          AutoSize = False
          Caption = ' '#3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660
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
        object Label11: TLabel
          Left = 5
          Top = 299
          Width = 73
          Height = 22
          AutoSize = False
          Caption = ' '#3585#3629#3591#3607#3640#3609
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
        object Label12: TLabel
          Left = 5
          Top = 324
          Width = 73
          Height = 24
          AutoSize = False
          Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object lbPay: TLabel
          Left = 591
          Top = 273
          Width = 318
          Height = 28
          Alignment = taRightJustify
          AutoSize = False
          Caption = #3618#3629#3604#3610#3619#3636#3592#3634#3588' 1,000,000.00 '#3610#3634#3607
          Color = clBlack
          Font.Charset = THAI_CHARSET
          Font.Color = clLime
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object btnSelectBank: TSpeedButton
          Left = 146
          Top = 167
          Width = 24
          Height = 22
          Caption = '...'
          Enabled = False
          OnClick = btnSelectBankClick
        end
        object Label2: TLabel
          Left = 615
          Top = 142
          Width = 100
          Height = 24
          AutoSize = False
          Caption = ' '#3623#3633#3609#3607#3637#3656#3619#3633#3610#3610#3619#3636#3592#3634#3588
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
        object Label20: TLabel
          Left = 311
          Top = 324
          Width = 50
          Height = 24
          AutoSize = False
          Caption = ' '#3610#3634#3607
          Color = clSilver
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label21: TLabel
          Left = 615
          Top = 168
          Width = 100
          Height = 22
          AutoSize = False
          Caption = ' '#3648#3621#3586#3607#3637#3656#3610#3633#3597#3594#3637
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
        object btnAddObjective: TRzBitBtn
          Left = 2
          Top = 242
          Width = 126
          Height = 27
          Caption = 'F6-'#3648#3614#3636#3656#3617#3619#3634#3618#3585#3634#3619
          Color = 16753994
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 0
          TabStop = False
          OnClick = btnAddObjectiveClick
        end
        object btnEditItem: TRzBitBtn
          Left = 128
          Top = 242
          Width = 106
          Height = 27
          Caption = 'F7 '#3649#3585#3657#3652#3586#3619#3634#3618#3585#3634#3619
          Color = 16753994
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 1
          TabStop = False
          OnClick = btnEditItemClick
        end
        object btnClear: TRzBitBtn
          Left = 234
          Top = 242
          Width = 137
          Height = 27
          Caption = 'Ctrl+F7 '#3621#3610#3619#3634#3618#3585#3634#3619
          Color = 16753994
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 2
          TabStop = False
          OnClick = btnClearClick
        end
        object btnSave: TRzBitBtn
          Left = 469
          Top = 242
          Width = 118
          Height = 28
          Caption = 'F4-'#3610#3633#3609#3607#3638#3585#3619#3634#3618#3585#3634#3619
          Color = 14155694
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 3
          TabStop = False
          OnClick = btnSaveClick
        end
        object cmbPayType: TRzComboBox
          Left = 444
          Top = 142
          Width = 169
          Height = 24
          Style = csDropDownList
          Ctl3D = False
          FocusColor = 16766975
          FrameVisible = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 4
          OnChange = cmbPayTypeChange
          OnKeyDown = cmbPayTypeKeyDown
          Items.Strings = (
            'AAA'
            'BBB'
            'CCC')
        end
        object edAmount: TRzNumericEdit
          Left = 107
          Top = 142
          Width = 231
          Height = 24
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FrameVisible = True
          ParentFont = False
          TabOrder = 5
          OnKeyDown = edAmountKeyDown
          DisplayFormat = ',0;(,0)'
        end
        object edObjtiveName: TRzEdit
          Left = 150
          Top = 273
          Width = 436
          Height = 22
          Color = clInfoBk
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object edFundName: TRzEdit
          Left = 150
          Top = 299
          Width = 436
          Height = 22
          Color = clInfoBk
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object edFAmount: TRzEdit
          Left = 80
          Top = 324
          Width = 228
          Height = 24
          Color = 15794175
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
          OnKeyDown = edFAmountKeyDown
        end
        object edObjtiveCode: TRzEdit
          Left = 80
          Top = 273
          Width = 67
          Height = 22
          Color = 15794175
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
          OnKeyDown = edObjtiveCodeKeyDown
        end
        object edFundCode: TRzEdit
          Left = 80
          Top = 299
          Width = 67
          Height = 22
          Color = 15794175
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
          OnKeyDown = edFundCodeKeyDown
        end
        object edBankBranch: TRzEdit
          Left = 444
          Top = 167
          Width = 168
          Height = 22
          Ctl3D = False
          Enabled = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 11
          OnKeyDown = edBankBranchKeyDown
        end
        object edRefDate1: TRzEdit
          Left = 700
          Top = 176
          Width = 168
          Height = 22
          Ctl3D = False
          Enabled = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 12
          Visible = False
          OnKeyDown = edRefDate1KeyDown
        end
        object edBank: TRzEdit
          Left = 107
          Top = 167
          Width = 37
          Height = 22
          Ctl3D = False
          Enabled = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 13
          OnKeyDown = edBankKeyDown
        end
        object edRefCode: TRzEdit
          Left = 107
          Top = 192
          Width = 231
          Height = 22
          Ctl3D = False
          Enabled = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 14
          OnKeyDown = edRefCodeKeyDown
        end
        object edRecDesc: TRzEdit
          Left = 107
          Top = 217
          Width = 445
          Height = 22
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 15
          OnKeyDown = edRecDescKeyDown
        end
        object edBankName: TRzEdit
          Left = 172
          Top = 167
          Width = 166
          Height = 22
          TabStop = False
          Ctl3D = False
          Enabled = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object dtRecDate: TRzDateTimeEdit
          Left = 719
          Top = 142
          Width = 163
          Height = 24
          EditType = etDate
          TabOnEnter = True
          TabOrder = 17
        end
        object BitBtn1: TBitBtn
          Left = 632
          Top = 88
          Width = 75
          Height = 25
          Caption = 'BitBtn1'
          TabOrder = 18
          Visible = False
          OnClick = BitBtn1Click
        end
        object btnCancel: TRzBitBtn
          Left = 372
          Top = 242
          Width = 92
          Height = 28
          Caption = #3618#3585#3648#3621#3636#3585#3619#3634#3618#3585#3634#3619
          Color = 4227327
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 19
          TabStop = False
          OnClick = btnCancelClick
        end
        object pn2: TRzPanel
          Left = 0
          Top = 0
          Width = 941
          Height = 140
          Align = alTop
          BorderOuter = fsLowered
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          GradientColorStyle = gcsCustom
          GradientColorStop = 15400938
          GradientDirection = gdVerticalEnd
          ParentFont = False
          TabOrder = 20
          object Label10: TLabel
            Left = 404
            Top = 28
            Width = 100
            Height = 22
            AutoSize = False
            Caption = ' '#3627#3617#3641#3656
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label13: TLabel
            Left = 4
            Top = 28
            Width = 100
            Height = 24
            AutoSize = False
            Caption = ' '#3610#3657#3634#3609#3648#3621#3586#3607#3637#3656
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label14: TLabel
            Left = 4
            Top = 56
            Width = 100
            Height = 24
            AutoSize = False
            Caption = ' '#3606#3609#3609
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label15: TLabel
            Left = 404
            Top = 56
            Width = 100
            Height = 22
            AutoSize = False
            Caption = ' '#3605#3635#3610#3621'/'#3649#3586#3623#3591
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label16: TLabel
            Left = 4
            Top = 84
            Width = 100
            Height = 24
            AutoSize = False
            Caption = ' '#3592#3633#3591#3627#3623#3633#3604
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label17: TLabel
            Left = 650
            Top = 28
            Width = 100
            Height = 22
            AutoSize = False
            Caption = ' '#3605#3619#3629#3585'/'#3595#3629#3618
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label18: TLabel
            Left = 650
            Top = 56
            Width = 100
            Height = 22
            AutoSize = False
            Caption = ' '#3629#3635#3648#3616#3629'/'#3648#3586#3605
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label19: TLabel
            Left = 404
            Top = 84
            Width = 100
            Height = 22
            AutoSize = False
            Caption = ' '#3619#3627#3633#3626#3652#3611#3619#3625#3603#3637#3618#3660
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label28: TLabel
            Tag = 100
            Left = 4
            Top = 5
            Width = 933
            Height = 20
            Align = alCustom
            AutoSize = False
            Caption = ' '#3607#3637#3656#3629#3618#3641#3656#3611#3633#3592#3592#3640#3610#3633#3609
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label33: TLabel
            Left = 4
            Top = 111
            Width = 100
            Height = 24
            AutoSize = False
            Caption = ' '#3627#3617#3634#3618#3648#3627#3605#3640
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object RzDBEdit8: TRzDBEdit
            Tag = 99
            Left = 106
            Top = 28
            Width = 295
            Height = 26
            DataSource = dsDonator
            DataField = 'do_addr1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 0
          end
          object RzDBEdit9: TRzDBEdit
            Tag = 99
            Left = 506
            Top = 28
            Width = 142
            Height = 26
            DataSource = dsDonator
            DataField = 'do_mu1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 1
          end
          object RzDBEdit10: TRzDBEdit
            Tag = 99
            Left = 506
            Top = 56
            Width = 142
            Height = 26
            DataSource = dsDonator
            DataField = 'do_tambon1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 2
          end
          object RzDBEdit15: TRzDBEdit
            Tag = 99
            Left = 106
            Top = 84
            Width = 295
            Height = 26
            DataSource = dsDonator
            DataField = 'do_province1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 3
          end
          object RzDBEdit12: TRzDBEdit
            Tag = 99
            Left = 752
            Top = 56
            Width = 186
            Height = 26
            DataSource = dsDonator
            DataField = 'do_amphor1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 4
          end
          object RzDBEdit13: TRzDBEdit
            Tag = 99
            Left = 506
            Top = 84
            Width = 142
            Height = 26
            DataSource = dsDonator
            DataField = 'do_zipcode1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 5
          end
          object RzDBEdit14: TRzDBEdit
            Tag = 99
            Left = 106
            Top = 111
            Width = 389
            Height = 26
            DataSource = dsDonator
            DataField = 'do_remark1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 6
          end
          object RzDBEdit16: TRzDBEdit
            Tag = 99
            Left = 106
            Top = 56
            Width = 295
            Height = 26
            DataSource = dsDonator
            DataField = 'do_street1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 7
          end
          object RzDBEdit17: TRzDBEdit
            Tag = 99
            Left = 752
            Top = 28
            Width = 186
            Height = 26
            DataSource = dsDonator
            DataField = 'do_soi1'
            Color = 15395562
            FrameVisible = True
            TabOrder = 8
          end
        end
        object edRefDate: TRzMaskEdit
          Left = 444
          Top = 192
          Width = 167
          Height = 24
          Ctl3D = True
          Enabled = False
          EditMask = '##/##/####'
          FocusColor = 16766975
          FrameVisible = True
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 21
          Text = '  /  /    '
          OnKeyDown = edRefDateKeyDown
        end
        object edAccNo: TRzEdit
          Left = 719
          Top = 167
          Width = 162
          Height = 22
          Ctl3D = False
          Enabled = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 22
          OnKeyDown = edRefCodeKeyDown
        end
      end
      object RzPanel1: TRzPanel
        Left = 1
        Top = 42
        Width = 941
        Height = 39
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 2
        object lbOrderItem: TLabel
          Left = 140
          Top = 8
          Width = 73
          Height = 23
          AutoSize = False
          Caption = ' '#3612#3641#3657#3610#3619#3636#3592#3634#3588
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
        object btnSearch: TRzBitBtn
          Left = 4
          Top = 6
          Width = 133
          Height = 27
          Caption = #3588#3657#3609#3627#3634#3612#3641#3657#3610#3619#3636#3592#3634#3588'..'
          Color = 16753919
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 0
          TabStop = False
          OnClick = btnSearchClick
        end
        object edDonatorName: TRzEdit
          Left = 215
          Top = 8
          Width = 440
          Height = 24
          Color = clInfoBk
          Ctl3D = False
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          FocusColor = 16766975
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnKeyDown = edDonatorNameKeyDown
        end
        object btnBillingInfo: TRzBitBtn
          Left = 657
          Top = 6
          Width = 129
          Height = 27
          Caption = #3619#3634#3618#3585#3634#3619#3619#3633#3610#3607#3633#3657#3591#3627#3617#3604
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 2
          TabStop = False
          OnClick = btnBillingInfoClick
        end
        object ckKeyBillNo: TCheckBox
          Left = 795
          Top = 10
          Width = 126
          Height = 17
          Caption = #3585#3619#3629#3585#3648#3621#3586#3607#3637#3656#3610#3636#3621#3648#3629#3591
          TabOrder = 3
        end
      end
    end
  end
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 30
    Width = 943
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 1
    VisualStyle = vsGradient
  end
  object cdsBill: TClientDataSet
    Tag = 99
    Active = True
    Aggregates = <>
    CommandText = 'select * from bill'
    Params = <>
    Left = 64
    Top = 354
    Data = {
      D00200009619E0BD020000001800000017000000000003000000D00203626964
      010049000000010005574944544802000200080003626E6F0100490000000100
      0557494454480200020007000762706572696F64010049000000010005574944
      5448020002000500056264617465100011000000010007535542545950450200
      49000A00466F726D6174746564000662746F74616C0900050000000200084445
      43494D414C53020002000200055749445448020002000E000862706179747970
      650100490000000100055749445448020002000200056262616E6B0100490000
      000100055749445448020002001900096262616E6B6E616D6501004900000001
      0005574944544802000200640007626272616E63650100490000000100055749
      44544802000200280006627265666E6F01004900000001000557494454480200
      02001E0008627265666461746510001100000001000753554254595045020049
      000A00466F726D61747465640007627573657269640100490000000100055749
      445448020002000500056266726F6D0100490000000100055749445448020002
      009600056272796964010049000000010005574944544802000200050004626C
      6F63010049000000010005574944544802000200020006627370696964010049
      00000001000557494454480200020005000662656E7472791000110000000100
      0753554254595045020049000A00466F726D6174746564000662636F6D696401
      00490000000100055749445448020002000200096263616E63656C6964010049
      00000001000557494454480200020007000B7265636569766564617465100011
      00000001000753554254595045020049000A00466F726D617474656400076273
      74617475730100490020000100055749445448020002000100086270726F6A65
      63740100490000000100055749445448020002000A00076272656D61726B0200
      49000000010005574944544802000200FF000000}
    object cdsBillbid: TStringField
      FieldName = 'bid'
      Size = 8
    end
    object cdsBillbno: TStringField
      FieldName = 'bno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object cdsBillbperiod: TStringField
      FieldName = 'bperiod'
      Size = 5
    end
    object cdsBillbdate: TSQLTimeStampField
      FieldName = 'bdate'
    end
    object cdsBillbtotal: TBCDField
      FieldName = 'btotal'
      Precision = 14
      Size = 2
    end
    object cdsBillbpaytype: TStringField
      FieldName = 'bpaytype'
      Size = 2
    end
    object cdsBillbbank: TStringField
      FieldName = 'bbank'
      Size = 25
    end
    object cdsBillbbankname: TStringField
      FieldName = 'bbankname'
      Size = 100
    end
    object cdsBillbbrance: TStringField
      FieldName = 'bbrance'
      Size = 40
    end
    object cdsBillbrefno: TStringField
      FieldName = 'brefno'
      Size = 30
    end
    object cdsBillbrefdate: TSQLTimeStampField
      FieldName = 'brefdate'
    end
    object cdsBillbuserid: TStringField
      FieldName = 'buserid'
      Size = 5
    end
    object cdsBillbfrom: TStringField
      FieldName = 'bfrom'
      Size = 150
    end
    object cdsBillbryid: TStringField
      FieldName = 'bryid'
      Size = 5
    end
    object cdsBillbloc: TStringField
      FieldName = 'bloc'
      Size = 2
    end
    object cdsBillbspiid: TStringField
      FieldName = 'bspiid'
      Size = 5
    end
    object cdsBillbentry: TSQLTimeStampField
      FieldName = 'bentry'
    end
    object cdsBillbcomid: TStringField
      FieldName = 'bcomid'
      Size = 2
    end
    object cdsBillbcancelid: TStringField
      FieldName = 'bcancelid'
      Size = 7
    end
    object cdsBillreceivedate: TSQLTimeStampField
      FieldName = 'receivedate'
    end
    object cdsBillbstatus: TStringField
      FieldName = 'bstatus'
      FixedChar = True
      Size = 1
    end
    object cdsBillbproject: TStringField
      FieldName = 'bproject'
      Size = 10
    end
    object cdsBillbremark: TStringField
      FieldName = 'bremark'
      Size = 255
    end
  end
  object cdsBillDetails: TClientDataSet
    Tag = 99
    Active = True
    Aggregates = <>
    CommandText = 'select * from billdetail order by item'
    Params = <>
    BeforeEdit = cdsBillDetailsBeforeEdit
    AfterPost = cdsBillDetailsAfterPost
    BeforeDelete = cdsBillDetailsBeforeDelete
    AfterDelete = cdsBillDetailsAfterDelete
    OnCalcFields = cdsBillDetailsCalcFields
    Left = 32
    Top = 402
    Data = {
      510100009619E0BD01000000180000000A00000000000300000051010462646E
      6F0100490004000100055749445448020002000700046974656D040001000400
      00000862646F626A656374010049000000010005574944544802000200040007
      6264666F756E640100490000000100055749445448020002000400086264616D
      6F756E74090005000000020008444543494D414C530200020002000557494454
      48020002000E000A626462616E6B626F6F6B0100490000000100055749445448
      020002000700096264616363636F646501004900000001000557494454480200
      020007000B6264666F756E647479706501004900000001000557494454480200
      0200010009626470617974797065010049000000010005574944544802000200
      0200066264666C6167010049000000010005574944544802000200010001000D
      44454641554C545F4F524445520200820000000000}
    object cdsBillDetailsbdno: TStringField
      FieldName = 'bdno'
      Required = True
      Size = 7
    end
    object cdsBillDetailsitem: TIntegerField
      FieldName = 'item'
      KeyFields = 'item'
      Required = True
    end
    object cdsBillDetailsbdobject: TStringField
      FieldName = 'bdobject'
      Size = 4
    end
    object cdsBillDetailsbdfound: TStringField
      FieldName = 'bdfound'
      Size = 4
    end
    object cdsBillDetailsbdamount: TBCDField
      FieldName = 'bdamount'
      Precision = 14
      Size = 2
    end
    object cdsBillDetailsbdbankbook: TStringField
      FieldName = 'bdbankbook'
      Size = 7
    end
    object cdsBillDetailsbdacccode: TStringField
      FieldName = 'bdacccode'
      Size = 7
    end
    object cdsBillDetailsbdfoundtype: TStringField
      FieldName = 'bdfoundtype'
      FixedChar = True
      Size = 1
    end
    object cdsBillDetailsbdpaytype: TStringField
      FieldName = 'bdpaytype'
      Size = 2
    end
    object cdsBillDetailsbdflag: TStringField
      FieldName = 'bdflag'
      FixedChar = True
      Size = 1
    end
    object cdsBillDetailsbdobjectdesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'bdobjectdesc'
      Size = 255
      Calculated = True
    end
    object cdsBillDetailsbdfounddesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'bdfounddesc'
      Size = 255
      Calculated = True
    end
  end
  object dsBill: TDataSource
    DataSet = cdsBill
    Left = 136
    Top = 354
  end
  object dsBillDetails: TDataSource
    DataSet = cdsBillDetails
    Left = 160
    Top = 418
  end
  object cdsBillDetailsw: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 442
  end
  object cdsBillw: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 450
  end
  object Conn: TSQLConnection
    ConnectionName = 'Devart SQL Server'
    DriverName = 'DevartSQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=.'
      'DataBase=fddb_temp'
      'DriverName=DevartSQLServer'
      'User_Name=sa'
      'Password=123456'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    Left = 32
    Top = 506
  end
  object SQLDataSet: TSQLDataSet
    CommandText = 
      'select a.*,b.o_title,c.fd_title from billdetail a LEFT join obje' +
      'ct_code b on a.bdobject=b.o_code left join found_code c on a.bdf' +
      'ound=c.fd_code where a.bdno='#39'0000019'#39' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 88
    Top = 506
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataSet
    Options = [poAllowMultiRecordUpdates, poAllowCommandText]
    Left = 136
    Top = 506
  end
  object cdsBankCode: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 248
    Top = 538
  end
  object cdsFund: TClientDataSet
    Aggregates = <>
    CommandText = 'select do_id,do_prename,do_name,do_lname from donator'
    Params = <>
    ProviderName = 'dsp'
    Left = 256
    Top = 466
  end
  object cdsObjective: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from bill'
    Params = <>
    ProviderName = 'dsp'
    Left = 256
    Top = 410
  end
  object cdsSearch: TClientDataSet
    Aggregates = <>
    CommandText = 'select do_id,do_prename,do_name,do_lname from donator'
    Params = <>
    ProviderName = 'dsp'
    Left = 256
    Top = 354
  end
  object cdsRoyal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 424
    Top = 354
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 672
    Top = 346
  end
  object dsObjective: TDataSource
    DataSet = cdsObjective
    Left = 328
    Top = 410
  end
  object cdsFundList: TClientDataSet
    Aggregates = <>
    CommandText = 'select do_id,do_prename,do_name,do_lname from donator'
    Params = <>
    ProviderName = 'dsp'
    Left = 328
    Top = 458
  end
  object cdsDonator: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from donator where do_id='#39'00000010'#39
    Params = <>
    ProviderName = 'dsp'
    Left = 392
    Top = 530
  end
  object cdsDonatorHistoryDtl: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.*,b.o_title,c.fd_title from billdetail a LEFT join obje' +
      'ct_code b on a.bdobject=b.o_code left join found_code c on a.bdf' +
      'ound=c.fd_code where a.bdno='#39'0000019'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 512
    Top = 562
  end
  object cdsDonatorHistoryHdr: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from bill where bno='#39'1021011'#39
    Params = <>
    ProviderName = 'dsp'
    AfterScroll = cdsDonatorHistoryHdrAfterScroll
    Left = 504
    Top = 512
  end
  object cdsProjects: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 328
    Top = 530
  end
  object cdsBillReport: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select   a.*,b.*,c.* ,d.pt_title ,e.o_title ,f.fd_title from bil' +
      'l  a  left join billdetail b on a.bno=b.bdno   left join donator' +
      ' c on a.bid=c.do_id  left join paytype d on a.bpaytype=d.pt_code' +
      ' left join object_code e on b.bdobject=e.o_code left join found_' +
      'code f on b.bdfound=f.fd_code where bno='#39'1021129'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 440
    Top = 410
  end
  object frxCdsBill: TfrxDBDataset
    UserName = 'frxDBBill'
    CloseDataSource = False
    DataSet = cdsBillReport
    BCDToCurrency = False
    Left = 592
    Top = 394
  end
  object frxReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41217.649291909700000000
    ReportOptions.LastChange = 41225.532602858800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  kLuk : array [1..10] of string;'
      '  kNum : array [0..9] of string;'
      '  MyTXT: String;      '
      ''
      
        'function StringReplace(const S, OldPattern, NewPattern: string;)' +
        ': string;'
      'var'
      '  SearchStr, Patt, NewStr: string;'
      '  Offset: Integer;'
      'begin'
      ''
      '    SearchStr := S;'
      '    Patt := OldPattern;'
      ''
      '  NewStr := S;'
      '  Result := '#39#39';'
      '  while SearchStr <> '#39#39' do'
      '  begin'
      '    Offset := Pos(Patt, SearchStr);'
      '    if Offset = 0 then'
      '    begin'
      '      Result := Result + NewStr;'
      '      Break;'
      '    end;'
      '    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;'
      '    NewStr := Copy(NewStr, Offset + Length(OldPattern), 60000);'
      ''
      '    SearchStr := Copy(SearchStr, Offset + Length(Patt), 60000);'
      '  end;'
      'end;'
      '   function TextBaht(extBaht: Extended): string;'
      'var'
      '  strBaht, strStang, strTmpBaht, strTmpStang : string;'
      '  n, i : integer;'
      'begin'
      '  Result := '#39#39';'
      ''
      '  strBaht := FormatFloat('#39'0.00'#39',extBaht); '
      '  n := Pos('#39'.'#39',strBaht);  '
      '  strStang := Copy(strBaht,n+1,2); '
      '  strBaht  := Copy(strBaht,1,n-1); '
      '    '
      '  strTmpBaht := '#39#39';'
      '  i := Length(strBaht);'
      '  for n := 1 to Length(strBaht) do'
      '    begin'
      '      if (strBaht[n]='#39'0'#39') then'
      '        begin'
      
        '          if (i=7) and (strTmpBaht<>'#39#39') then strTmpBaht := strTm' +
        'pBaht + kLuk[i];'
      '          Dec(i);'
      '          Continue;'
      '        end;'
      
        '      strTmpBaht := strTmpBaht + kNum[StrToInt(strBaht[n])] + kL' +
        'uk[i];'
      '      Dec(i);'
      '    end;    '
      
        '  if (strTmpBaht <> '#39#39') then strTmpBaht := strTmpBaht + '#39#3610#3634#3607#39';  ' +
        '  '
      '  strTmpStang := '#39#39';    '
      '  if (strStang[1]<>'#39'0'#39') then'
      
        '    strTmpStang := strTmpStang + kNum[StrToInt(strStang[1])] + k' +
        'Luk[2];    '
      '  if (strStang[2]<>'#39'0'#39') then '
      
        '    strTmpStang := strTmpStang + kNum[StrToInt(strStang[2])];   ' +
        ' '
      '  if (strTmpStang<>'#39#39') then'
      '    begin'
      '      strTmpStang := strTmpStang + '#39#3626#3605#3634#3591#3588#3660#39';'
      '      strTmpBaht := strTmpBaht + strTmpStang;'
      '    end'
      '  else if (strTmpBaht<>'#39#39') then '
      '    strTmpBaht := strTmpBaht +'#39#3606#3657#3623#3609#39';    '
      '  if (strTmpBaht<>'#39#39')  then'
      '    begin'
      '      strTmpBaht := StringReplace(strTmpBaht,'#39#3627#3609#3638#3656#3591#3626#3636#3610#39','#39#3626#3636#3610#39');'
      
        '      strTmpBaht := StringReplace(strTmpBaht,'#39#3626#3636#3610#3627#3609#3638#3656#3591#39','#39#3626#3636#3610#3648#3629#3655#3604 +
        #39');'
      
        '      strTmpBaht := StringReplace(strTmpBaht,'#39#3626#3629#3591#3626#3636#3610#39','#39#3618#3637#3656#3626#3636#3610#39');' +
        '          '
      '      Result := strTmpBaht;'
      '    end;'
      'end;'
      '  '
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    MyTXT :=TextBaht(StrToFloat(<frxDBBill."btotal">));  '
      'end;'
      ''
      'begin'
      'kLuk[1] := '#39#39';'
      'kLuk[2] := '#39#3626#3636#3610#39';'
      'kLuk[3] := '#39#3619#3657#3629#3618#39';'
      'kLuk[4] := '#39#3614#3633#3609#39';'
      'kLuk[5] := '#39#3627#3617#3639#3656#3609#39';'
      'kLuk[6] := '#39#3649#3626#3609#39';'
      'kLuk[7] := '#39#3621#3657#3634#3609#39';'
      'kLuk[8] := '#39#3626#3636#3610#39';  '
      'kLuk[9] := '#39#3619#3657#3629#3618#39';'
      'kLuk[10] := '#39#3614#3633#3609#39';    '
      '    '
      'kNum[0] := '#39#39';'
      'kNum[1] := '#39#3627#3609#3638#3656#3591#39';'
      'kNum[2] := '#39#3626#3629#3591#39';'
      'kNum[3] := '#39#3626#3634#3617#39';'
      'kNum[4] := '#39#3626#3637#3656#39';'
      'kNum[5] := '#39#3627#3657#3634#39';'
      'kNum[6] := '#39#3627#3585#39';'
      'kNum[7] := '#39#3648#3592#3655#3604#39';'
      'kNum[8] := '#39#3649#3611#3604#39';  '
      'kNum[9] := '#39#3648#3585#3657#3634#39';  '
      'end.')
    Left = 672
    Top = 394
    Datasets = <
      item
        DataSet = frxCdsBill
        DataSetName = 'frxDBBill'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object GroupHeader1: TfrxGroupHeader
        Height = 278.244280000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        Condition = 'frxDBBill."bno"'
        object Date: TfrxMemoView
          Left = 517.795610000000000000
          Top = 97.370130000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '[FormatDateTime('#39'dd mmmm'#39',Date)] [YearOf(Date)+543]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 143.622140000000000000
          Top = 234.433210000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '**  [FormatFloat('#39'#,##0'#39',<frxDBBill."btotal">)] **')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo2: TfrxMemoView
          Left = 321.260050000000000000
          Top = 234.433210000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo2OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[MyTXT]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo7: TfrxMemoView
          Left = 114.385900000000000000
          Top = 142.724490000000000000
          Width = 646.299630000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."do_prename">)+'#39' '#39'+trim(<frxDBBill."do_name">)+' +
              #39' '#39'+trim(<frxDBBill."do_lname">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 114.385900000000000000
          Top = 172.740260000000000000
          Width = 646.299630000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_addr1">] '#3648#3608#3595#3648#3608#3585#3648#3608#3609#3648#3609#136' [<frxDBBill."do_mu1">] '#3648#3608#139 +
              #3648#3608#3597#3648#3608#3586'[<frxDBBill."do_soi1">] '#3648#3608#8211#3648#3608#153#3648#3608#153'[<frxDBBill."do_street1">' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 114.385900000000000000
          Top = 199.196970000000000000
          Width = 646.299630000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_tambon1">] [<frxDBBill."do_amphor1">] [<frxDBBil' +
              'l."do_province1">] [<frxDBBill."do_zipcode1">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 80.133890000000000000
          Top = 259.346630000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBBill."pt_title"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 23.811023622047200000
        Top = 370.393940000000000000
        Width = 793.701300000000000000
        object Memo16: TfrxMemoView
          Left = 56.692950000000000000
          Top = 1.000000000000000000
          Width = 684.094930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 321.260050000000000000
        Width = 793.701300000000000000
        DataSet = frxCdsBill
        DataSetName = 'frxDBBill'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 81.133890000000000000
          Width = 684.094930000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."o_title">)] [trim(<frxDBBill."fd_title">)]  [i' +
              'if(<frxDBBill."bdamount"><=0,'#39' '#39',FormatFloat('#39'#,##0'#39',<frxDBBill.' +
              '"bdamount">))]  [ iif(<frxDBBill."bdamount"><=0,'#39' '#39','#39' '#3648#3608#154#3648#3608#3602#3648#3608#8212#39 +
              ')]')
          ParentFont = False
        end
        object frxDBBillitem: TfrxMemoView
          Printable = False
          Left = 15.118120000000000000
          Width = 26.456710000000000000
          Height = 26.456710000000000000
          Visible = False
          ShowHint = False
          DataField = 'item'
          DataSet = frxCdsBill
          DataSetName = 'frxDBBill'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBBill."item"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 412.448980000000000000
        Top = 415.748300000000000000
        Width = 793.701300000000000000
        Condition = 'frxDBBill."bno"'
        object Memo6: TfrxMemoView
          Left = 525.016080000000000000
          Top = 245.606370000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            '[FormatDateTime('#39'dd mmmm'#39',Date)] [YearOf(Date)+543]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 118.606370000000000000
          Top = 289.740260000000000000
          Width = 631.181510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."do_prename">)+'#39' '#39'+trim(<frxDBBill."do_name">)+' +
              #39' '#39'+trim(<frxDBBill."do_lname">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 118.606370000000000000
          Top = 318.417440000000000000
          Width = 631.181510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_addr1">] '#3648#3608#3595#3648#3608#3585#3648#3608#3609#3648#3609#136' [<frxDBBill."do_mu1">] '#3648#3608#139 +
              #3648#3608#3597#3648#3608#3586'[<frxDBBill."do_soi1">] '#3648#3608#8211#3648#3608#153#3648#3608#153'[<frxDBBill."do_street1">' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 118.606370000000000000
          Top = 346.653680000000000000
          Width = 631.181510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_tambon1">][<frxDBBill."do_amphor1">][<frxDBBill.' +
              '"do_province1">][<frxDBBill."do_zipcode1">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 158.401670000000000000
          Top = 378.889920000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '**  [FormatFloat('#39'#,##0'#39',<frxDBBill."btotal">)] **')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          Left = 339.819110000000000000
          Top = 378.889920000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[MyTXT]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 899.528140000000000000
        Width = 793.701300000000000000
        object Memo5: TfrxMemoView
          Left = 56.692950000000000000
          Width = 684.094930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData2: TfrxMasterData
        Height = 26.456710000000000000
        Top = 850.394250000000000000
        Width = 793.701300000000000000
        DataSet = frxCdsBill
        DataSetName = 'frxDBBill'
        RowCount = 0
        object Memo4: TfrxMemoView
          Left = 49.133890000000000000
          Width = 684.094930000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."o_title">)] [trim(<frxDBBill."fd_title">)]  [i' +
              'if(<frxDBBill."bdamount"><=0,'#39' '#39',FormatFloat('#39'#,##0'#39',<frxDBBill.' +
              '"bdamount">))]  [ iif(<frxDBBill."bdamount"><=0,'#39' '#39','#39' '#3648#3608#154#3648#3608#3602#3648#3608#8212#39 +
              ')]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Printable = False
          Left = 11.338590000000000000
          Width = 26.456710000000000000
          Height = 26.456710000000000000
          Visible = False
          ShowHint = False
          DataField = 'item'
          DataSet = frxCdsBill
          DataSetName = 'frxDBBill'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBBill."item"]')
          ParentFont = False
        end
      end
    end
  end
  object cdsBillingInfo: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from billdetail'
    Params = <>
    ProviderName = 'dsp'
    Left = 740
    Top = 393
  end
  object cdsBillingInfoDetail: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from billdetail'
    Params = <>
    ProviderName = 'dsp'
    Left = 740
    Top = 441
  end
  object frxReport1: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41217.649291909700000000
    ReportOptions.LastChange = 41217.871729594910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  kLuk : array [1..10] of string;'
      '  kNum : array [0..9] of string;'
      '  MyTXT: String;      '
      ''
      
        'function StringReplace(const S, OldPattern, NewPattern: string;)' +
        ': string;'
      'var'
      '  SearchStr, Patt, NewStr: string;'
      '  Offset: Integer;'
      'begin'
      ''
      '    SearchStr := S;'
      '    Patt := OldPattern;'
      ''
      '  NewStr := S;'
      '  Result := '#39#39';'
      '  while SearchStr <> '#39#39' do'
      '  begin'
      '    Offset := Pos(Patt, SearchStr);'
      '    if Offset = 0 then'
      '    begin'
      '      Result := Result + NewStr;'
      '      Break;'
      '    end;'
      '    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;'
      '    NewStr := Copy(NewStr, Offset + Length(OldPattern), 60000);'
      ''
      '    SearchStr := Copy(SearchStr, Offset + Length(Patt), 60000);'
      '  end;'
      'end;'
      '   function TextBaht(extBaht: Extended): string;'
      'var'
      '  strBaht, strStang, strTmpBaht, strTmpStang : string;'
      '  n, i : integer;'
      'begin'
      '  Result := '#39#39';'
      ''
      '  strBaht := FormatFloat('#39'0.00'#39',extBaht); '
      '  n := Pos('#39'.'#39',strBaht);  '
      '  strStang := Copy(strBaht,n+1,2); '
      '  strBaht  := Copy(strBaht,1,n-1); '
      '    '
      '  strTmpBaht := '#39#39';'
      '  i := Length(strBaht);'
      '  for n := 1 to Length(strBaht) do'
      '    begin'
      '      if (strBaht[n]='#39'0'#39') then'
      '        begin'
      
        '          if (i=7) and (strTmpBaht<>'#39#39') then strTmpBaht := strTm' +
        'pBaht + kLuk[i];'
      '          Dec(i);'
      '          Continue;'
      '        end;'
      
        '      strTmpBaht := strTmpBaht + kNum[StrToInt(strBaht[n])] + kL' +
        'uk[i];'
      '      Dec(i);'
      '    end;    '
      
        '  if (strTmpBaht <> '#39#39') then strTmpBaht := strTmpBaht + '#39#3610#3634#3607#39';  ' +
        '  '
      '  strTmpStang := '#39#39';    '
      '  if (strStang[1]<>'#39'0'#39') then'
      
        '    strTmpStang := strTmpStang + kNum[StrToInt(strStang[1])] + k' +
        'Luk[2];    '
      '  if (strStang[2]<>'#39'0'#39') then '
      
        '    strTmpStang := strTmpStang + kNum[StrToInt(strStang[2])];   ' +
        ' '
      '  if (strTmpStang<>'#39#39') then'
      '    begin'
      '      strTmpStang := strTmpStang + '#39#3626#3605#3634#3591#3588#3660#39';'
      '      strTmpBaht := strTmpBaht + strTmpStang;'
      '    end'
      '  else if (strTmpBaht<>'#39#39') then '
      '    strTmpBaht := strTmpBaht +'#39#3606#3657#3623#3609#39';    '
      '  if (strTmpBaht<>'#39#39')  then'
      '    begin'
      '      strTmpBaht := StringReplace(strTmpBaht,'#39#3627#3609#3638#3656#3591#3626#3636#3610#39','#39#3626#3636#3610#39');'
      
        '      strTmpBaht := StringReplace(strTmpBaht,'#39#3626#3636#3610#3627#3609#3638#3656#3591#39','#39#3626#3636#3610#3648#3629#3655#3604 +
        #39');'
      
        '      strTmpBaht := StringReplace(strTmpBaht,'#39#3626#3629#3591#3626#3636#3610#39','#39#3618#3637#3656#3626#3636#3610#39');' +
        '          '
      '      Result := strTmpBaht;'
      '    end;'
      'end;'
      '  '
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    MyTXT :=TextBaht(StrToFloat(<frxDBBill."btotal">));  '
      'end;'
      ''
      'begin'
      'kLuk[1] := '#39#39';'
      'kLuk[2] := '#39#3626#3636#3610#39';'
      'kLuk[3] := '#39#3619#3657#3629#3618#39';'
      'kLuk[4] := '#39#3614#3633#3609#39';'
      'kLuk[5] := '#39#3627#3617#3639#3656#3609#39';'
      'kLuk[6] := '#39#3649#3626#3609#39';'
      'kLuk[7] := '#39#3621#3657#3634#3609#39';'
      'kLuk[8] := '#39#3626#3636#3610#39';  '
      'kLuk[9] := '#39#3619#3657#3629#3618#39';'
      'kLuk[10] := '#39#3614#3633#3609#39';    '
      '    '
      'kNum[0] := '#39#39';'
      'kNum[1] := '#39#3627#3609#3638#3656#3591#39';'
      'kNum[2] := '#39#3626#3629#3591#39';'
      'kNum[3] := '#39#3626#3634#3617#39';'
      'kNum[4] := '#39#3626#3637#3656#39';'
      'kNum[5] := '#39#3627#3657#3634#39';'
      'kNum[6] := '#39#3627#3585#39';'
      'kNum[7] := '#39#3648#3592#3655#3604#39';'
      'kNum[8] := '#39#3649#3611#3604#39';  '
      'kNum[9] := '#39#3648#3585#3657#3634#39';  '
      'end.')
    Left = 632
    Top = 458
    Datasets = <
      item
        DataSet = frxCdsBill
        DataSetName = 'frxDBBill'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object GroupHeader1: TfrxGroupHeader
        Height = 253.889920000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        Condition = 'frxDBBill."bno"'
        object Date: TfrxMemoView
          Left = 517.795610000000000000
          Top = 92.370130000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '[FormatDateTime('#39'dd mmmm'#39',Date)] [YearOf(Date)+543]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 143.622140000000000000
          Top = 227.433210000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '**  [FormatFloat('#39'#,##0'#39',<frxDBBill."btotal">)] **')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo2: TfrxMemoView
          Left = 321.260050000000000000
          Top = 227.433210000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo2OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[MyTXT]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo7: TfrxMemoView
          Left = 102.385900000000000000
          Top = 137.724490000000000000
          Width = 646.299630000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."do_prename">)+'#39' '#39'+trim(<frxDBBill."do_name">)+' +
              #39' '#39'+trim(<frxDBBill."do_lname">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 102.385900000000000000
          Top = 167.740260000000000000
          Width = 646.299630000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_addr1">][<frxDBBill."do_mu1">][<frxDBBill."do_so' +
              'i1">][<frxDBBill."do_street1">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 102.385900000000000000
          Top = 194.196970000000000000
          Width = 646.299630000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_tambon1">][<frxDBBill."do_amphor1">][<frxDBBill.' +
              '"do_province1">][<frxDBBill."do_zipcode1">]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 23.811023622047200000
        Top = 343.937230000000000000
        Width = 793.701300000000000000
        object Memo16: TfrxMemoView
          Left = 56.692950000000000000
          Top = 1.000000000000000000
          Width = 684.094930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 294.803340000000000000
        Width = 793.701300000000000000
        DataSet = frxCdsBill
        DataSetName = 'frxDBBill'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 49.133890000000000000
          Width = 684.094930000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."o_title">)] [trim(<frxDBBill."fd_title">)]  [i' +
              'if(<frxDBBill."bdamount"><=0,'#39' '#39',FormatFloat('#39'#,##0'#39',<frxDBBill.' +
              '"bdamount">))]  [ iif(<frxDBBill."bdamount"><=0,'#39' '#39','#39' '#3648#3608#154#3648#3608#3602#3648#3608#8212#39 +
              ')]')
          ParentFont = False
        end
        object frxDBBillitem: TfrxMemoView
          Printable = False
          Left = 15.118120000000000000
          Width = 26.456710000000000000
          Height = 26.456710000000000000
          Visible = False
          ShowHint = False
          DataField = 'item'
          DataSet = frxCdsBill
          DataSetName = 'frxDBBill'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBBill."item"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 412.448980000000000000
        Top = 389.291590000000000000
        Width = 793.701300000000000000
        Condition = 'frxDBBill."bno"'
        object Memo6: TfrxMemoView
          Left = 525.016080000000000000
          Top = 250.606370000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            '[FormatDateTime('#39'dd mmmm'#39',Date)] [YearOf(Date)+543]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 109.606370000000000000
          Top = 294.740260000000000000
          Width = 631.181510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."do_prename">)+'#39' '#39'+trim(<frxDBBill."do_name">)+' +
              #39' '#39'+trim(<frxDBBill."do_lname">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 109.606370000000000000
          Top = 323.417440000000000000
          Width = 631.181510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_addr1">][<frxDBBill."do_mu1">][<frxDBBill."do_so' +
              'i1">][<frxDBBill."do_street1">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 109.606370000000000000
          Top = 351.653679999999900000
          Width = 631.181510000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[<frxDBBill."do_tambon1">][<frxDBBill."do_amphor1">][<frxDBBill.' +
              '"do_province1">][<frxDBBill."do_zipcode1">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 158.401670000000000000
          Top = 383.889920000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '**  [FormatFloat('#39'#,##0'#39',<frxDBBill."btotal">)] **')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          Left = 339.819110000000000000
          Top = 383.889920000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[MyTXT]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 873.071430000000000000
        Width = 793.701300000000000000
        object Memo5: TfrxMemoView
          Left = 56.692950000000000000
          Width = 684.094930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData2: TfrxMasterData
        Height = 26.456710000000000000
        Top = 823.937540000000000000
        Width = 793.701300000000000000
        DataSet = frxCdsBill
        DataSetName = 'frxDBBill'
        RowCount = 0
        object Memo4: TfrxMemoView
          Left = 49.133890000000000000
          Width = 684.094930000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            
              '[trim(<frxDBBill."o_title">)] [trim(<frxDBBill."fd_title">)]  [i' +
              'if(<frxDBBill."bdamount"><=0,'#39' '#39',FormatFloat('#39'#,##0'#39',<frxDBBill.' +
              '"bdamount">))]  [ iif(<frxDBBill."bdamount"><=0,'#39' '#39','#39' '#3648#3608#154#3648#3608#3602#3648#3608#8212#39 +
              ')]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Printable = False
          Left = 11.338590000000000000
          Width = 26.456710000000000000
          Height = 26.456710000000000000
          Visible = False
          ShowHint = False
          DataField = 'item'
          DataSet = frxCdsBill
          DataSetName = 'frxDBBill'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'AngsanaUPC'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBBill."item"]')
          ParentFont = False
        end
      end
    end
  end
  object cdsRoyalHistory: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.*,b.* from royal  a left join royal_code b on a.ryrcode' +
      '=ry_code where a.id='#39'00024967'#39' order by ryrcode desc'
    Params = <>
    ProviderName = 'dsp'
    Left = 560
    Top = 450
  end
  object cdsFavorHistory: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.*,b.*,c.* from support a left join sp_code b on a.spcod' +
      'e=b.sp_code left join donator c on a.spid=c.do_id where a.spstat' +
      'us<>'#39'I'#39' order by spcode'
    Params = <>
    ProviderName = 'dsp'
    Left = 544
    Top = 410
  end
  object dsFavorHistory: TDataSource
    DataSet = cdsFavorHistory
    Left = 528
    Top = 378
  end
  object cdsTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 768
    Top = 314
  end
  object dsTemp: TDataSource
    DataSet = cdsTemp2
    Left = 745
    Top = 328
  end
  object cdsMaterReceive: TClientDataSet
    Aggregates = <>
    CommandText = 'select top 1 * from MttReceive'
    Params = <>
    ProviderName = 'dsp'
    Left = 200
    Top = 498
  end
  object cdsTemp3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 608
    Top = 306
  end
  object cdsMaterReceiveHdr: TClientDataSet
    Aggregates = <>
    CommandText = 'select top 1 * from MttReceiveHdr'
    Params = <>
    ProviderName = 'dsp'
    Left = 208
    Top = 402
  end
  object dsDonator: TDataSource
    DataSet = cdsDonator
    Left = 662
    Top = 227
  end
  object frxDesigner: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 593
    Top = 312
  end
  object cdsAddrLocation: TClientDataSet
    Aggregates = <>
    CommandText = 'select do_id,do_prename,do_name,do_lname from donator'
    Params = <>
    ProviderName = 'dsp'
    Left = 832
    Top = 290
  end
  object cdsFundInfo: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select top 1 * from found_code where fd_codetype='#39'2'#39' order by fd' +
      '_code'
    Params = <>
    ProviderName = 'dsp'
    Left = 408
    Top = 466
  end
  object cdsObjInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 448
    Top = 466
  end
  object cdsAutoLocation: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 832
    Top = 338
  end
  object cdsAutoLocation1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 872
    Top = 314
  end
  object cdsCheckBillNo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 696
    Top = 330
  end
  object cdsBookBank: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 848
    Top = 450
  end
  object cdsObjAcc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 888
    Top = 266
  end
end
