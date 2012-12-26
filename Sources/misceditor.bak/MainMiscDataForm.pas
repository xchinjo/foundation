unit MainMiscDataForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, StdCtrls, cxButtons, ExtCtrls, ComCtrls, ToolWin, ImgList,
  Grids, DBGrids, cxMaskEdit, cxDropDownEdit, cxCalendar, DBCtrls;

type
  TfrmMainMiscData = class(TForm)
    dsMiscHeaderData: TpFIBDataSet;
    DBTrans: TpFIBTransaction;
    dsMiscDetailData: TpFIBDataSet;
    dscMiscDetailData: TDataSource;
    dsMiscHeaderDataRECORD_ID: TFIBBCDField;
    dsMiscHeaderDataCODE: TFIBStringField;
    dsMiscHeaderDataDECSCRIPTION: TFIBStringField;
    dsMiscHeaderDataFCODE_USED: TFIBStringField;
    dsMiscHeaderDataFCODE_LABEL: TFIBStringField;
    dsMiscHeaderDataFDESC_USED: TFIBStringField;
    dsMiscHeaderDataFDESC_LABEL: TFIBStringField;
    dsMiscHeaderDataFMONEY_USED: TFIBStringField;
    dsMiscHeaderDataFMONEY_LABEL: TFIBStringField;
    dsMiscHeaderDataFDOUBLE_USED: TFIBStringField;
    dsMiscHeaderDataFDOUBLE_LABEL: TFIBStringField;
    dsMiscHeaderDataFDATE_USED: TFIBStringField;
    dsMiscHeaderDataFDATE_LABEL: TFIBStringField;
    dsMiscHeaderDataFTEXT_EX_USED: TFIBStringField;
    dsMiscHeaderDataFTEXT_EX_LABEL: TFIBStringField;
    dsMiscDetailDataRECORD_ID: TFIBBCDField;
    dsMiscDetailDataPARENT_ID: TFIBBCDField;
    dsMiscDetailDataFCODE: TFIBStringField;
    dsMiscDetailDataFDESC: TFIBStringField;
    dsMiscDetailDataFMONEY: TFIBBCDField;
    dsMiscDetailDataFDOUBLE: TFIBFloatField;
    dsMiscDetailDataFDATE: TFIBDateTimeField;
    dsMiscDetailDataFTEXT_EX: TFIBStringField;
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
    pnEditorData: TPanel;
    lbFCODE_LABEL: TLabel;
    lbFDESC_LABEL: TLabel;
    lbFMONEY_LABEL: TLabel;
    lbFDOUBLE_LABEL: TLabel;
    lbFDATE_LABEL: TLabel;
    lbFTEXT_EX_LABEL: TLabel;
    dbeFCODE: TcxDBTextEdit;
    dbeFDESC: TcxDBTextEdit;
    dbeFMONEY: TcxDBTextEdit;
    dbeFTEXT_EX: TcxDBTextEdit;
    dbeFDOUBLE: TcxDBTextEdit;
    dbeFDATE: TcxDBDateEdit;
    dbgDetailData: TDBGrid;
    dlbFCODE_LABEL: TDBText;
    dlbFDESC_LABEL: TDBText;
    dlbFMONEY_LABEL: TDBText;
    dlbFDOUBLE_LABEL: TDBText;
    dlbFDATE_LABEL: TDBText;
    dlbFTEXT_EX_LABEL: TDBText;
    btnAddNew: TcxButton;
    btnDelete: TcxButton;
    dsMiscHeaderDataIS_SYSTEM: TSmallintField;
    dsMiscDetailDataIS_SYSTEM: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsMiscHeaderDataAfterScroll(DataSet: TDataSet);
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
    procedure dsMiscDetailDataAfterOpen(DataSet: TDataSet);
    procedure dsMiscHeaderDataAfterOpen(DataSet: TDataSet);
    procedure dsMiscHeaderDataAfterPost(DataSet: TDataSet);
  private
    procedure VisibleUsedData();
    procedure EnableEdit();
    procedure DisableEdit();
  public
    { Public declarations }
  end;

var
  frmMainMiscData: TfrmMainMiscData;

