object frmUserPWD: TfrmUserPWD
  Left = 297
  Top = 431
  BorderStyle = bsToolWindow
  Caption = 'Change User Password'
  ClientHeight = 139
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 9
    Top = 4
    Width = 257
    Height = 97
    TabOrder = 0
    object lbUserName: TLabel
      Left = 16
      Top = 26
      Width = 62
      Height = 13
      Caption = 'User Name'
    end
    object lbPassword: TLabel
      Left = 16
      Top = 58
      Width = 54
      Height = 13
      Caption = 'Password'
    end
    object edUserName: TEdit
      Left = 88
      Top = 22
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edUserNameKeyPress
    end
    object edPassword: TEdit
      Left = 88
      Top = 54
      Width = 153
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = edUserNameKeyPress
    end
  end
  object btnOK: TButton
    Left = 112
    Top = 108
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 192
    Top = 108
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
