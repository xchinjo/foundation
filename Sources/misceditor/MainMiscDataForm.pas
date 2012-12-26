unit MainMiscDataForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, cxLookAndFeelPainters, jvuib, DBClient, Provider, jvuibdataset,
  ImgList, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, DBCtrls, StdCtrls, cxButtons, Grids,
  DBGrids, ExtCtrls, ComCtrls, ToolWin, cxCurrencyEdit, cxCalc,
  cxNavigator, cxDBNavigator, cxGraphics, cxLookAndFeels, Menus;

{$I CRG_WM_MSG.INC}

type
  TfrmMainMiscData = class(TForm)
    dscMiscDetailData: TDataSource;
    imgButton: TImageList;
    tbBar: TToolBar;
    btnRefresh: TToolButton;
    ToolButton11: TToolButton;
    btnAddHeader: TToolButton;
    btnEditHeader: TToolButton;
    ToolButton3: TToolButton;
    btnDeleteHeader: TToolButton;
    pnHeaderDataList: TPanel;
    pnHeaderTitle: TPanel;
    Splitter1: TSplitter;
    pnDetailDataEditor: TPanel;
    gbDetailDataEditor: TGroupBox;
    pnDetailTitle: TPanel;
    pnBottom: TPanel;
    lbRecord: TLabel;
    cxButton1: TcxButton;
    dbgHeaderData: TDBGrid;
    dscMiscHeaderData: TDataSource;
    btnEdit: TcxButton;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    dbgDetailData: TDBGrid;
    btnAddNew: TcxButton;
    btnDelete: TcxButton;
    trnsDefault: TJvUIBTransaction;
    dsMiscHeaderData: TJvUIBDataSet;
    dsMiscDetailData: TJvUIBDataSet;
    dsUpdate: TJvUIBQuery;
    cdsMiscDetailData: TClientDataSet;
    dspMiscDetailData: TDataSetProvider;
    dspMiscHeaderData: TDataSetProvider;
    cdsMiscHeaderData: TClientDataSet;
    cdsMiscHeaderDataIS_SYS_LABEL: TStringField;
    lbAddNewHint: TLabel;
    pnEditorData: TPanel;
    lbFDESC_LABEL: TLabel;
    lbFMONEY_LABEL: TLabel;
    lbFDOUBLE_LABEL: TLabel;
    lbFDATE_LABEL: TLabel;
    lbFTEXT_EX_LABEL: TLabel;
    lbFCODE_LABEL: TLabel;
    dlbFCODE_LABEL: TDBText;
    dlbFDESC_LABEL: TDBText;
    dlbFMONEY_LABEL: TDBText;
    dlbFDOUBLE_LABEL: TDBText;
    dlbFDATE_LABEL: TDBText;
    dlbFTEXT_EX_LABEL: TDBText;
    lbISSystemRequired: TLabel;
    dbeFCODE: TcxTextEdit;
    dbeFDESC: TcxTextEdit;
    dbeFDATE: TcxDateEdit;
    dbeFTEXT_EX: TcxTextEdit;
    dbeFMONEY: TcxCurrencyEdit;
    dbeFDOUBLE: TcxCalcEdit;
    cdsMiscDetailDataRECORD_ID: TIntegerField;
    cdsMiscDetailDataPARENT_ID: TIntegerField;
    cdsMiscDetailDataFCODE: TStringField;
    cdsMiscDetailDataFDESC: TStringField;
    cdsMiscDetailDataFMONEY: TBCDField;
    cdsMiscDetailDataFDOUBLE: TFloatField;
    cdsMiscDetailDataFDATE: TDateTimeField;
    cdsMiscDetailDataFTEXT_EX: TStringField;
    cdsMiscDetailDataIS_SYSTEM: TSmallintField;
    cdsMiscHeaderDataRECORD_ID: TIntegerField;
    cdsMiscHeaderDataCODE: TStringField;
    cdsMiscHeaderDataDECSCRIPTION: TStringField;
    cdsMiscHeaderDataFCODE_USED: TStringField;
    cdsMiscHeaderDataFCODE_LABEL: TStringField;
    cdsMiscHeaderDataFDESC_USED: TStringField;
    cdsMiscHeaderDataFDESC_LABEL: TStringField;
    cdsMiscHeaderDataFMONEY_USED: TStringField;
    cdsMiscHeaderDataFMONEY_LABEL: TStringField;
    cdsMiscHeaderDataFDOUBLE_USED: TStringField;
    cdsMiscHeaderDataFDOUBLE_LABEL: TStringField;
    cdsMiscHeaderDataFDATE_USED: TStringField;
    cdsMiscHeaderDataFDATE_LABEL: TStringField;
    cdsMiscHeaderDataFTEXT_EX_USED: TStringField;
    cdsMiscHeaderDataFTEXT_EX_LABEL: TStringField;
    cdsMiscHeaderDataIS_SYSTEM: TSmallintField;
    cxDBNavigator1: TcxDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure pnHeaderDataListResize(Sender: TObject);
    procedure pnDetailDataEditorResize(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAddHeaderClick(Sender: TObject);
    procedure btnEditHeaderClick(Sender: TObject);
    procedure btnDeleteHeaderClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgHeaderDataDblClick(Sender: TObject);
    procedure dbeFCODEKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsMiscHeaderDataFCODE_USEDChange(Sender: TField);
    procedure cdsMiscHeaderDataAfterOpen(DataSet: TDataSet);
    procedure cdsMiscHeaderDataAfterScroll(DataSet: TDataSet);
    procedure cdsMiscDetailDataAfterOpen(DataSet: TDataSet);
    procedure cdsMiscDetailDataAfterScroll(DataSet: TDataSet);
    procedure cdsMiscHeaderDataAfterPost(DataSet: TDataSet);
    procedure cdsMiscHeaderDataCalcFields(DataSet: TDataSet);
  private
    FSystemRequired: Integer;
    FRecordID: Integer;
    FParentID: Integer;

    FMenuLanguage: String;

    procedure SetSystemRequired(Value: Integer);

    procedure Retrieve();
    procedure NewDetail();

    procedure EnableEdit();
    procedure DisableEdit();
    procedure SetEditFocus();

    procedure LanguageChaged(var Message: TMessage); message WM_LANGUAGE_CHANGED;
  public
    DeletedRCID: Integer;

    procedure VisibleUsedData();
    property SystemRequired: Integer read FSystemRequired write SetSystemRequired;
  end;

var
  frmMainMiscData: TfrmMainMiscData;

implementation

uses fbconnection, fshow, crglangmgr, HeaderDataEditorForm;

{$R *.dfm}

const
{********************************* Header SQL *********************************}
  _SQL_UPDATE_HEADER_SQL_ =
    'EXECUTE PROCEDURE SP_INSERT_UPDATE_MISC_HEADER(' +
    '  :RECORD_ID,' +
    '  :CODE,' +
    '  :DECSCRIPTION,' +
    '  :FCODE_USED,' +
    '  :FCODE_LABEL,' +
    '  :FDESC_USED,' +
    '  :FDESC_LABEL,' +
    '  :FMONEY_USED,' +
    '  :FMONEY_LABEL,' +
    '  :FDOUBLE_USED,' +
    '  :FDOUBLE_LABEL,' +
    '  :FDATE_USED,' +
    '  :FDATE_LABEL,' +
    '  :FTEXT_EX_USED,' +
    '  :FTEXT_EX_LABEL,' +
    '  :IS_SYSTEM)';

  _SQL_DELETE_HEADER_SQL_ =
    'EXECUTE PROCEDURE SP_DELETE_MISC_HEADER(:RECORD_ID)';

{********************************* Detail SQL *********************************}
  _SQL_SELECT_DETAIL_SQL_ =
    'SELECT' +
    '  RECORD_ID,' +
    '  PARENT_ID,' +
    '  FCODE,' +
    '  FDESC,' +
    '  FMONEY,' +
    '  FDOUBLE,' +
    '  FDATE,' +
    '  FTEXT_EX,' +
    '  IS_SYSTEM ' +
    'FROM' +
    '  SP_GET_MISC_DETAIL_DATA(:RECORD_ID)';

  _SQL_UPDATE_DETAIL_SQL_ =
    'EXECUTE PROCEDURE SP_INSERT_UPDATE_MISC_DETAIL(' +
    '  :RECORD_ID,' +
    '  :PARENT_ID,' +
    '  :FCODE,' +
    '  :FDESC,' +
    '  :FMONEY,' +
    '  :FDOUBLE,' +
    '  :FDATE,' +
    '  :FTEXT_EX,' +
    '  :IS_SYSTEM)';

  _SQL_DELETE_DETAIL_SQL_ =
    'EXECUTE PROCEDURE SP_DELETE_MISC_DETAIL(:RECORD_ID)';

procedure TfrmMainMiscData.Retrieve();
begin
  dsUpdate.SQL.Text := _SQL_SELECT_DETAIL_SQL_;
  dsUpdate.Params.ByNameAsInteger['RECORD_ID'] := cdsMiscDetailDataRECORD_ID.Value;
  dsUpdate.Open();
  try
    FRecordID := dsUpdate.Fields.ByNameAsInteger['RECORD_ID'];
    FParentID := dsUpdate.Fields.ByNameAsInteger['PARENT_ID'];

    dbeFCODE.Text := dsUpdate.Fields.ByNameAsString['FCODE'];
    dbeFDESC.Text := dsUpdate.Fields.ByNameAsString['FDESC'];

    if (dsUpdate.Fields.ByNameAsVariant['FMONEY'] = NULL) then
      dbeFMONEY.Clear()
    else
      dbeFMONEY.Value := dsUpdate.Fields.ByNameAsCurrency['FMONEY'];

    if (dsUpdate.Fields.ByNameAsVariant['FDOUBLE'] = NULL) then
      dbeFDOUBLE.Clear()
    else
      dbeFDOUBLE.Value := dsUpdate.Fields.ByNameAsDouble['FDOUBLE'];

    if (dsUpdate.Fields.ByNameAsVariant['FDATE'] = NULL) then
      dbeFDATE.EditValue := NULL
    else
      dbeFDATE.Date := dsUpdate.Fields.ByNameAsDateTime['FDATE'];

    if (dsUpdate.Fields.ByNameAsVariant['FTEXT_EX'] = NULL) then
      dbeFTEXT_EX.Clear()
    else
      dbeFTEXT_EX.Text := dsUpdate.Fields.ByNameAsString['FTEXT_EX'];

    SystemRequired := dsUpdate.Fields.ByNameAsInteger['IS_SYSTEM'];
  finally
    dsUpdate.Close(etmCommit);
  end;
end;

procedure TfrmMainMiscData.NewDetail();
begin
  FRecordID := -1;
  FParentID := cdsMiscHeaderDataRECORD_ID.AsInteger;

  dbeFCODE.Clear();
  dbeFDESC.Clear();
  dbeFMONEY.Clear();
  dbeFDOUBLE.Clear();
  dbeFDATE.Clear();
  dbeFTEXT_EX.Clear();

  SystemRequired := 0;
end;

procedure TfrmMainMiscData.SetSystemRequired(Value: Integer);
begin
  FSystemRequired := Value;
  
  if (FSystemRequired = 1) then
  begin
    if (FMenuLanguage = 'ENG') then
      lbISSystemRequired.Caption := 'System Required'
    else
    if (FMenuLanguage = 'THA') then
      lbISSystemRequired.Caption := 'ถูกใช้โดยระบบ';
  end else
    lbISSystemRequired.Caption := '';
end;

procedure TfrmMainMiscData.VisibleUsedData();
var
  _Top: Integer;
begin
  _Top := 1;

  dlbFCODE_LABEL.Visible := (cdsMiscHeaderDataFCODE_USED.AsInteger <> 0);
  lbFCODE_LABEL.Visible := dlbFCODE_LABEL.Visible;
  dbeFCODE.Visible := dlbFCODE_LABEL.Visible;
  if (dlbFCODE_LABEL.Visible) then
  begin
    dlbFCODE_LABEL.Top := _Top + 5;
    lbFCODE_LABEL.Top := _Top;
    dbeFCODE.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFDESC_LABEL.Visible := (cdsMiscHeaderDataFDESC_USED.AsInteger <> 0);
  lbFDESC_LABEL.Visible := lbFDESC_LABEL.Visible;
  dbeFDESC.Visible := dlbFDESC_LABEL.Visible;
  if (dlbFDESC_LABEL.Visible) then
  begin
    dlbFDESC_LABEL.Top := _Top + 5;
    lbFDESC_LABEL.Top := _Top;
    dbeFDESC.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFMONEY_LABEL.Visible := (cdsMiscHeaderDataFMONEY_USED.AsInteger <> 0);
  lbFMONEY_LABEL.Visible := dlbFMONEY_LABEL.Visible;
  dbeFMONEY.Visible := dlbFMONEY_LABEL.Visible;
  if (dlbFMONEY_LABEL.Visible) then
  begin
    dlbFMONEY_LABEL.Top := _Top + 5;
    lbFMONEY_LABEL.Top := _Top;
    dbeFMONEY.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFDOUBLE_LABEL.Visible := (cdsMiscHeaderDataFDOUBLE_USED.AsInteger <> 0);
  lbFDOUBLE_LABEL.Visible := dlbFDOUBLE_LABEL.Visible;
  dbeFDOUBLE.Visible := dlbFDOUBLE_LABEL.Visible;
  if (dlbFDOUBLE_LABEL.Visible) then
  begin
    dlbFDOUBLE_LABEL.Top := _Top + 5;
    lbFDOUBLE_LABEL.Top := _Top;
    dbeFDOUBLE.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFDATE_LABEL.Visible := (cdsMiscHeaderDataFDATE_USED.AsInteger <> 0);
  lbFDATE_LABEL.Visible := dlbFDATE_LABEL.Visible;
  dbeFDATE.Visible := dlbFDATE_LABEL.Visible;
  if (dlbFDATE_LABEL.Visible) then
  begin
    dlbFDATE_LABEL.Top := _Top + 5;
    lbFDATE_LABEL.Top := _Top;
    dbeFDATE.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFTEXT_EX_LABEL.Visible := (cdsMiscHeaderDataFTEXT_EX_USED.AsInteger <> 0);
  lbFTEXT_EX_LABEL.Visible := dlbFTEXT_EX_LABEL.Visible;
  dbeFTEXT_EX.Visible := dlbFTEXT_EX_LABEL.Visible;
  if (dlbFTEXT_EX_LABEL.Visible) then
  begin
    dlbFTEXT_EX_LABEL.Top := _Top + 5;
    lbFTEXT_EX_LABEL.Top := _Top;
    dbeFTEXT_EX.Top := _Top;
  end;
end;

procedure TfrmMainMiscData.EnableEdit();
begin
  btnSave.Enabled := True;
  btnCancel.Enabled := True;

  dbgHeaderData.Enabled := False;
  dbgDetailData.Enabled := False;
  tbBar.Enabled := False;

  pnEditorData.Enabled := True;

  btnAddNew.Enabled := False;
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
end;

procedure TfrmMainMiscData.DisableEdit();
begin
  btnAddNew.Enabled := (not cdsMiscHeaderData.IsEmpty);
  btnEdit.Enabled := (not cdsMiscDetailData.IsEmpty);
  btnDelete.Enabled := btnEdit.Enabled;

  dbgHeaderData.Enabled := True;
  dbgDetailData.Enabled := True;
  tbBar.Enabled := True;
  pnEditorData.Enabled := False;

  btnSave.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmMainMiscData.SetEditFocus();
var
  i: Integer;
  _MinOrder, _Index: Integer;
begin
  _MinOrder := pnEditorData.ControlCount;
  _Index := -1;
  for i := 0 to (pnEditorData.ControlCount - 1) do
  begin
    if (pnEditorData.Controls[i] is TcxTextEdit) or
       (pnEditorData.Controls[i] is TcxCalcEdit) or
       (pnEditorData.Controls[i] is TcxCurrencyEdit) or
       (pnEditorData.Controls[i] is TcxDateEdit) then
    begin
      if (pnEditorData.Controls[i].Visible) then
      begin
        if (TWinControl(pnEditorData.Controls[i]).TabOrder < _MinOrder) then
        begin
          _MinOrder := TWinControl(pnEditorData.Controls[i]).TabOrder;
          _Index := i;
        end;
      end;
    end;
  end;

  if (_Index <> -1) then
    TWinControl(pnEditorData.Controls[_Index]).SetFocus();
end;

procedure TfrmMainMiscData.LanguageChaged(var Message: TMessage);
begin
  FMenuLanguage := GetMenuLanguage();
  LoadComponents('misceditor.dll', Name, FMenuLanguage, Self, trnsDefault);
//  SaveComponents('misceditor.dll', Name, 'ENG', Self, trnsDefault);

  btnRefreshClick(btnRefresh);
end;

procedure TfrmMainMiscData.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  WindowState := wsMaximized;
end;

procedure TfrmMainMiscData.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_LANGUAGE_CHANGED, 0, 0);

  cdsMiscHeaderData.Open();
  ShowFormEx(Self);
