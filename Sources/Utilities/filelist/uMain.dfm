object frMain: TfrMain
  Left = 219
  Top = 178
  Width = 617
  Height = 349
  Caption = 'Searching for files'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    609
    322)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 12
    Width = 52
    Height = 13
    Caption = 'In directory'
  end
  object Label2: TLabel
    Left = 4
    Top = 40
    Width = 44
    Height = 13
    Caption = 'File mask'
  end
  object lblNumberFound: TLabel
    Left = 4
    Top = 306
    Width = 60
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Files found...'
  end
  object xProBar1: TxProBar
    Left = 457
    Top = 303
    Width = 150
    Height = 17
    Anchors = [akRight, akBottom]
    MarqueeSize = 80
    MarqueeFade = 30
    MarqueeSpeed = 25
    AltMode = False
    Percentage = True
    Position = 0
    ShowPosText = True
    Color = clBlue
  end
  object Gauge1: TGauge
    Left = 320
    Top = 303
    Width = 121
    Height = 16
    Anchors = [akRight, akBottom]
    Progress = 0
  end
  object CheckBox1: TCheckBox
    Left = 4
    Top = 73
    Width = 113
    Height = 17
    Caption = 'Include subfolders'
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 64
    Top = 8
    Width = 361
    Height = 21
    TabOrder = 1
    Text = 'c:\'
  end
  object Button1: TButton
    Left = 123
    Top = 57
    Width = 65
    Height = 33
    Caption = '&Search'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 64
    Top = 36
    Width = 49
    Height = 21
    TabOrder = 3
    Text = '*.*'
  end
  object ckDelete: TCheckBox
    Left = 212
    Top = 35
    Width = 113
    Height = 17
    Caption = 'Delete'
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 58
    Width = 97
    Height = 31
    Caption = 'BitBtn1'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object ProgressBar1: TProgressBar
    Left = 152
    Top = 304
    Width = 150
    Height = 16
    Smooth = True
    Step = 1
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 0
    Top = 96
    Width = 609
    Height = 201
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 7
  end
end
