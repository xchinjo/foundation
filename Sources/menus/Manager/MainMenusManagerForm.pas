unit MainMenusManagerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms, 
  cxLookAndFeelPainters, DBClient, Provider, jvuib, DB, jvuibdataset,
  Dialogs, ExtDlgs, ImgList, Controls, ComCtrls, ToolWin, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxMemo, cxImage, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxGraphics,
  cxLookAndFeels, Menus;

{$I CRG_WM_MSG.INC}

type
  PCurrentMenuItem = ^TCurrentMenuItem;
  TCurrentMenuItem = record
    Parent_ID: Integer;
    MenuItem: TTreeNode;

    Prior: PCurrentMenuItem;
  end;

  TfrmManager = class(TForm)
    pnMenuItemList: TPanel;
    tvMenus: TTreeView;
    Splitter1: TSplitter;
    pnMenuItemEditor: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Panel4: TPanel;
    imgButton: TImageList;
    tbBar: TToolBar;
    btnRefresh: TToolButton;
    btnAddPullDownMenu: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    btnAddMenuItem: TToolButton;
    btnDeleteMenuItem: TToolButton;
    btnExecuteGrantManager: TToolButton;
    ToolButton11: TToolButton;
    imgMenuList: TImageList;
    dscMenuItem: TDataSource;
    pnEditor: TPanel;
    btnEdit: TcxButton;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    pnEditorData: TPanel;
    lbOrderItem: TLabel;
    lbThaiName: TLabel;
    lbEnglishName: TLabel;
    lbShortCut: TLabel;
    lbAppName: TLabel;
    lbParameters: TLabel;
    lbIconPicture: TLabel;
    lbDescThai: TLabel;
    dbeORDER_ITEM: TcxDBTextEdit;
    dbeNAME_TH: TcxDBTextEdit;
    dbeNAME_EN: TcxDBTextEdit;
    dbeAPP_NAME: TcxDBTextEdit;
    dbePARAMS: TcxDBTextEdit;
    dbeICON: TcxDBImage;
    dbmDESC_THA: TcxDBMemo;
    btnLoadIcon: TcxButton;
    btnClearIcon: TcxButton;
    opDialog: TOpenPictureDialog;
    dbcShortCut: TcxDBComboBox;
    pnBottom: TPanel;
    lbRecord: TLabel;
    btnClose: TcxButton;
    lbDecsEnglish: TLabel;
    dbmDESC_ENG: TcxDBMemo;
    trnsDefault: TJvUIBTransaction;
    dsMenuData: TJvUIBDataSet;
    dsMenuDataPARENT_ID: TIntegerField;
    dsMenuDataRECORD_ID: TIntegerField;
    dsMenuDataORDER_ITEM: TIntegerField;
    dsMenuDataNAME: TStringField;
    dsMenuDataSHORTCUT: TStringField;
    dsMenuDataAPP_NAME: TStringField;
    dsMenuDataPARAMS: TStringField;
    dsMenuDataICON: TBlobField;
    dsMenuDataDESCRIPTION: TStringField;
    dsMenuItemX: TJvUIBDataSet;
    dsSQL: TJvUIBQuery;
    dspMenuItem: TDataSetProvider;
    cdsMenuItem: TClientDataSet;
    cdsMenuItemPARENT_ID: TIntegerField;
    cdsMenuItemRECORD_ID: TIntegerField;
    cdsMenuItemORDER_ITEM: TIntegerField;
    cdsMenuItemNAME_TH: TStringField;
    cdsMenuItemNAME_EN: TStringField;
    cdsMenuItemSHORTCUT: TStringField;
    cdsMenuItemAPP_NAME: TStringField;
    cdsMenuItemPARAMS: TStringField;
    cdsMenuItemICON: TBlobField;
    cdsMenuItemDESC_THA: TStringField;
    cdsMenuItemDESC_ENG: TStringField;
    lbHint: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAddPullDownMenuClick(Sender: TObject);
    procedure btnAddMenuItemClick(Sender: TObject);
    procedure btnDeleteMenuItemClick(Sender: TObject);
    procedure btnExecuteGrantManagerClick(Sender: TObject);
    procedure dbeORDER_ITEMKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoadIconClick(Sender: TObject);
    procedure btnClearIconClick(Sender: TObject);
    procedure tvMenusChange(Sender: TObject; Node: TTreeNode);
    procedure btnCloseClick(Sender: TObject);
    procedure cdsMenuItemAfterPost(DataSet: TDataSet);
  private
    FMenuLanguage: String;
    FCurrentMenuItem: PCurrentMenuItem;

    FIsAddItem: Boolean;

    function GetNode(const _Data: Integer): TTreeNode;
    procedure AddNewItem(const _ParentID: Integer = -1);

    procedure LanguageChaged(var Message: TMessage); message WM_LANGUAGE_CHANGED;
  public
    procedure UnloadMenus();
    procedure LoadMenus();
    function IsAbleToRun(const _AppName: String): Boolean;

    procedure SetWrkUsr(const _UserID, Job_Desc: String);
  end;