end;

procedure TfrmMainMiscData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (trnsDefault.InTransaction) then
    trnsDefault.RollBack();
    
  Action := caFree;
end;

procedure TfrmMainMiscData.cxButton1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmMainMiscData.btnAddNewClick(Sender: TObject);
begin
  pnEditorData.Show();
  EnableEdit();
  btnDelete.Enabled := False;
  NewDetail();
  SetEditFocus();
end;

procedure TfrmMainMiscData.btnEditClick(Sender: TObject);
begin
  EnableEdit();
  SetEditFocus();
end;

procedure TfrmMainMiscData.btnSaveClick(Sender: TObject);
begin
  trnsDefault.StartTransaction();

  dsUpdate.SQL.Text := _SQL_UPDATE_DETAIL_SQL_;
  dsUpdate.Params.ByNameAsInteger['RECORD_ID'] := FRecordID;
  dsUpdate.Params.ByNameAsInteger['PARENT_ID'] := FParentID;

  dsUpdate.Params.ByNameAsString['FCODE'] := dbeFCODE.Text;

  if (dbeFDESC.EditValue <> NULL) then
    dsUpdate.Params.ByNameAsString['FDESC'] := dbeFDESC.Text;

  if (dbeFMONEY.EditValue <> NULL) then
    dsUpdate.Params.ByNameAsDouble['FMONEY'] := dbeFMONEY.Value;

  if (dbeFDOUBLE.EditValue <> NULL) then
    dsUpdate.Params.ByNameAsDouble['FDOUBLE'] := dbeFDOUBLE.Value;

  if (dbeFDATE.EditValue <> NULL) then
    dsUpdate.Params.ByNameAsDateTime['FDATE'] := dbeFDATE.Date;

  if (dbeFTEXT_EX.EditValue <> NULL) then
    dsUpdate.Params.ByNameAsString['FTEXT_EX'] := dbeFTEXT_EX.Text;
    
  dsUpdate.Params.ByNameAsInteger['IS_SYSTEM'] := SystemRequired;

  dsUpdate.ExecSQL();
  dsUpdate.Close(etmCommit);

  cdsMiscDetailData.Close();
  cdsMiscDetailData.Open();

  DisableEdit();
