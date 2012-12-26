object frmEditRoles: TfrmEditRoles
  Left = 380
  Top = 133
  Width = 710
  Height = 466
  BorderIcons = [biSystemMenu]
  Caption = 'frmEditRoles'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object rzTopPanel: TRzPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 4
    Align = alTop
    BorderOuter = fsNone
    GradientColorStyle = gcsCustom
    TabOrder = 0
    VisualStyle = vsGradient
  end
  object grdRolePermission: TcxGrid
    Left = 0
    Top = 41
    Width = 702
    Height = 397
    Align = alClient
    TabOrder = 1
    object grdRolePermissionDBTableView1: TcxGridDBTableView
      DataController.DataSource = dsRolePermission
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Inserting = False
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      object grdRolePermissionDBTableView1id: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        DataBinding.FieldName = 'id'
      end
      object grdRolePermissionDBTableView1MenuName: TcxGridDBColumn
        MinWidth = 300
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 300
        DataBinding.FieldName = 'MenuName'
      end
      object grdRolePermissionDBTableView1FAccess: TcxGridDBColumn
        Caption = 'V'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        HeaderAlignmentHorz = taCenter
        MinWidth = 30
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 30
        DataBinding.FieldName = 'FAccess'
      end
      object grdRolePermissionDBTableView1FInsert: TcxGridDBColumn
        Caption = 'I'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        HeaderAlignmentHorz = taCenter
        MinWidth = 30
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 30
        DataBinding.FieldName = 'FInsert'
      end
      object grdRolePermissionDBTableView1FModify: TcxGridDBColumn
        Caption = 'M'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        HeaderAlignmentHorz = taCenter
        MinWidth = 30
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 30
        DataBinding.FieldName = 'FModify'
      end
      object grdRolePermissionDBTableView1FDelete: TcxGridDBColumn
        Caption = 'D'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        HeaderAlignmentHorz = taCenter
        MinWidth = 30
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 30
        DataBinding.FieldName = 'FDelete'
      end
      object grdRolePermissionDBTableView1FInquiry: TcxGridDBColumn
        Caption = 'IQ'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        HeaderAlignmentHorz = taCenter
        MinWidth = 30
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 30
        DataBinding.FieldName = 'FInquiry'
      end
      object grdRolePermissionDBTableView1FReport: TcxGridDBColumn
        Caption = 'R'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        HeaderAlignmentHorz = taCenter
        MinWidth = 30
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 30
        DataBinding.FieldName = 'FReport'
      end
    end
    object grdRolePermissionLevel1: TcxGridLevel
      GridView = grdRolePermissionDBTableView1
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 4
    Width = 702
    Height = 37
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      702
      37)
    object btnOK: TRzButton
      Left = 545
      Top = 5
      Anchors = [akTop, akRight]
      Caption = 'Save'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TRzButton
      Left = 625
      Top = 5
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object cmbRoles: TRzComboBox
      Left = 48
      Top = 6
      Width = 281
      Height = 24
      Style = csDropDownList
      Ctl3D = False
      FrameVisible = True
      ItemHeight = 16
      ParentCtl3D = False
      TabOrder = 2
      OnChange = cmbRolesChange
    end
  end
  object dsRolePermission: TDataSource
    DataSet = FrmUserList.cdsRolePermission
    Left = 444
    Top = 270
  end
end