var
  frmManager: TfrmManager;

implementation

uses crgsec, fbconnection, fshow, crglangmgr;

{$R *.dfm}

const
  _SQL_UPDATE_MENU_ITEM_ =
    'EXECUTE PROCEDURE SP_INSERT_UPDATE_MENU_ITEM (' +
    '  :RECORD_ID,' +
    '  :PARENT_ID,' +
    '  :ORDER_ITEM,' +
    '  :NAME_TH,' +
    '  :NAME_EN,' +
    '  :SHORTCUT,' +
    '  :APP_NAME,' +
    '  :PARAM_LIST,' +
    '  :ICON,' +
    '  :DESC_THA,' +
    '  :DESC_ENG)';

  _SQL_DELETE_MENU_ITEM_ =
    'EXECUTE PROCEDURE SP_DELETE_MENU_ITEM(:RECORD_ID)';

//**************************** Menu Loader Engine ****************************//
function FindPriorItem(_CurrentMenuItem: PCurrentMenuItem;
  Parant_ID: Integer): PCurrentMenuItem;
begin
  Result := _CurrentMenuItem;

  while ((Result <> nil) and (Result^.Parent_ID <> Parant_ID)) do
    Result := Result^.Prior;
end;

function GotoPriorItem(_CurrentMenuItem: PCurrentMenuItem;
  Parant_ID: Integer): PCurrentMenuItem;
begin
  Result := _CurrentMenuItem;

  while ((Result <> nil) and (Result^.Parent_ID <> Parant_ID) ) do
  begin
    _CurrentMenuItem := Result;
    Result := Result^.Prior;
    Dispose(_CurrentMenuItem);
  end;
end;

function CreateNextItem(_CurrentMenuItem: PCurrentMenuItem;
  _Parent_ID: Integer; _MenuItem: TTreeNode): PCurrentMenuItem;
begin
  if ((_CurrentMenuItem <> nil) and (_CurrentMenuItem^.Parent_ID = _Parent_ID)) then
  begin
    Result := _CurrentMenuItem;
    Exit;
  end;

  if (FindPriorItem(_CurrentMenuItem, _Parent_ID) = nil) then
  begin
    New(Result);

    Result^.Parent_ID := _Parent_ID;
    Result^.MenuItem := _MenuItem;
    Result^.Prior := _CurrentMenuItem;
  end else
    Result := GotoPriorItem(_CurrentMenuItem, _Parent_ID);
end;

procedure FreeAllItem(_CurrentMenuItem: PCurrentMenuItem);
var
  _C: PCurrentMenuItem;
begin
  _C := _CurrentMenuItem;

  if (_C = nil) then
    Exit;

  if (_C^.Prior <> nil) then
  begin
    while (_C^.Prior <> nil) do
    begin
      _CurrentMenuItem := _C.Prior;
      Dispose(_C);
      _C := _CurrentMenuItem;
    end;
  end;

  Dispose(_CurrentMenuItem);
end;

function TfrmManager.GetNode(const _Data: Integer): TTreeNode;
var
  i: Integer;