end;

procedure TfrmMainMiscData.btnCancelClick(Sender: TObject);
begin
  Retrieve();
  DisableEdit();
end;

procedure TfrmMainMiscData.pnHeaderDataListResize(Sender: TObject);
begin
  dbgHeaderData.Columns[1].Width :=
    dbgHeaderData.Width - dbgHeaderData.Columns[0].Width - 30;
end;

procedure TfrmMainMiscData.pnDetailDataEditorResize(Sender: TObject);
begin
  dbgDetailData.Columns[1].Width :=
    dbgDetailData.Width - dbgDetailData.Columns[0].Width - 30;
end;


procedure TfrmMainMiscData.btnRefreshClick(Sender: TObject);
begin
  cdsMiscHeaderData.Close();
  cdsMiscHeaderData.Open();
end;

procedure TfrmMainMiscData.btnAddHeaderClick(Sender: TObject);
begin
  with TfrmHeaderDataEditor.Create(Self) do
  try
    MainForm := Self;
    Caption := Caption + ' (New)';

    trnsDefault.StartTransaction();
    cdsMiscHeaderData.Append();
    cdsMiscHeaderDataRECORD_ID.AsInteger := -1;
    cdsMiscHeaderDataFCODE_USED.AsString := '1';
    cdsMiscHeaderDataFCODE_LABEL.AsString := 'Code';
    cdsMiscHeaderDataFDESC_USED.AsString := '1';
    cdsMiscHeaderDataFDESC_LABEL.AsString := 'Description';
    cdsMiscHeaderDataFMONEY_USED.AsString := '0';
    cdsMiscHeaderDataFDOUBLE_USED.AsString := '0';
    cdsMiscHeaderDataFDATE_USED.AsString := '0';
    cdsMiscHeaderDataFTEXT_EX_USED.AsString := '0';

    ShowModal();
  finally
    Free();
  end;
