object frmSearch: TfrmSearch
  Left = 383
  Top = 178
  BorderStyle = bsToolWindow
  Caption = 'frmSearch'
  ClientHeight = 450
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 645
    Height = 450
    Align = alClient
  end
  object ListView: TListView
    Left = 0
    Top = 0
    Width = 645
    Height = 450
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Columns = <
      item
        Caption = #3588#3635#3609#3635#3627#3609#3657#3634
        Width = 80
      end
      item
        Caption = #3594#3639#3656#3629
        Width = 200
      end
      item
        Caption = #3626#3585#3640#3621
        Width = 130
      end
      item
        Caption = #3619#3627#3633#3626
        Width = 200
      end>
    ColumnClick = False
    FlatScrollBars = True
    GridLines = True
    Items.Data = {
      4D0000000300000000000000FFFFFFFFFFFFFFFF000000000000000002616100
      000000FFFFFFFFFFFFFFFF000000000000000002626200000000FFFFFFFFFFFF
      FFFF0000000000000000026363}
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = ListViewCustomDrawItem
    OnDblClick = ListViewDblClick
  end
end