begin
  Result := nil;
  for i := 1 to (tvMenus.Items.Count - 1) do
  begin
    if (Integer(tvMenus.Items[i].Data^) = _Data) then
    begin
      Result := tvMenus.Items[i];
      Break;
    end;
  end;
end;

procedure TfrmManager.UnloadMenus();
var
  _P: Integer;
  _T: TTreeNode;
begin
  _P := tvMenus.Items.Count - 1;
  while (_P >= 1) do
  begin
    _T := tvMenus.Items[_P];
    Dispose(_T.Data);
    tvMenus.Items.Delete(_T);
    Dec(_P);
  end;

  while (imgMenuList.Count > 4) do
    imgMenuList.Delete(3);
end;

procedure TfrmManager.LoadMenus();
const
  PULL_DOWN_ID = -1;
var
  _Parent_ID: Integer;
  _Item: TTreeNode;
  _B: TBitmap;
  _Data: PInteger;
begin
  UnloadMenus();

  FMenuLanguage :=  GetMenuLanguage();
  dsMenuData.Params.ByNameAsString['LANGUAGE'] := FMenuLanguage;

  _B := TBitmap.Create();
  try
    dsMenuData.Open();

    _Item := tvMenus.Items[0];
    FCurrentMenuItem := nil;

    dsMenuData.Last();
    dsMenuData.First();
    while (not (dsMenuData.Eof)) do
    begin
      _Parent_ID := dsMenuDataPARENT_ID.AsInteger;

      FCurrentMenuItem := CreateNextItem(FCurrentMenuItem, _Parent_ID, _Item);

      _Item := tvMenus.Items.AddChild(
        FCurrentMenuItem.MenuItem,
        Trim(dsMenuDataNAME.Value));

      if (Trim(dsMenuDataNAME.Value) = '-') then
      begin
        if (FMenuLanguage = 'THA') then
          _Item.Text := '(----ตัวแบ่งเมนู----)'
        else
        if (FMenuLanguage = 'ENG') then
          _Item.Text := '(----Menu''s Separator----)';
      end;

      New(_Data);
      _Data^ := dsMenuDataRECORD_ID.AsInteger;
      _Item.Data := _Data;

      if (_Parent_ID = PULL_DOWN_ID) then
      begin
        _Item.ImageIndex := 1;
        _Item.SelectedIndex := 1;
      end else
      begin
        if (not dsMenuDataICON.IsNull) then
        begin
          try
          dsMenuDataICON.SaveToFile('xic');
          _B.LoadFromFile('xic');

          if (_B.Width = (_B.Height * 2)) then
            _B.Width := _B.Height;

          _B.Canvas.StretchDraw(Rect(0, 0, 15, 15), _B);
          _B.Width := 16; _B.Height := 16;
          imgMenuList.Add(_B, _B);
          finally
            DeleteFile('xic')
          end;

          _Item.ImageIndex := imgMenuList.Count - 1;
          _Item.SelectedIndex := imgMenuList.Count - 1;
        end else
        begin
          _Item.ImageIndex := 2;
          _Item.SelectedIndex := 2;
        end;
      end;

      dsMenuData.Next();
    end;
  finally
    FreeAllItem(FCurrentMenuItem);
    dsMenuData.Close();
    _B.Free();
  end;
end;

//****************************************************************************//
function TfrmManager.IsAbleToRun(const _AppName: String): Boolean;
var
  _DS: TJvUIBDataSet;
begin
  _DS := TJvUIBDataSet.Create(Self);
  try
    _DS.Transaction := trnsDefault;

    _DS.SQL.Text :=
      'SELECT RESULT FROM SP_GET_PROGRAM_PERMISSION(' +
      QuotedStr(_AppName) + ')';

    _DS.Open();

    Result := (_DS.FieldByName('RESULT').AsString = 'ALLOWED');
  finally
    _DS.Free();
  end;
end;