end;

procedure TfrmMainMiscData.btnEditHeaderClick(Sender: TObject);
begin
  with TfrmHeaderDataEditor.Create(Self) do
  try
    MainForm := Self;
    Caption := Caption + ' (Edit)';

    trnsDefault.StartTransaction();
    cdsMiscHeaderData.Edit();

    ShowModal();
    VisibleUsedData();
  finally
    Free();
  end;
end;

procedure TfrmMainMiscData.btnDeleteHeaderClick(Sender: TObject);
var
  _R: Integer;
begin
  if (cdsMiscHeaderDataIS_SYSTEM.Value = 1) then
  begin
    Application.MessageBox(
      'This HEADER data has been required by system and could not be deleted.',
      'Message', MB_OK or MB_ICONWARNING);

    Exit;
  end;

  _R := Application.MessageBox(
    'Do you want to delete current HEADER record?',
    'Confirm Delete', MB_YESNO or MB_ICONQUESTION);

  if (_R = idYes) then
  begin
    dsUpdate.SQL.Text := _SQL_DELETE_HEADER_SQL_;
    dsUpdate.Params.ByNameAsInteger['RECORD_ID'] :=
      cdsMiscHeaderDataRECORD_ID.AsInteger;
    dsUpdate.ExecSQL();
    dsUpdate.Close(etmCommit);

    cdsMiscHeaderData.Close();
    cdsMiscHeaderData.Open();
  end;