implementation

uses fshow, HeaderDataEditorForm;

{$R *.dfm}

procedure TfrmMainMiscData.VisibleUsedData();
var
  _Top: Integer;
begin
  _Top := 1;

  dlbFCODE_LABEL.Visible := (dsMiscHeaderDataFCODE_USED.AsInteger <> 0);
  lbFCODE_LABEL.Visible := dlbFCODE_LABEL.Visible;
  dbeFCODE.Visible := dlbFCODE_LABEL.Visible;
  if (dlbFCODE_LABEL.Visible) then
  begin
    dlbFCODE_LABEL.Top := _Top + 5;
    lbFCODE_LABEL.Top := _Top;
    dbeFCODE.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFDESC_LABEL.Visible := (dsMiscHeaderDataFDESC_USED.AsInteger <> 0);
  lbFDESC_LABEL.Visible := lbFDESC_LABEL.Visible;
  dbeFDESC.Visible := dlbFDESC_LABEL.Visible;
  if (dlbFDESC_LABEL.Visible) then
  begin
    dlbFDESC_LABEL.Top := _Top + 5;
    lbFDESC_LABEL.Top := _Top;
    dbeFDESC.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFMONEY_LABEL.Visible := (dsMiscHeaderDataFMONEY_USED.AsInteger <> 0);
  lbFMONEY_LABEL.Visible := dlbFMONEY_LABEL.Visible;
  dbeFMONEY.Visible := dlbFMONEY_LABEL.Visible;
  if (dlbFMONEY_LABEL.Visible) then
  begin
    dlbFMONEY_LABEL.Top := _Top + 5;
    lbFMONEY_LABEL.Top := _Top;
    dbeFMONEY.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFDOUBLE_LABEL.Visible := (dsMiscHeaderDataFDOUBLE_USED.AsInteger <> 0);
  lbFDOUBLE_LABEL.Visible := dlbFDOUBLE_LABEL.Visible;
  dbeFDOUBLE.Visible := dlbFDOUBLE_LABEL.Visible;
  if (dlbFDOUBLE_LABEL.Visible) then
  begin
    dlbFDOUBLE_LABEL.Top := _Top + 5;
    lbFDOUBLE_LABEL.Top := _Top;
    dbeFDOUBLE.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFDATE_LABEL.Visible := (dsMiscHeaderDataFDATE_USED.AsInteger <> 0);
  lbFDATE_LABEL.Visible := dlbFDATE_LABEL.Visible;
  dbeFDATE.Visible := dlbFDATE_LABEL.Visible;
  if (dlbFDATE_LABEL.Visible) then
  begin
    dlbFDATE_LABEL.Top := _Top + 5;
    lbFDATE_LABEL.Top := _Top;
    dbeFDATE.Top := _Top;
    _Top := _Top + 29;
  end;

  dlbFTEXT_EX_LABEL.Visible := (dsMiscHeaderDataFTEXT_EX_USED.AsInteger <> 0);
  lbFTEXT_EX_LABEL.Visible := dlbFTEXT_EX_LABEL.Visible;
  dbeFTEXT_EX.Visible := dlbFTEXT_EX_LABEL.Visible;
  if (dlbFTEXT_EX_LABEL.Visible) then
  begin
    dlbFTEXT_EX_LABEL.Top := _Top + 5;
    lbFTEXT_EX_LABEL.Top := _Top;
    dbeFTEXT_EX.Top := _Top;
    _Top := _Top + 29;
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
end;

procedure TfrmMainMiscData.DisableEdit();
begin
  btnAddNew.Enabled := (not dsMiscHeaderData.IsEmpty);
  btnEdit.Enabled := (not dsMiscDetailData.IsEmpty);

  dbgHeaderData.Enabled := True;
  dbgDetailData.Enabled := True;
  tbBar.Enabled := True;
  pnEditorData.Enabled := True;

  btnSave.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmMainMiscData.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  WindowState := wsMaximized;
end;

procedure TfrmMainMiscData.FormShow(Sender: TObject);
begin
  dsMiscHeaderData.Open();
  
  ShowFormEx(Self);
end;