procedure TfrmManager.SetWrkUsr(const _UserID, Job_Desc: String);
begin
  dsSQL.SQL.Text :=
    'EXECUTE PROCEDURE SP_SET_LOGGED_USER(' +
    QuotedStr(_UserID) + ', ' +
    QuotedStr(Job_Desc) + ')';

  dsSQL.ExecSQL();
end;

procedure TfrmManager.LanguageChaged(var Message: TMessage);
begin
  FMenuLanguage := GetMenuLanguage();
  LoadComponents('menuseditor.dll', Name, FMenuLanguage, Self, trnsDefault);

  if (FMenuLanguage = 'ENG') then
    tvMenus.Items[0].Text := 'Main Menu'
  else
  if (FMenuLanguage = 'THA') then
    tvMenus.Items[0].Text := 'เมนูหลัก';

  btnRefreshClick(btnRefresh);
end;

//****************************************************************************//

procedure TfrmManager.FormCreate(Sender: TObject);
const
  _Shift: array [1..5] of String =
    ('Ctrl', 'Alt', 'Shift', 'Ctrl+Alt', 'Shift+Ctrl');
  _FunctionKey: array [1..12] of String =
    ('F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12');

var
  i, j: Integer;
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  for i := 1 to 5 do
  begin
    if (i <> 3) then
      for j := Ord('A') to Ord('Z') do
        dbcShortCut.Properties.Items.Add(_Shift[i] + '+' + Chr(j));
  end;

  for i := 1 to 12 do
    dbcShortCut.Properties.Items.Add(_FunctionKey[i]);

  for i := 1 to 5 do
  begin
    for j := 1 to 12 do
      dbcShortCut.Properties.Items.Add(_Shift[i] + '+' + _FunctionKey[j]);
  end;

  WindowState := wsMaximized;
end;

procedure TfrmManager.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_LANGUAGE_CHANGED, 0, 0);

  ShowFormEx(Self);
end;

procedure TfrmManager.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmManager.btnRefreshClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    dsMenuData.Params.ByNameAsString['LANGUAGE'] := FMenuLanguage;
    dsMenuData.Open();
    LoadMenus();
    tvMenus.Items[0].Expand(True);
    if (tvMenus.Items[0].Count <> 0) then
      tvMenus.Selected := tvMenus.Items[0].Item[0];
  finally
    dsMenuData.Close();

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManager.AddNewItem(const _ParentID: Integer);
begin
  trnsDefault.StartTransaction();

  cdsMenuItem.Close();
  dsMenuItemX.Params.ByNameAsInteger['RECORD_ID'] := -1;
  cdsMenuItem.Open();
  cdsMenuItem.Append();
  cdsMenuItemRECORD_ID.Value := -1;
  cdsMenuItemPARENT_ID.AsInteger := _ParentID;

  pnMenuItemList.Enabled := False;
  tbBar.Enabled := False;

  pnEditorData.Enabled := True;

  btnEdit.Enabled := False;
  btnSave.Enabled := True;
  btnCancel.Enabled := True;

  pnEditor.Show();

  FIsAddItem := True;
end;

procedure TfrmManager.btnAddPullDownMenuClick(Sender: TObject);
var
  _T: TTreeNode;
begin
  _T := tvMenus.Items.AddChild(tvMenus.Items[0], '<New Pull-Down>');
  _T.ImageIndex := 1;
  _T.SelectedIndex := 1;

  tvMenus.Selected := _T;

  AddNewItem();
end;

procedure TfrmManager.btnAddMenuItemClick(Sender: TObject);
var
  _T: TTreeNode;
  _RCID: Integer;
begin
  if (tvMenus.Selected = tvMenus.Items[0]) then
    Exit;

  _T := tvMenus.Items.AddChild(tvMenus.Selected, '<New Menu-Item>');
  _T.ImageIndex := 2;
  _T.SelectedIndex := 2;

  _RCID := Integer(tvMenus.Selected.Data^);
  tvMenus.Selected := _T;
  AddNewItem(_RCID);
end;

procedure TfrmManager.btnDeleteMenuItemClick(Sender: TObject);
var
  _T: TTreeNode;
  _iM: Integer;