end;

procedure TfrmMainMiscData.btnDeleteClick(Sender: TObject);
var
  _R: Integer;
begin
  if (SystemRequired = 1) then
  begin
    Application.MessageBox(
      'This DETAIL data has been required by system and could not be deleted.',
      'Message', MB_OK or MB_ICONWARNING);

    Exit;
  end;

  _R := Application.MessageBox(
    'Do you want to delete current DETAIL record?',
    'Confirm Delete', MB_YESNO or MB_ICONQUESTION);

  if (_R = idYes) then
  begin
    dsUpdate.SQL.Text := _SQL_DELETE_DETAIL_SQL_;
    dsUpdate.Params.ByNameAsInteger['RECORD_ID'] := FRecordID;
    dsUpdate.ExecSQL();
    dsUpdate.Close(etmCommit);

    dsMiscDetailData.Close();
    dsMiscDetailData.Open();
  end;
end;

procedure TfrmMainMiscData.dbgHeaderDataDblClick(Sender: TObject);
begin
  btnEditHeaderClick(btnEditHeader);
end;

procedure TfrmMainMiscData.dbeFCODEKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmMainMiscData.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) then
  begin
    if (Char(Lo(Key)) = 'R') then
    begin
      if (pnEditorData.Enabled) then
        if (SystemRequired = 1) then
          SystemRequired := 0
        else
          SystemRequired := 1;

      Key := 0;
    end else
    if (Key = VK_DELETE) then
      btnDeleteClick(btnDelete);
  end else
  begin
    case Key of
      VK_F2: btnEditClick(btnEdit);
      VK_F3: btnAddNewClick(btnAddNew);
    end;
  end;