procedure TfrmMainMiscData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainMiscData.dsMiscHeaderDataAfterScroll(DataSet: TDataSet);
begin
  dsMiscDetailData.Close();

  dsMiscDetailData.ParamByName('PARENT_ID').AsInteger :=
    dsMiscHeaderDataRECORD_ID.AsInteger;

  dsMiscDetailData.Open();
end;

procedure TfrmMainMiscData.cxButton1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmMainMiscData.btnAddNewClick(Sender: TObject);
begin
  EnableEdit();
  DBTrans.StartTransaction();
  dsMiscDetailData.Append();
  dsMiscDetailDataPARENT_ID.AsInteger := dsMiscHeaderDataRECORD_ID.AsInteger;
end;

procedure TfrmMainMiscData.btnEditClick(Sender: TObject);
begin
  EnableEdit();
  DBTrans.StartTransaction();
  dsMiscDetailData.Edit();
end;

procedure TfrmMainMiscData.btnSaveClick(Sender: TObject);
begin
  dsMiscDetailData.Post();
  DBTrans.CommitRetaining();
  DisableEdit();
end;

procedure TfrmMainMiscData.btnCancelClick(Sender: TObject);
begin
  dsMiscDetailData.Cancel();
  DBTrans.RollbackRetaining();
  DisableEdit();

  dsMiscHeaderData.Open();
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
  dsMiscHeaderData.Close();
  dsMiscHeaderData.Open();
end;

procedure TfrmMainMiscData.btnAddHeaderClick(Sender: TObject);
begin
  with TfrmHeaderDataEditor.Create(Self) do
  begin
    Parent := Self;
    Caption := Caption + ' (New)';

    DBTrans.StartTransaction();
    ShowModal();
  end;
end;

procedure TfrmMainMiscData.btnEditHeaderClick(Sender: TObject);
begin
  with TfrmHeaderDataEditor.Create(Self) do
  begin
    Parent := Self;
    Caption := Caption + ' (Edit)';

    DBTrans.StartTransaction();
    dsMiscHeaderData.Edit();
    ShowModal();
  end;
end;

procedure TfrmMainMiscData.btnDeleteHeaderClick(Sender: TObject);
var
  _R: Integer;
begin
  if (dsMiscHeaderDataIS_SYSTEM.Value = 1) then
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
    DBTrans.StartTransaction();
    dsMiscHeaderData.Delete();
    DBTrans.Commit();

    dsMiscHeaderData.Close();
    dsMiscHeaderData.Open();
  end;
end;

procedure TfrmMainMiscData.btnDeleteClick(Sender: TObject);
var
  _R: Integer;
begin
  if (dsMiscDetailDataIS_SYSTEM.Value = 1) then
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
    dsMiscDetailData.Delete();

    dsMiscDetailData.Close();
    dsMiscDetailData.Open();
  end;
end;

procedure TfrmMainMiscData.dsMiscDetailDataAfterOpen(DataSet: TDataSet);
begin
  if (not dsMiscDetailData.IsEmpty) then
  begin
    pnEditorData.Show();
    VisibleUsedData();

    btnAddNew.Enabled := True;
    btnEdit.Enabled := (not dsMiscDetailData.IsEmpty);
    btnDelete.Enabled := btnEdit.Enabled;
  end else
  begin
    pnEditorData.Hide();

    btnAddNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
  end;

  dbgDetailData.Columns[0].Title.Caption := dsMiscHeaderDataFCODE_LABEL.Value;
  dbgDetailData.Columns[1].Title.Caption := dsMiscHeaderDataFDESC_LABEL.Value;
end;

procedure TfrmMainMiscData.dsMiscHeaderDataAfterOpen(DataSet: TDataSet);
begin
  btnDeleteHeader.Enabled := (not dsMiscHeaderData.IsEmpty);
  btnRefresh.Enabled := btnDeleteHeader.Enabled;
  btnEditHeader.Enabled := btnDeleteHeader.Enabled;
end;

procedure TfrmMainMiscData.dsMiscHeaderDataAfterPost(DataSet: TDataSet);
begin
  dsMiscHeaderData.ApplyUpdToBase();
end;

end.