begin
  _T := tvMenus.Selected;

  _iM :=
    Application.MessageBox(
      PChar('Do you want to delete menu item "' + _T.Text + '"?'),
      'Confirm Delete', MB_YESNO or MB_ICONQUESTION);

  if (_iM = idNo) then
    Exit;

  if (_T.Data <> nil) then
  begin
    dsSQL.SQL.Text := _SQL_DELETE_MENU_ITEM_;
    dsSQL.Params.ByNameAsInteger['RECORD_ID'] := Integer(_T.Data^);
    dsSQL.ExecSQL();
    dsSQL.Close(etmCommit);

    _T.Delete();
  end else
  begin
    pnEditor.Hide();
  end;
end;

procedure TfrmManager.btnExecuteGrantManagerClick(Sender: TObject);
type
  TShowWindowType = (swNone, swModal, swNomal);

  TExecuteProgram = function(
    _MainApp: Pointer; _DBConn: TJvUIBDataBase;
    _Type: TShowWindowType; _Parameter: String): Pointer; stdcall;
var
  _Handle: THandle;
  _ExecuteProgram: TExecuteProgram;
begin
  ExecuteByName(Application.Handle, 'grantpermit.dll');
  Exit;
  
  if (IsAbleToRun('grantpermit.dll')) then
  begin
//    ShowMessage(Caption);
//    ShowMessage(Application.MainForm.Caption + ' - [Grant Manager]');
    _Handle :=
      FindWindow('TfrmGrantManager',
        'Grant Manager');
//        PChar(Application.MainForm.Caption + ' - [Grant Manager]'));
    if (_Handle <> 0) then
    begin
      BringWindowToTop(_Handle);
      Exit;
    end;

    _Handle := LoadLibrary('grantpermit.dll');
    if (_Handle <> 0) then
    begin
      SetWrkUsr('', 'Direct Execute: Grant Manager');

      _ExecuteProgram := GetProcAddress(_Handle, 'Execute');

      if(Assigned(_ExecuteProgram)) then
        _ExecuteProgram(
          nil, TJvUIBDataBase(trnsDefault.DataBase), swModal, 'MENUS');

      FreeLibrary(_Handle);
    end;
  end;
end;

procedure TfrmManager.dbeORDER_ITEMKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmManager.btnEditClick(Sender: TObject);
begin
  trnsDefault.StartTransaction();

  pnMenuItemList.Enabled := False;
  tbBar.Enabled := False;

  pnEditorData.Enabled := True;

  btnEdit.Enabled := False;
  btnSave.Enabled := True;
  btnCancel.Enabled := True;

  cdsMenuItem.Edit();
  FIsAddItem := False;
end;

procedure TfrmManager.btnSaveClick(Sender: TObject);
var
  _Node: TTreeNode;
  _RC: Integer;
  _B: TBitmap;
begin
  _RC := cdsMenuItemRECORD_ID.AsInteger;

  cdsMenuItem.Post();

  pnMenuItemList.Enabled := True;
  tbBar.Enabled := True;

  pnEditorData.Enabled := False;

  btnEdit.Enabled := True;
  btnSave.Enabled := False;
  btnCancel.Enabled := False;

  tvMenus.SetFocus();
  if (not cdsMenuItemICON.IsNull) then
  begin
    if (tvMenus.Selected.ImageIndex = 2) then
    begin
      imgMenuList.Add(dbeICON.Picture.Bitmap, Nil);
      tvMenus.Selected.ImageIndex := imgMenuList.Count - 1;
    end else
    begin
      _B := TBitmap.Create();
      try
        _B.Assign(dbeICON.Picture.Bitmap);
        if (_B.Width = _B.Height * 2) then
          _B.Width := _B.Height;

        _B.Canvas.StretchDraw(Rect(0, 0, 15, 15), _B);
        _B.Width := 16; _B.Height := 16;

        imgMenuList.Replace(
          tvMenus.Selected.ImageIndex, _B, Nil);
      finally
        _B.Free();
      end;
    end;
  end;

  LoadMenus();
  tvMenus.Items[0].Expand(True);
  _Node := GetNode(_RC);
  if (_Node <> nil) then
    tvMenus.Selected := _Node;