end;

procedure TfrmMainMiscData.cdsMiscHeaderDataFCODE_USEDChange(
  Sender: TField);
begin
  VisibleUsedData();
end;

procedure TfrmMainMiscData.cdsMiscHeaderDataAfterOpen(DataSet: TDataSet);
begin
  btnDeleteHeader.Enabled := (not cdsMiscHeaderData.IsEmpty);
  btnRefresh.Enabled := btnDeleteHeader.Enabled;
  btnEditHeader.Enabled := btnDeleteHeader.Enabled;
end;

procedure TfrmMainMiscData.cdsMiscHeaderDataAfterScroll(DataSet: TDataSet);
begin
  cdsMiscDetailData.Close();
  dsMiscDetailData.Params.ByNameAsInteger['PARENT_ID'] :=
    cdsMiscHeaderDataRECORD_ID.AsInteger;
  cdsMiscDetailData.Open();
end;

procedure TfrmMainMiscData.cdsMiscDetailDataAfterOpen(DataSet: TDataSet);
begin
  if (not cdsMiscDetailData.IsEmpty) then
  begin
    pnEditorData.Show();
    VisibleUsedData();
    btnAddNew.Enabled := True;
    btnEdit.Enabled := (not cdsMiscDetailData.IsEmpty);
    btnDelete.Enabled := btnEdit.Enabled;
    dbgDetailData.Enabled := True;
  end else
  begin
    pnEditorData.Hide();
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    dbgDetailData.Enabled := True;
  end;
  dbgDetailData.Columns[0].Title.Caption := cdsMiscHeaderDataFCODE_LABEL.Value;
  dbgDetailData.Columns[1].Title.Caption := cdsMiscHeaderDataFDESC_LABEL.Value;
