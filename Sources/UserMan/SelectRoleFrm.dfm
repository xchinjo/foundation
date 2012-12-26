object frmSelectRole: TfrmSelectRole
  Left = 485
  Top = 163
  Width = 355
  Height = 113
  BorderIcons = [biSystemMenu]
  Caption = #3585#3635#3627#3609#3604#3627#3621#3640#3656#3617#3612#3641#3657#3651#3594#3657#3591#3634#3609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cmbRoles: TRzComboBox
    Left = 16
    Top = 16
    Width = 313
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object btnOK: TRzButton
    Left = 173
    Top = 50
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TRzButton
    Left = 253
    Top = 50
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
