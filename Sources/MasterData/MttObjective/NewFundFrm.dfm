object frmNewFund: TfrmNewFund
  Left = 293
  Top = 153
  Width = 643
  Height = 388
  BorderIcons = [biSystemMenu]
  Caption = 'frmNewFund'
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 0
    VisualStyle = vsGradient
  end
  object pnClientContainer: TRzPanel
    Left = 0
    Top = 4
    Width = 635
    Height = 357
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      635
      357)
    object RzLabel1: TRzLabel
      Left = 5
      Top = 4
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3619#3627#3633#3626
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object RzLabel2: TRzLabel
      Left = 5
      Top = 29
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3594#3639#3656#3629
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object RzLabel3: TRzLabel
      Left = 5
      Top = 54
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3619#3627#3633#3626
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object RzLabel4: TRzLabel
      Left = 5
      Top = 79
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3619#3627#3633#3626
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object RzLabel5: TRzLabel
      Left = 5
      Top = 104
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3619#3627#3633#3626
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object RzLabel6: TRzLabel
      Left = 5
      Top = 129
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3619#3627#3633#3626
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object RzLabel7: TRzLabel
      Left = 5
      Top = 154
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3619#3627#3633#3626
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object RzLabel8: TRzLabel
      Left = 5
      Top = 179
      Width = 68
      Height = 24
      AutoSize = False
      Caption = ' '#3619#3627#3633#3626
      Color = clSilver
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      BorderShadow = clSilver
    end
    object btnObjSave: TRzBitBtn
      Left = 469
      Top = 321
      Width = 78
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = #3610#3633#3609#3607#3638#3585
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
    end
    object btnObjCancel: TRzBitBtn
      Left = 549
      Top = 321
      Width = 78
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = #3618#3585#3648#3621#3636#3585
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
      OnClick = btnObjCancelClick
    end
    object RzDBEdit1: TRzDBEdit
      Left = 75
      Top = 4
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 2
    end
    object RzDBEdit2: TRzDBEdit
      Left = 75
      Top = 29
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 3
    end
    object RzDBEdit3: TRzDBEdit
      Left = 75
      Top = 54
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 4
    end
    object RzDBEdit4: TRzDBEdit
      Left = 75
      Top = 79
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 5
    end
    object RzDBEdit5: TRzDBEdit
      Left = 75
      Top = 104
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 6
    end
    object RzDBEdit6: TRzDBEdit
      Left = 75
      Top = 129
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 7
    end
    object RzDBEdit7: TRzDBEdit
      Left = 75
      Top = 154
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 8
    end
    object RzDBEdit8: TRzDBEdit
      Left = 75
      Top = 179
      Width = 162
      Height = 24
      DataField = 'o_code'
      FocusColor = 16766975
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 9
    end
  end
end