end;

procedure TfrmMainMiscData.cdsMiscDetailDataAfterScroll(DataSet: TDataSet);
begin
  Retrieve();
end;

procedure TfrmMainMiscData.cdsMiscHeaderDataAfterPost(DataSet: TDataSet);
begin
  dsUpdate.SQL.Text := _SQL_UPDATE_HEADER_SQL_;

  dsUpdate.Params.ByNameAsInteger['RECORD_ID'] :=
    cdsMiscHeaderDataRECORD_ID.AsInteger;

  dsUpdate.Params.ByNameAsString['CODE'] :=
    cdsMiscHeaderDataCODE.AsString;
    
  dsUpdate.Params.ByNameAsString['DECSCRIPTION'] :=
    cdsMiscHeaderDataDECSCRIPTION.AsString;

  dsUpdate.Params.ByNameAsString['FCODE_USED'] :=
    cdsMiscHeaderDataFCODE_USED.AsString;
  if (Trim(cdsMiscHeaderDataFCODE_LABEL.Value) <> '') then
    dsUpdate.Params.ByNameAsString['FCODE_LABEL'] :=
      cdsMiscHeaderDataFCODE_LABEL.AsString;

  dsUpdate.Params.ByNameAsString['FDESC_USED'] :=
    cdsMiscHeaderDataFDESC_USED.AsString;
  if (Trim(cdsMiscHeaderDataFDESC_LABEL.Value) <> '') then
    dsUpdate.Params.ByNameAsString['FDESC_LABEL'] :=
      cdsMiscHeaderDataFDESC_LABEL.AsString;

  dsUpdate.Params.ByNameAsString['FMONEY_USED'] :=
    cdsMiscHeaderDataFMONEY_USED.AsString;
  if (Trim(cdsMiscHeaderDataFMONEY_LABEL.Value) <> '') then
    dsUpdate.Params.ByNameAsString['FMONEY_LABEL'] :=
      cdsMiscHeaderDataFMONEY_LABEL.AsString;

  dsUpdate.Params.ByNameAsString['FDOUBLE_USED'] :=
    cdsMiscHeaderDataFDOUBLE_USED.AsString;
  if (Trim(cdsMiscHeaderDataFDOUBLE_LABEL.Value) <> '') then
    dsUpdate.Params.ByNameAsString['FDOUBLE_LABEL'] :=
      cdsMiscHeaderDataFDOUBLE_LABEL.AsString;

  dsUpdate.Params.ByNameAsString['FDATE_USED'] :=
    cdsMiscHeaderDataFDATE_USED.AsString;
  if (Trim(cdsMiscHeaderDataFDATE_LABEL.Value) <> '') then
    dsUpdate.Params.ByNameAsString['FDATE_LABEL'] :=
      cdsMiscHeaderDataFDATE_LABEL.AsString;

  dsUpdate.Params.ByNameAsString['FTEXT_EX_USED'] :=
    cdsMiscHeaderDataFTEXT_EX_USED.AsString;
  if (Trim(cdsMiscHeaderDataFTEXT_EX_LABEL.Value) <> '') then
    dsUpdate.Params.ByNameAsString['FTEXT_EX_LABEL'] :=
      cdsMiscHeaderDataFTEXT_EX_LABEL.AsString;

  dsUpdate.Params.ByNameAsInteger['IS_SYSTEM'] :=
    cdsMiscHeaderDataIS_SYSTEM.AsInteger;

  dsUpdate.ExecSQL();
  dsUpdate.Close(etmCommit);
end;

procedure TfrmMainMiscData.cdsMiscHeaderDataCalcFields(DataSet: TDataSet);
begin
  if (cdsMiscHeaderDataIS_SYSTEM.Value = 1) then
  begin
    if (FMenuLanguage = 'ENG') then
      cdsMiscHeaderDataIS_SYS_LABEL.Value := 'System Required'
    else
    if (FMenuLanguage = 'THA') then
      cdsMiscHeaderDataIS_SYS_LABEL.Value := 'ถูกใช้โดยระบบ';
  end else
      cdsMiscHeaderDataIS_SYS_LABEL.Value := '';
end;

end.

