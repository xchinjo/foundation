object frmEndPeroid: TfrmEndPeroid
  Left = 293
  Top = 24
  Width = 921
  Height = 685
  Caption = 'Day End'
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnClientContainer: TPanel
    Left = 0
    Top = 4
    Width = 913
    Height = 653
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnHeader: TRzPanel
      Left = 0
      Top = 0
      Width = 913
      Height = 28
      Align = alTop
      BorderOuter = fsNone
      Color = 5832793
      TabOrder = 0
      object lbHeader: TRzLabel
        Left = 8
        Top = 6
        Width = 117
        Height = 16
        Caption = #3611#3636#3604#3591#3623#3604' ( Day End )'
        Font.Charset = THAI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PageContainer: TPageControl
      Left = 0
      Top = 28
      Width = 913
      Height = 625
      ActivePage = TabClosedPeriod
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      object TabCurrentPeriod: TTabSheet
        Caption = #3619#3634#3618#3621#3632#3648#3629#3637#3618#3604#3591#3623#3604#3611#3633#3592#3592#3640#3610#3633#3609
        object pnBody: TRzPanel
          Left = 0
          Top = 115
          Width = 905
          Height = 419
          Align = alClient
          BorderOuter = fsLowered
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 2
            Top = 121
            Width = 901
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object Splitter2: TSplitter
            Left = 2
            Top = 289
            Width = 901
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object pnTitle1: TRzPanel
            Left = 2
            Top = 2
            Width = 901
            Height = 26
            Align = alTop
            BorderOuter = fsNone
            Color = 6316128
            TabOrder = 0
            DesignSize = (
              901
              26)
            object RzLabel2: TRzLabel
              Left = 398
              Top = 5
              Width = 126
              Height = 16
              Anchors = [akTop]
              Caption = #3626#3656#3623#3609#3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656#3612#3641#3657#3610#3619#3636#3592#3634#3588
              Font.Charset = THAI_CHARSET
              Font.Color = clYellow
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object pnTitle2: TRzPanel
            Left = 2
            Top = 124
            Width = 901
            Height = 26
            Align = alTop
            BorderOuter = fsNone
            Color = 6316128
            TabOrder = 1
            DesignSize = (
              901
              26)
            object RzLabel1: TRzLabel
              Left = 429
              Top = 5
              Width = 66
              Height = 16
              Anchors = [akTop]
              Caption = #3626#3656#3623#3609#3651#3610#3648#3626#3619#3655#3592
              Font.Charset = THAI_CHARSET
              Font.Color = clYellow
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object pnTitle3: TRzPanel
            Left = 2
            Top = 292
            Width = 901
            Height = 26
            Align = alTop
            BorderOuter = fsNone
            Color = 64
            TabOrder = 2
            DesignSize = (
              901
              26)
            object RzLabel3: TRzLabel
              Left = 428
              Top = 5
              Width = 63
              Height = 16
              Anchors = [akTop]
              Caption = #3626#3656#3623#3609#3618#3585#3648#3621#3636#3585
              Font.Charset = THAI_CHARSET
              Font.Color = clYellow
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object grdPeroid: TcxGrid
            Left = 2
            Top = 28
            Width = 901
            Height = 93
            Align = alTop
            TabOrder = 3
            LookAndFeel.Kind = lfFlat
            object grdPeroidDBTableView1: TcxGridDBTableView
              DataController.DataSource = dsPeroid
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object grdPeroidDBTableView1pe_id: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3648#3623#3619
                DataBinding.FieldName = 'pe_id'
              end
              object grdPeroidDBTableView1pe_user: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656
                DataBinding.FieldName = 'pe_user'
              end
              object grdPeroidDBTableView1us_name: TcxGridDBColumn
                Caption = #3594#3639#3656#3629#3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656
                Width = 200
                DataBinding.FieldName = 'us_name'
              end
              object grdPeroidDBTableView1pe_begindate: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656#3648#3619#3636#3656#3617#3605#3657#3609
                Width = 100
                DataBinding.FieldName = 'pe_begindate'
              end
              object grdPeroidDBTableView1pe_begindate1: TcxGridDBColumn
                Caption = #3648#3623#3621#3634
                Width = 50
                DataBinding.FieldName = 'pe_begindate1'
              end
              object grdPeroidDBTableView1pe_closedate: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656#3626#3636#3657#3609#3626#3640#3604
                Width = 100
                DataBinding.FieldName = 'pe_closedate'
              end
              object grdPeroidDBTableView1pe_closedate1: TcxGridDBColumn
                Caption = #3648#3623#3621#3634
                Width = 50
                DataBinding.FieldName = 'pe_closedate1'
              end
              object grdPeroidDBTableView1pe_ReceiptF: TcxGridDBColumn
                Caption = #3592#3634#3585#3651#3610#3648#3626#3619#3655#3592#3648#3621#3586#3607#3637#3656
                DataBinding.FieldName = 'pe_ReceiptF'
              end
              object grdPeroidDBTableView1pe_ReceiptT: TcxGridDBColumn
                Caption = #3606#3638#3591#3651#3610#3648#3626#3619#3655#3592#3648#3621#3586#3607#3637#3656
                DataBinding.FieldName = 'pe_ReceiptT'
              end
              object grdPeroidDBTableView1pe_Amount: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
                DataBinding.FieldName = 'pe_Amount'
              end
              object grdPeroidDBTableView1pe_ReceiptBill: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3651#3610#3648#3626#3619#3655#3592
                DataBinding.FieldName = 'pe_ReceiptBill'
              end
              object grdPeroidDBTableView1pe_CancelBill: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3618#3585#3648#3621#3636#3585#3651#3610#3648#3626#3619#3655#3592
                DataBinding.FieldName = 'pe_CancelBill'
              end
            end
            object grdPeroidLevel1: TcxGridLevel
              GridView = grdPeroidDBTableView1
            end
          end
          object grdBill: TcxGrid
            Left = 2
            Top = 150
            Width = 901
            Height = 139
            Align = alTop
            TabOrder = 4
            LookAndFeel.Kind = lfFlat
            object grdBillDBTableView1: TcxGridDBTableView
              DataController.DataSource = dsBill
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object grdBillDBTableView1bperiod: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3648#3623#3619
                Width = 60
                DataBinding.FieldName = 'bperiod'
              end
              object grdBillDBTableView1bno: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3651#3610#3648#3626#3619#3655#3592
                Width = 80
                DataBinding.FieldName = 'bno'
              end
              object grdBillDBTableView1do_lname: TcxGridDBColumn
                Caption = #3594#3639#3656#3629
                Width = 82
                DataBinding.FieldName = 'do_lname'
              end
              object grdBillDBTableView1do_name: TcxGridDBColumn
                Caption = #3626#3585#3640#3621
                Width = 106
                DataBinding.FieldName = 'do_name'
              end
              object grdBillDBTableView1bdate: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656
                Width = 100
                DataBinding.FieldName = 'bdate'
              end
              object grdBillDBTableView1btotal: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
                Width = 100
                DataBinding.FieldName = 'btotal'
              end
              object grdBillDBTableView1pt_title: TcxGridDBColumn
                Caption = #3623#3636#3608#3637#3585#3634#3619#3594#3635#3619#3632
                Width = 100
                DataBinding.FieldName = 'pt_title'
              end
              object grdBillDBTableView1bbank: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3608#3609#3634#3588#3634#3619
                Width = 80
                DataBinding.FieldName = 'bbank'
              end
              object grdBillDBTableView1bbankname: TcxGridDBColumn
                Caption = #3594#3639#3656#3629#3608#3609#3634#3588#3634#3619
                Width = 200
                DataBinding.FieldName = 'bbankname'
              end
              object grdBillDBTableView1bbrance: TcxGridDBColumn
                Caption = #3626#3634#3586#3634
                Width = 150
                DataBinding.FieldName = 'bbrance'
              end
              object grdBillDBTableView1brefno: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
                DataBinding.FieldName = 'brefno'
              end
              object grdBillDBTableView1brefdate: TcxGridDBColumn
                Caption = #3629#3629#3585' '#3603' '#3623#3633#3609#3607#3637#3656
                DataBinding.FieldName = 'brefdate'
              end
              object grdBillDBTableView1bremark: TcxGridDBColumn
                Caption = #3626#3635#3627#3619#3633#3610'/'#3617#3634#3592#3634#3585
                Width = 100
                DataBinding.FieldName = 'bremark'
              end
              object grdBillDBTableView1bid: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3612#3641#3657#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'bid'
              end
              object grdBillDBTableView1buserid: TcxGridDBColumn
                Caption = #3612#3641#3657#3619#3633#3610#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'buserid'
              end
            end
            object grdBillLevel1: TcxGridLevel
              GridView = grdBillDBTableView1
            end
          end
          object cxGrid3: TcxGrid
            Left = 2
            Top = 318
            Width = 901
            Height = 99
            Align = alClient
            TabOrder = 5
            LookAndFeel.Kind = lfFlat
            object cxGrid3DBTableView1: TcxGridDBTableView
              DataController.DataSource = dsBillCancel
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsView.GroupByBox = False
              object cxGrid3DBTableView1bperiod: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3648#3623#3619
                Width = 60
                DataBinding.FieldName = 'bperiod'
              end
              object cxGrid3DBTableView1bno: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3651#3610#3648#3626#3619#3655#3592
                Width = 80
                DataBinding.FieldName = 'bno'
              end
              object cxGrid3DBTableView1do_name: TcxGridDBColumn
                Caption = #3594#3639#3656#3629
                Width = 82
                DataBinding.FieldName = 'do_name'
              end
              object cxGrid3DBTableView1do_lname: TcxGridDBColumn
                Caption = #3626#3585#3640#3621
                Width = 106
                DataBinding.FieldName = 'do_lname'
              end
              object cxGrid3DBTableView1bdate: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656
                Width = 100
                DataBinding.FieldName = 'bdate'
              end
              object cxGrid3DBTableView1btotal: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
                Width = 100
                DataBinding.FieldName = 'btotal'
              end
              object cxGrid3DBTableView1pt_title: TcxGridDBColumn
                Caption = #3623#3636#3608#3637#3585#3634#3619#3594#3635#3619#3632
                Width = 100
                DataBinding.FieldName = 'pt_title'
              end
              object cxGrid3DBTableView1bbank: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3608#3609#3634#3588#3634#3619
                Width = 80
                DataBinding.FieldName = 'bbank'
              end
              object cxGrid3DBTableView1bbankname: TcxGridDBColumn
                Caption = #3594#3639#3656#3629#3608#3609#3634#3588#3634#3619
                Width = 200
                DataBinding.FieldName = 'bbankname'
              end
              object cxGrid3DBTableView1bbrance: TcxGridDBColumn
                Caption = #3626#3634#3586#3634
                Width = 150
                DataBinding.FieldName = 'bbrance'
              end
              object cxGrid3DBTableView1brefno: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
                DataBinding.FieldName = 'brefno'
              end
              object cxGrid3DBTableView1brefdate: TcxGridDBColumn
                Caption = #3629#3629#3585' '#3603' '#3623#3633#3609#3607#3637#3656
                DataBinding.FieldName = 'brefdate'
              end
              object cxGrid3DBTableView1bremark: TcxGridDBColumn
                Caption = #3626#3635#3627#3619#3633#3610'/'#3617#3634#3592#3634#3585
                Width = 100
                DataBinding.FieldName = 'bremark'
              end
              object cxGrid3DBTableView1bid: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3612#3641#3657#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'bid'
              end
              object cxGrid3DBTableView1buserid: TcxGridDBColumn
                Caption = #3612#3641#3657#3619#3633#3610#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'buserid'
              end
            end
            object cxGrid3Level1: TcxGridLevel
              GridView = cxGrid3DBTableView1
            end
          end
        end
        object pnTop: TRzPanel
          Left = 0
          Top = 0
          Width = 905
          Height = 115
          Align = alTop
          BorderOuter = fsNone
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            905
            115)
          object Label1: TLabel
            Left = 9
            Top = 9
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3623#3633#3609#3607#3637#3656#3648#3619#3636#3656#3617#3648#3585#3655#3610
            Color = 11579568
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
            Left = 243
            Top = 9
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3623#3633#3609#3607#3637#3656#3626#3636#3657#3609#3626#3640#3604
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label3: TLabel
            Left = 513
            Top = 9
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3640#3604#3610#3619#3636#3592#3634#3588
            Color = 11579568
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
            Left = 9
            Top = 33
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3648#3621#3586#3607#3637#3656#3648#3623#3619
            Color = 11579568
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
            Left = 243
            Top = 40
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3607#3633#3657#3591#3627#3617#3604
            Color = 11579568
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
            Left = 243
            Top = 65
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3618#3585#3648#3621#3636#3585#3607#3633#3657#3591#3627#3617#3604
            Color = 11579568
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
            Left = 243
            Top = 90
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3588#3591#3588#3657#3634#3591#3652#3617#3656#3609#3635#3626#3656#3591
            Color = 11579568
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
            Left = 513
            Top = 40
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609
            Color = 11579568
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
            Left = 513
            Top = 65
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label10: TLabel
            Left = 748
            Top = 40
            Width = 65
            Height = 22
            AutoSize = False
            Caption = ' '#3619#3634#3618#3585#3634#3619
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object Label11: TLabel
            Left = 748
            Top = 65
            Width = 65
            Height = 22
            AutoSize = False
            Caption = ' '#3619#3634#3618#3585#3634#3619
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object RzEdit1: TRzEdit
            Left = 125
            Top = 9
            Width = 116
            Height = 22
            TabStop = False
            Color = clInfoBk
            Ctl3D = False
            FocusColor = 16766975
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
          object RzEdit2: TRzEdit
            Left = 373
            Top = 9
            Width = 137
            Height = 22
            TabStop = False
            Color = clInfoBk
            Ctl3D = False
            FocusColor = 16766975
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object RzEdit3: TRzEdit
            Left = 629
            Top = 9
            Width = 116
            Height = 22
            TabStop = False
            Color = clInfoBk
            Ctl3D = False
            FocusColor = 16766975
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 2
          end
          object edPeroidNo: TRzEdit
            Left = 125
            Top = 33
            Width = 116
            Height = 24
            TabStop = False
            Text = '00000'
            Alignment = taRightJustify
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
            ReadOnly = True
            TabOrder = 3
          end
          object btnClosePeroid: TRzBitBtn
            Left = 778
            Top = 88
            Width = 127
            Height = 27
            Anchors = [akRight, akBottom]
            Caption = #3611#3636#3604#3648#3623#3619
            Color = 4227327
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 4
            TabStop = False
            OnClick = btnClosePeroidClick
          end
          object edAmount: TRzNumericEdit
            Left = 374
            Top = 40
            Width = 135
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            DisplayFormat = ',0;(,0)'
          end
          object edCancelAmount: TRzNumericEdit
            Left = 374
            Top = 65
            Width = 135
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            DisplayFormat = ',0;(,0)'
          end
          object RzNumericEdit2: TRzNumericEdit
            Left = 374
            Top = 90
            Width = 135
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            DisplayFormat = ',0;(,0)'
          end
          object edActiveItems: TRzNumericEdit
            Left = 630
            Top = 40
            Width = 115
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            DisplayFormat = ',0;(,0)'
          end
          object edCancelItems: TRzNumericEdit
            Left = 630
            Top = 65
            Width = 115
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            DisplayFormat = ',0;(,0)'
          end
          object btnRefresh: TRzBitBtn
            Left = 650
            Top = 88
            Width = 127
            Height = 27
            Anchors = [akRight, akBottom]
            Caption = 'Refresh'
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 10
            TabStop = False
            OnClick = btnRefreshClick
          end
        end
        object pnButtom: TRzPanel
          Left = 0
          Top = 534
          Width = 905
          Height = 57
          Align = alBottom
          BorderOuter = fsNone
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          DesignSize = (
            905
            57)
          object btnDailyReport: TRzBitBtn
            Left = 91
            Top = 2
            Width = 155
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F10 '#3619#3634#3618#3591#3634#3609#3626#3619#3640#3611#3611#3619#3632#3592#3635#3623#3633#3609
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 0
            TabStop = False
            OnClick = btnDailyReportClick
          end
          object btnCancelReport: TRzBitBtn
            Left = 246
            Top = 2
            Width = 150
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F11 '#3619#3634#3618#3591#3634#3609#3585#3634#3619#3618#3585#3648#3621#3636#3585
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 1
            TabStop = False
            OnClick = btnCancelReportClick
          end
          object btnSummaryObjective: TRzBitBtn
            Left = 396
            Top = 2
            Width = 244
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3614#3636#3617#3614#3660#3626#3619#3640#3611#3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660' '#3648#3619#3637#3618#3591#3605#3634#3617#3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 2
            TabStop = False
            OnClick = btnSummaryObjectiveClick
          end
          object btnReceiptReport: TRzBitBtn
            Left = 640
            Top = 2
            Width = 135
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3651#3610#3609#3635#3626#3656#3591#3648#3591#3636#3609
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 3
            TabStop = False
            OnClick = btnReceiptReportClick
          end
          object btnSticker: TRzBitBtn
            Left = 775
            Top = 2
            Width = 130
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F5 '#3614#3636#3617#3614#3660#3626#3605#3636#3658#3585#3648#3585#3629#3619#3660
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 4
            TabStop = False
            OnClick = btnStickerClick
          end
          object btnClose: TRzBitBtn
            Left = 775
            Top = 30
            Width = 130
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3611#3636#3604
            Color = 16759929
            Enabled = False
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 5
            TabStop = False
          end
          object btnAddressReport: TRzBitBtn
            Left = 168
            Top = 30
            Width = 155
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F6 '#3614#3636#3617#3614#3660#3607#3637#3656#3629#3618#3641#3656
            Color = 16759929
            Enabled = False
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 6
            TabStop = False
          end
          object btnMailReport: TRzBitBtn
            Left = 323
            Top = 30
            Width = 174
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F7 '#3614#3636#3617#3614#3660#3592#3604#3627#3617#3634#3618#3605#3629#3610#3586#3629#3610#3588#3640#3603
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 7
            TabStop = False
            OnClick = btnMailReportClick
          end
          object btnCongratulations: TRzBitBtn
            Left = 497
            Top = 30
            Width = 143
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F9 '#3614#3636#3617#3614#3660#3610#3633#3605#3619#3629#3609#3640#3650#3617#3607#3609#3634
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 8
            TabStop = False
            OnClick = btnCongratulationsClick
          end
          object btnOutstanding: TRzBitBtn
            Left = 640
            Top = 30
            Width = 135
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3610#3633#3609#3607#3638#3585#3618#3629#3604#3648#3591#3636#3609#3588#3591#3588#3657#3634#3591
            Color = 16759929
            Enabled = False
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 9
            TabStop = False
          end
        end
      end
      object TabClosedPeriod: TTabSheet
        Caption = #3619#3634#3618#3621#3632#3648#3629#3637#3618#3604#3591#3623#3604#3607#3637#3656#3611#3636#3604#3652#3611#3649#3621#3657#3623
        ImageIndex = 1
        object RzPanel5: TRzPanel
          Left = 0
          Top = 0
          Width = 905
          Height = 115
          Align = alTop
          BorderOuter = fsNone
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            905
            115)
          object Label12: TLabel
            Left = 9
            Top = 9
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3623#3633#3609#3607#3637#3656#3648#3619#3636#3656#3617#3648#3585#3655#3610
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label13: TLabel
            Left = 243
            Top = 9
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3623#3633#3609#3607#3637#3656#3626#3636#3657#3609#3626#3640#3604
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label14: TLabel
            Left = 513
            Top = 9
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3640#3604#3610#3619#3636#3592#3634#3588
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label15: TLabel
            Left = 9
            Top = 33
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3648#3621#3586#3607#3637#3656#3648#3623#3619
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label16: TLabel
            Left = 243
            Top = 40
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3607#3633#3657#3591#3627#3617#3604
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label17: TLabel
            Left = 243
            Top = 65
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3618#3585#3648#3621#3636#3585#3607#3633#3657#3591#3627#3617#3604
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label18: TLabel
            Left = 243
            Top = 90
            Width = 127
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609#3648#3591#3636#3609#3588#3591#3588#3657#3634#3591#3652#3617#3656#3609#3635#3626#3656#3591
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label19: TLabel
            Left = 513
            Top = 40
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609
            Color = 11579568
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
            Left = 513
            Top = 65
            Width = 114
            Height = 22
            AutoSize = False
            Caption = ' '#3592#3635#3609#3623#3609
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label21: TLabel
            Left = 748
            Top = 40
            Width = 65
            Height = 22
            AutoSize = False
            Caption = ' '#3619#3634#3618#3585#3634#3619
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object Label22: TLabel
            Left = 748
            Top = 65
            Width = 65
            Height = 22
            AutoSize = False
            Caption = ' '#3619#3634#3618#3585#3634#3619
            Color = 11579568
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object RzEdit4: TRzEdit
            Left = 125
            Top = 9
            Width = 116
            Height = 22
            TabStop = False
            Color = clInfoBk
            Ctl3D = False
            FocusColor = 16766975
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
          object RzEdit5: TRzEdit
            Left = 373
            Top = 9
            Width = 137
            Height = 22
            TabStop = False
            Color = clInfoBk
            Ctl3D = False
            FocusColor = 16766975
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object RzEdit6: TRzEdit
            Left = 629
            Top = 9
            Width = 116
            Height = 22
            TabStop = False
            Color = clInfoBk
            Ctl3D = False
            FocusColor = 16766975
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 2
          end
          object edShowPeroidNo: TRzEdit
            Left = 125
            Top = 33
            Width = 116
            Height = 24
            TabStop = False
            Alignment = taRightJustify
            Color = clInfoBk
            Ctl3D = False
            Font.Charset = THAI_CHARSET
            Font.Color = clGreen
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object edPeriodAmount: TRzNumericEdit
            Left = 374
            Top = 40
            Width = 135
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            DisplayFormat = ',0;(,0)'
          end
          object edPeriodCancelAmount: TRzNumericEdit
            Left = 374
            Top = 65
            Width = 135
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            DisplayFormat = ',0;(,0)'
          end
          object RzNumericEdit4: TRzNumericEdit
            Left = 374
            Top = 90
            Width = 135
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            DisplayFormat = ',0;(,0)'
          end
          object edPeriodActiveItems: TRzNumericEdit
            Left = 630
            Top = 40
            Width = 115
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            DisplayFormat = ',0;(,0)'
          end
          object edPeriodCancelItems: TRzNumericEdit
            Left = 630
            Top = 65
            Width = 115
            Height = 24
            TabStop = False
            Color = clInfoBk
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            FocusColor = 16766975
            FrameVisible = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            DisplayFormat = ',0;(,0)'
          end
          object btnOpenPeroid: TRzBitBtn
            Left = 779
            Top = 86
            Width = 125
            Height = 27
            Anchors = [akRight, akBottom]
            Caption = 'F3 - '#3648#3621#3639#3629#3585'..'
            Color = 16759929
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 9
            TabStop = False
            OnClick = btnOpenPeroidClick
          end
        end
        object RzPanel6: TRzPanel
          Left = 0
          Top = 534
          Width = 905
          Height = 57
          Align = alBottom
          BorderOuter = fsNone
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            905
            57)
          object btnDailyReportA: TRzBitBtn
            Left = 91
            Top = 2
            Width = 155
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F10 '#3619#3634#3618#3591#3634#3609#3626#3619#3640#3611#3611#3619#3632#3592#3635#3623#3633#3609
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 0
            TabStop = False
            OnClick = btnDailyReportAClick
          end
          object btnCancelReportA: TRzBitBtn
            Left = 246
            Top = 2
            Width = 150
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F11 '#3619#3634#3618#3591#3634#3609#3585#3634#3619#3618#3585#3648#3621#3636#3585
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 1
            TabStop = False
            OnClick = btnCancelReportAClick
          end
          object btnSummaryObjectiveA: TRzBitBtn
            Left = 396
            Top = 2
            Width = 244
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3614#3636#3617#3614#3660#3626#3619#3640#3611#3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660' '#3648#3619#3637#3618#3591#3605#3634#3617#3623#3633#3605#3606#3640#3611#3619#3632#3626#3591#3588#3660
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 2
            TabStop = False
            OnClick = btnSummaryObjectiveAClick
          end
          object btnReceiptReportA: TRzBitBtn
            Left = 640
            Top = 2
            Width = 135
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3651#3610#3609#3635#3626#3656#3591#3648#3591#3636#3609
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 3
            TabStop = False
            OnClick = btnReceiptReportAClick
          end
          object btnStickerA: TRzBitBtn
            Left = 775
            Top = 2
            Width = 130
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F5 '#3614#3636#3617#3614#3660#3626#3605#3636#3658#3585#3648#3585#3629#3619#3660
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 4
            TabStop = False
            OnClick = btnStickerAClick
          end
          object btnCloseA: TRzBitBtn
            Left = 775
            Top = 30
            Width = 130
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3611#3636#3604
            Color = clSilver
            Enabled = False
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 5
            TabStop = False
          end
          object btnAddressReportA: TRzBitBtn
            Left = 168
            Top = 30
            Width = 155
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F6 '#3614#3636#3617#3614#3660#3607#3637#3656#3629#3618#3641#3656
            Color = clSilver
            Enabled = False
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 6
            TabStop = False
          end
          object btnMailReportA: TRzBitBtn
            Left = 323
            Top = 30
            Width = 174
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F7 '#3614#3636#3617#3614#3660#3592#3604#3627#3617#3634#3618#3605#3629#3610#3586#3629#3610#3588#3640#3603
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 7
            TabStop = False
            OnClick = btnMailReportAClick
          end
          object btnCongratulationsA: TRzBitBtn
            Left = 497
            Top = 30
            Width = 143
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'F9 '#3614#3636#3617#3614#3660#3610#3633#3605#3619#3629#3609#3640#3650#3617#3607#3609#3634
            Color = clSilver
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 8
            TabStop = False
            OnClick = btnCongratulationsAClick
          end
          object btnOutstandingA: TRzBitBtn
            Left = 640
            Top = 30
            Width = 135
            Height = 27
            Anchors = [akTop, akRight]
            Caption = #3610#3633#3609#3607#3638#3585#3618#3629#3604#3648#3591#3636#3609#3588#3591#3588#3657#3634#3591
            Color = clSilver
            Enabled = False
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            TabOrder = 9
            TabStop = False
          end
        end
        object RzPanel1: TRzPanel
          Left = 0
          Top = 115
          Width = 905
          Height = 419
          Align = alClient
          BorderOuter = fsLowered
          TabOrder = 2
          object Splitter3: TSplitter
            Left = 2
            Top = 121
            Width = 901
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object Splitter4: TSplitter
            Left = 2
            Top = 289
            Width = 901
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object RzPanel2: TRzPanel
            Left = 2
            Top = 2
            Width = 901
            Height = 26
            Align = alTop
            BorderOuter = fsNone
            Color = 6316128
            TabOrder = 0
            DesignSize = (
              901
              26)
            object RzLabel4: TRzLabel
              Left = 398
              Top = 5
              Width = 126
              Height = 16
              Anchors = [akTop]
              Caption = #3626#3656#3623#3609#3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656#3612#3641#3657#3610#3619#3636#3592#3634#3588
              Font.Charset = THAI_CHARSET
              Font.Color = clYellow
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RzPanel3: TRzPanel
            Left = 2
            Top = 124
            Width = 901
            Height = 26
            Align = alTop
            BorderOuter = fsNone
            Color = 6316128
            TabOrder = 1
            DesignSize = (
              901
              26)
            object RzLabel5: TRzLabel
              Left = 429
              Top = 5
              Width = 66
              Height = 16
              Anchors = [akTop]
              Caption = #3626#3656#3623#3609#3651#3610#3648#3626#3619#3655#3592
              Font.Charset = THAI_CHARSET
              Font.Color = clYellow
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RzPanel4: TRzPanel
            Left = 2
            Top = 292
            Width = 901
            Height = 26
            Align = alTop
            BorderOuter = fsNone
            Color = 64
            TabOrder = 2
            DesignSize = (
              901
              26)
            object RzLabel6: TRzLabel
              Left = 428
              Top = 5
              Width = 63
              Height = 16
              Anchors = [akTop]
              Caption = #3626#3656#3623#3609#3618#3585#3648#3621#3636#3585
              Font.Charset = THAI_CHARSET
              Font.Color = clYellow
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object cxGrid1: TcxGrid
            Left = 2
            Top = 28
            Width = 901
            Height = 93
            Align = alTop
            TabOrder = 3
            LookAndFeel.Kind = lfFlat
            object cxGridDBTableView1: TcxGridDBTableView
              DataController.DataSource = dsPeroidA
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3648#3623#3619
                DataBinding.FieldName = 'pe_id'
              end
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656
                DataBinding.FieldName = 'pe_user'
              end
              object cxGridDBColumn3: TcxGridDBColumn
                Caption = #3594#3639#3656#3629#3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656
                Width = 200
                DataBinding.FieldName = 'us_name'
              end
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656#3648#3619#3636#3656#3617#3605#3657#3609
                Width = 100
                DataBinding.FieldName = 'pe_begindate'
              end
              object cxGridDBColumn5: TcxGridDBColumn
                Caption = #3648#3623#3621#3634
                Width = 50
                DataBinding.FieldName = 'pe_begindate1'
              end
              object cxGridDBColumn6: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656#3626#3636#3657#3609#3626#3640#3604
                Width = 100
                DataBinding.FieldName = 'pe_closedate'
              end
              object cxGridDBColumn7: TcxGridDBColumn
                Caption = #3648#3623#3621#3634
                Width = 50
                DataBinding.FieldName = 'pe_closedate1'
              end
              object cxGridDBColumn8: TcxGridDBColumn
                Caption = #3592#3634#3585#3651#3610#3648#3626#3619#3655#3592#3648#3621#3586#3607#3637#3656
                DataBinding.FieldName = 'pe_ReceiptF'
              end
              object cxGridDBColumn9: TcxGridDBColumn
                Caption = #3606#3638#3591#3651#3610#3648#3626#3619#3655#3592#3648#3621#3586#3607#3637#3656
                DataBinding.FieldName = 'pe_ReceiptT'
              end
              object cxGridDBColumn10: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
                DataBinding.FieldName = 'pe_Amount'
              end
              object cxGridDBColumn11: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3651#3610#3648#3626#3619#3655#3592
                DataBinding.FieldName = 'pe_ReceiptBill'
              end
              object cxGridDBColumn12: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3618#3585#3648#3621#3636#3585#3651#3610#3648#3626#3619#3655#3592
                DataBinding.FieldName = 'pe_CancelBill'
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
          object cxGrid2: TcxGrid
            Left = 2
            Top = 150
            Width = 901
            Height = 139
            Align = alTop
            TabOrder = 4
            LookAndFeel.Kind = lfFlat
            object cxGridDBTableView2: TcxGridDBTableView
              DataController.DataSource = dsBillA
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object cxGridDBColumn14: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3648#3623#3619
                Width = 60
                DataBinding.FieldName = 'bperiod'
              end
              object cxGridDBColumn13: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3651#3610#3648#3626#3619#3655#3592
                Width = 80
                DataBinding.FieldName = 'bno'
              end
              object cxGridDBTableView2do_name: TcxGridDBColumn
                Caption = #3594#3639#3656#3629
                Width = 82
                DataBinding.FieldName = 'do_name'
              end
              object cxGridDBTableView2do_lname: TcxGridDBColumn
                Caption = #3626#3585#3640#3621
                Width = 106
                DataBinding.FieldName = 'do_lname'
              end
              object cxGridDBColumn15: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656
                Width = 100
                DataBinding.FieldName = 'bdate'
              end
              object cxGridDBColumn16: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
                Width = 100
                DataBinding.FieldName = 'btotal'
              end
              object cxGridDBColumn17: TcxGridDBColumn
                Caption = #3623#3636#3608#3637#3585#3634#3619#3594#3635#3619#3632
                Width = 100
                DataBinding.FieldName = 'pt_title'
              end
              object cxGridDBColumn18: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3608#3609#3634#3588#3634#3619
                Width = 80
                DataBinding.FieldName = 'bbank'
              end
              object cxGridDBColumn19: TcxGridDBColumn
                Caption = #3594#3639#3656#3629#3608#3609#3634#3588#3634#3619
                Width = 200
                DataBinding.FieldName = 'bbankname'
              end
              object cxGridDBColumn20: TcxGridDBColumn
                Caption = #3626#3634#3586#3634
                Width = 150
                DataBinding.FieldName = 'bbrance'
              end
              object cxGridDBTableView2brefno: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
                DataBinding.FieldName = 'brefno'
              end
              object cxGridDBTableView2brefdate: TcxGridDBColumn
                Caption = #3629#3629#3585' '#3603' '#3623#3633#3609#3607#3637#3656
                DataBinding.FieldName = 'brefdate'
              end
              object cxGridDBTableView2bremark: TcxGridDBColumn
                Caption = #3626#3635#3627#3619#3633#3610'/'#3617#3634#3592#3634#3585
                Width = 100
                DataBinding.FieldName = 'bremark'
              end
              object cxGridDBColumn21: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3612#3641#3657#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'bid'
              end
              object cxGridDBTableView2buserid: TcxGridDBColumn
                Caption = #3612#3641#3657#3619#3633#3610#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'buserid'
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridDBTableView2
            end
          end
          object cxGrid4: TcxGrid
            Left = 2
            Top = 318
            Width = 901
            Height = 99
            Align = alClient
            TabOrder = 5
            LookAndFeel.Kind = lfFlat
            object cxGridDBTableView3: TcxGridDBTableView
              DataController.DataSource = dsBillCancelA
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsView.GroupByBox = False
              object cxGridDBColumn23: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3648#3623#3619
                Width = 60
                DataBinding.FieldName = 'bperiod'
              end
              object cxGridDBColumn22: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3651#3610#3648#3626#3619#3655#3592
                Width = 80
                DataBinding.FieldName = 'bno'
              end
              object cxGridDBTableView3do_name: TcxGridDBColumn
                Caption = #3594#3639#3656#3629
                Width = 82
                DataBinding.FieldName = 'do_name'
              end
              object cxGridDBTableView3do_lname: TcxGridDBColumn
                Caption = #3626#3585#3640#3621
                Width = 106
                DataBinding.FieldName = 'do_lname'
              end
              object cxGridDBColumn24: TcxGridDBColumn
                Caption = #3623#3633#3609#3607#3637#3656
                Width = 100
                DataBinding.FieldName = 'bdate'
              end
              object cxGridDBColumn25: TcxGridDBColumn
                Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
                Width = 100
                DataBinding.FieldName = 'btotal'
              end
              object cxGridDBColumn26: TcxGridDBColumn
                Caption = #3623#3636#3608#3637#3585#3634#3619#3594#3635#3619#3632
                Width = 100
                DataBinding.FieldName = 'pt_title'
              end
              object cxGridDBColumn27: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3608#3609#3634#3588#3634#3619
                Width = 80
                DataBinding.FieldName = 'bbank'
              end
              object cxGridDBColumn28: TcxGridDBColumn
                Caption = #3594#3639#3656#3629#3608#3609#3634#3588#3634#3619
                Width = 200
                DataBinding.FieldName = 'bbankname'
              end
              object cxGridDBColumn29: TcxGridDBColumn
                Caption = #3626#3634#3586#3634
                Width = 150
                DataBinding.FieldName = 'bbrance'
              end
              object cxGridDBTableView3brefno: TcxGridDBColumn
                Caption = #3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
                DataBinding.FieldName = 'brefno'
              end
              object cxGridDBTableView3brefdate: TcxGridDBColumn
                Caption = #3629#3629#3585' '#3603' '#3623#3633#3609#3607#3637#3656
                DataBinding.FieldName = 'brefdate'
              end
              object cxGridDBTableView3bremark: TcxGridDBColumn
                Caption = #3626#3635#3627#3619#3633#3610'/'#3617#3634#3592#3634#3585
                Width = 100
                DataBinding.FieldName = 'bremark'
              end
              object cxGridDBColumn30: TcxGridDBColumn
                Caption = #3619#3627#3633#3626#3612#3641#3657#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'bid'
              end
              object cxGridDBTableView3buserid: TcxGridDBColumn
                Caption = #3612#3641#3657#3619#3633#3610#3610#3619#3636#3592#3634#3588
                Width = 100
                DataBinding.FieldName = 'buserid'
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxGridDBTableView3
            end
          end
        end
      end
    end
  end
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 913
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 1
    VisualStyle = vsGradient
  end
  object Conn: TSQLConnection
    ConnectionName = 'Devart SQL Server'
    DriverName = 'DevartSQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=127.0.0.1'
      'DataBase=fddb_temp'
      'DriverName=DevartSQLServer'
      'User_Name=sa'
      'Password=123456'
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    Left = 24
    Top = 130
  end
  object SQLDataSet: TSQLDataSet
    CommandText = 
      'select a.*,b.pt_title,c.* from bill a left join paytype b on a.b' +
      'paytype=b.pt_code left join donator c on a.bid=c.do_id where a.b' +
      'period='#39'02980'#39' and a.bstatus='#39'A'#39' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 64
    Top = 130
  end
  object dsp: TDataSetProvider
    DataSet = SQLDataSet
    Options = [poAllowMultiRecordUpdates, poAllowCommandText]
    Left = 112
    Top = 130
  end
  object cdsBill: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.*,b.pt_title,c.* from bill a left join paytype b on a.b' +
      'paytype=b.pt_code left join donator c on a.bid=c.do_id where a.b' +
      'period='#39'02980'#39' and a.bstatus='#39'A'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 10
    Top = 237
  end
  object dsBill: TDataSource
    DataSet = cdsBill
    Left = 40
    Top = 235
  end
  object cdsBillCancel: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.*,b.pt_title,c.* from bill a left join paytype b on a.b' +
      'paytype=b.pt_code left join donator c on a.bid=c.do_id where a.b' +
      'period='#39'02980'#39' and a.bstatus='#39'A'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 74
    Top = 245
  end
  object dsBillCancel: TDataSource
    DataSet = cdsBillCancel
    Left = 112
    Top = 235
  end
  object cdsPeroid: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  '#9'a.pe_id,a.pe_status,a.pe_seq,a.pe_begindate,a.pe_begind' +
      'ate as pe_begindate1,a.pe_closedate,a.pe_closedate as pe_closeda' +
      'te1 ,a.pe_user,a.pe_com,pe_comment,a.pe_refid '#9',a.pe_ReceiptF,a.' +
      'pe_ReceiptT,a.pe_Amount,a.pe_ReceiptBill,a.pe_CancelBill '#9',b.us_' +
      'code,b.us_name  from period_data a left join user_account b  on ' +
      'a.pe_user=b.us_code where a.pe_status='#39'A'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 18
    Top = 365
  end
  object dsPeroid: TDataSource
    DataSet = cdsPeroid
    Left = 64
    Top = 363
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 298
    Top = 389
  end
  object cdsClosePeriod: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from period_data'
    Params = <>
    ProviderName = 'dsp'
    Left = 298
    Top = 349
  end
  object cdsAllPeroid: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from period_data '
    Params = <>
    ProviderName = 'dsp'
    Left = 226
    Top = 373
  end
  object cdsPeroidA: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  '#9'a.pe_id,a.pe_status,a.pe_seq,a.pe_begindate,a.pe_begind' +
      'ate as pe_begindate1,a.pe_closedate,a.pe_closedate as pe_closeda' +
      'te1 ,a.pe_user,a.pe_com,pe_comment,a.pe_refid '#9',a.pe_ReceiptF,a.' +
      'pe_ReceiptT,a.pe_Amount,a.pe_ReceiptBill,a.pe_CancelBill '#9',b.us_' +
      'code,b.us_name  from period_data a left join user_account b  on ' +
      'a.pe_user=b.us_code where a.pe_status='#39'C'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 442
    Top = 381
  end
  object dsPeroidA: TDataSource
    DataSet = cdsPeroidA
    Left = 504
    Top = 379
  end
  object frxReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41158.675361608800000000
    ReportOptions.LastChange = 41211.284067141210000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'frxReport1OnStartReport'
    Left = 104
    Top = 560
    Datasets = <
      item
        DataSet = frxDataset
        DataSetName = 'frxDataset4'
      end>
    Variables = <
      item
        Name = ' Param'
        Value = Null
      end
      item
        Name = 'RT'
        Value = #39'Admin'#39
      end
      item
        Name = 'TA'
        Value = #39'500.00'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 64.252010000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 185.196970000000000000
          Width = 317.480520000000000000
          Height = 26.456710000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #3648#3608#3587#3648#3608#3602#3648#3608#3586#3648#3608#135#3648#3608#3602#3648#3608#153#3648#3609#131#3648#3608#154#3648#3608#153#3648#3608#3603#3648#3608#3594#3648#3609#136#3648#3608#135#3648#3609#8364#3648#3608#135#3648#3608#3604#3648#3608#153)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.118120000000000000
          Top = 37.015748030000000000
          Width = 712.440944880000000000
          Height = 18.897637800000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #3648#3608#3591#3648#3608#3601#3648#3608#153#3648#3608#8212#3648#3608#3605#3648#3609#136#3648#3608#3597#3648#3608#3597#3648#3608#129#3648#3608#3587#3648#3608#3602#3648#3608#3586#3648#3608#135#3648#3608#3602#3648#3608#153' '#3648#3608#3591#3648#3608#3601#3648#3608#153#3648#3608#8212#3648#3608#3605#3648#3609#136 +
              ' [FormatDateTime('#39'dd mmmm'#39',Date)] [YearOf(Date)+543]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 57.692950000000000000
        ParentFont = False
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 3.677180000000000000
          Top = 23.559060000000000000
          Width = 710.551640000000000000
          Height = 3.779530000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 626.181510000000000000
          Top = 2.000000000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #3648#3609#129#3648#3608#156#3648#3609#136#3648#3608#153#3648#3608#8212#3648#3608#3605#3648#3609#136' [Page#]/[TotalPages#]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 26.456710000000000000
        ParentFont = False
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        DataSet = frxDataset
        DataSetName = 'frxDataset4'
        RowCount = 0
        object frxDBDataset1btotal: TfrxMemoView
          Left = 5.401980000000000000
          Top = 3.023622050000000000
          Width = 544.252320000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataSet = frmGenReport.frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDataset2."btotal"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 551.440881420000000000
          Top = 3.023622050000000000
          Width = 162.519790000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDataset2."bperiod"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 64.252010000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        Condition = 'frxDataset4.""'
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 20.850422990000000000
          Width = 710.551640000000000000
          Height = 3.779530000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 649.551640000000000000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #3648#3609#8364#3648#3608#3589#3648#3608#130#3648#3608#8212#3648#3608#3605#3648#3609#136#3648#3609#8364#3648#3608#3591#3648#3608#3587)
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 30.236240000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Left = 3.779530000000000000
          Top = 23.677180000000000000
          Width = 710.551640000000000000
          Height = 3.779530000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 356.393940000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frmGenReport.frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #3648#3608#3586#3648#3608#3597#3648#3608#8221#3648#3608#3587#3648#3608#3591#3648#3608#3585)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 431.984540000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DataSet = frmGenReport.frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDataset2."btotal">)] '#3648#3608#154#3648#3608#3602#3648#3608#8212)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 16
    Top = 560
  end
  object frxDataset: TfrxDBDataset
    UserName = 'frxDataset4'
    CloseDataSource = False
    DataSet = cdsReport
    BCDToCurrency = False
    Left = 56
    Top = 568
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDataset1'
    CloseDataSource = False
    DataSet = cdsReport
    BCDToCurrency = False
    Left = 280
    Top = 456
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDataset2'
    CloseDataSource = False
    DataSet = cdsReport
    BCDToCurrency = False
    Left = 112
    Top = 440
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDataset3'
    CloseDataSource = False
    DataSet = cdsReport
    BCDToCurrency = False
    Left = 192
    Top = 432
  end
  object cdsBillA: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.*,b.pt_title,c.* from bill a left join paytype b on a.b' +
      'paytype=b.pt_code left join donator c on a.bid=c.do_id where a.b' +
      'period='#39'02980'#39' and a.bstatus='#39'A'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 298
    Top = 237
  end
  object dsBillA: TDataSource
    DataSet = cdsBillA
    Left = 328
    Top = 235
  end
  object cdsBillCancelA: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.*,b.pt_title,c.* from bill a left join paytype b on a.b' +
      'paytype=b.pt_code left join donator c on a.bid=c.do_id where a.b' +
      'period='#39'02980'#39' and a.bstatus='#39'A'#39' '
    Params = <>
    ProviderName = 'dsp'
    Left = 362
    Top = 245
  end
  object dsBillCancelA: TDataSource
    DataSet = cdsBillCancelA
    Left = 400
    Top = 235
  end
  object frxDesigner1: TfrxDesigner
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
    Left = 596
    Top = 377
  end
end