end;

procedure TfrmManager.btnCancelClick(Sender: TObject);
begin
  cdsMenuItem.Cancel();

  pnMenuItemList.Enabled := True;
  tbBar.Enabled := True;
  
  pnEditorData.Enabled := False;

  btnEdit.Enabled := True;
  btnSave.Enabled := False;
  btnCancel.Enabled := False;

  tvMenus.SetFocus();
  if (FIsAddItem) then
    tvMenus.Selected.Delete();

  trnsDefault.RollBack();
end;

procedure TfrmManager.btnLoadIconClick(Sender: TObject);
var
  _B: TBitmap;
  _S: TMemoryStream;
begin
  if (opDialog.Execute()) then
  begin
    dbeICON.Picture.LoadFromFile(opDialog.FileName);
    _B := TBitmap.Create();
    try
      _B.Assign(dbeICON.Picture.Bitmap);
      if (_B.Width = (_B.Height * 2)) then
        _B.Width := _B.Height;

      //_B.Canvas.StretchDraw(Rect(0, 0, 15, 15), _B);
      //_B.Width := 16; _B.Height := 16;

      //_B.TransparentMode := tmAuto;

      _S := TMemoryStream.Create();
      try
        _B.SaveToStream(_S);
        cdsMenuItemICON.LoadFromStream(_S);
      finally
        _S.Free();
      end;
    finally
      _B.Free();
    end;
  end;
end;

procedure TfrmManager.btnClearIconClick(Sender: TObject);
begin
  dbeICON.Clear();
end;

procedure TfrmManager.tvMenusChange(Sender: TObject; Node: TTreeNode);
var
  _T: TTreeNode;
begin
  cdsMenuItem.Close();

  _T := tvMenus.Selected;

  if (_T.Data <> nil) then
  begin
    dsMenuItemX.Params.ByNameAsInteger['RECORD_ID'] := Integer(_T.Data^);
    cdsMenuItem.Open();
    pnEditor.Show();
  end else
  begin
    pnEditor.Hide();
  end;
end;

procedure TfrmManager.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmManager.cdsMenuItemAfterPost(DataSet: TDataSet);
var
  _IconData: TMemoryStream;
begin
  dsSQL.SQL.Text := _SQL_UPDATE_MENU_ITEM_;

  dsSQL.Params.ByNameAsInteger['RECORD_ID'] := cdsMenuItemRECORD_ID.AsInteger;
  dsSQL.Params.ByNameAsInteger['PARENT_ID'] := cdsMenuItemPARENT_ID.AsInteger;
  dsSQL.Params.ByNameAsInteger['ORDER_ITEM'] := cdsMenuItemORDER_ITEM.AsInteger;
  dsSQL.Params.ByNameAsString['NAME_TH'] := cdsMenuItemNAME_TH.AsString;
  dsSQL.Params.ByNameAsString['NAME_EN'] := cdsMenuItemNAME_EN.AsString;
  dsSQL.Params.ByNameAsString['SHORTCUT'] := cdsMenuItemSHORTCUT.AsString;
  dsSQL.Params.ByNameAsString['APP_NAME'] := cdsMenuItemAPP_NAME.AsString;
  dsSQL.Params.ByNameAsString['PARAM_LIST'] := cdsMenuItemPARAMS.AsString;
  if (not cdsMenuItemICON.IsNull) then
  begin
    _IconData := TMemoryStream.Create();
    try
      cdsMenuItemICON.SaveToStream(_IconData);
      dsSQL.ParamsSetBlob('ICON', _IconData);
    finally
      _IconData.Free();
    end;
  end;
  dsSQL.Params.ByNameAsString['DESC_THA'] := cdsMenuItemDESC_THA.AsString;
  dsSQL.Params.ByNameAsString['DESC_ENG'] := cdsMenuItemDESC_ENG.AsString;

  dsSQL.ExecSQL();
  dsSQL.Close(etmCommit);
end;

end.
