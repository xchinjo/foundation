unit GrantManagerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, cxCheckBox, cxLookAndFeelPainters, DBClient, Provider, jvuib,
  jvuibdataset, StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Buttons, cxListBox, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, ExtCtrls, cxLookAndFeels;

{$I CRG_WM_MSG.INC}

type
  TfrmGrantManager = class(TForm)
    Splitter1: TSplitter;
    pnMenuItemList: TPanel;
    Panel4: TPanel;
    pnMenuItemEditor: TPanel;
    Panel3: TPanel;
    pnBottom: TPanel;
    lbRecord: TLabel;
    btnClose: TcxButton;
    cbPrivilagesFor: TcxComboBox;
    lbPrivilagesFor: TcxListBox;
    cbGrantsOn: TcxComboBox;
    cxgGrantObjectDBTableView: TcxGridDBTableView;
    cxgGrantObjectLevel: TcxGridLevel;
    cxgGrantObject: TcxGrid;
    mnAllowed: TcxGridDBColumn;
    dscObjectList: TDataSource;
    mnDenied: TcxGridDBColumn;
    btnGrantToAll: TSpeedButton;
    btnRevokeToAll: TSpeedButton;
    btnDenyToAll: TSpeedButton;
    mnCaption: TcxGridDBColumn;
    trnsDefault: TJvUIBTransaction;
    dsTemp: TJvUIBDataSet;
    dsObjectList: TJvUIBDataSet;
    dsObjectListUpdate: TJvUIBQuery;
    dspObjectList: TDataSetProvider;
    cdsObjectList: TClientDataSet;
    mnObjectType: TcxGridDBColumn;
    cdsObjectListRECORD_ID: TIntegerField;
    cdsObjectListOBJ_TYPE: TIntegerField;
    cdsObjectListDESCRIPTION: TStringField;
    cdsObjectListALLOWED: TIntegerField;
    cdsObjectListDENIED: TIntegerField;
    cdsObjectListOBJ_DESC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure cbPrivilagesForPropertiesChange(Sender: TObject);
    procedure lbPrivilagesForClick(Sender: TObject);
    procedure btnGrantToAllClick(Sender: TObject);
    procedure cdsObjectListAfterPost(DataSet: TDataSet);
    procedure cdsObjectListBeforeEdit(DataSet: TDataSet);
    procedure cbGrantsOnPropertiesChange(Sender: TObject);
    procedure cdsObjectListCalcFields(DataSet: TDataSet);
  private
    FUserIndex: Integer;
    FRoleIndex: Integer;
    FMenuLanguage: String;

    procedure LanguageChaged(var Message: TMessage); message WM_LANGUAGE_CHANGED;
  public
    { Public declarations }
  end;

var
  frmGrantManager: TfrmGrantManager;

implementation

uses crgsec, fbconnection, crgextfunc, fshow, crglangmgr;

{$R *.dfm}

procedure TfrmGrantManager.LanguageChaged(var Message: TMessage);
begin
  FMenuLanguage := GetMenuLanguage();
  LoadComponents('grantpermit.dll', Name, FMenuLanguage, Self, trnsDefault);

  cbPrivilagesFor.Properties.Items.Clear();
  cbGrantsOn.Properties.Items.Clear();
  if (FMenuLanguage = 'ENG') then
  begin
    cbPrivilagesFor.Properties.Items.Add('Roles');
    cbPrivilagesFor.Properties.Items.Add('Users');

    cbGrantsOn.Properties.Items.Add('All Objects');
    cbGrantsOn.Properties.Items.Add('Menus');
    cbGrantsOn.Properties.Items.Add('Organize Chart');
  end else
  if (FMenuLanguage = 'THA') then
  begin
    cbPrivilagesFor.Properties.Items.Add('กลุ่มผู้ใช้งาน');
    cbPrivilagesFor.Properties.Items.Add('ผู้ใช้งาน');

    cbGrantsOn.Properties.Items.Add('ทั้งหมด (ทุกออบเจคต์)');
    cbGrantsOn.Properties.Items.Add('รายการเมนู');
    cbGrantsOn.Properties.Items.Add('โครงสร้างองค์กร');
  end;

  cbPrivilagesFor.ItemIndex := 1;

  cbGrantsOn.ItemIndex := 0;
  dsObjectList.Params.ByNameAsString['LANGUAGE'] := FMenuLanguage;

  lbPrivilagesFor.ItemIndex := 0;
  lbPrivilagesFor.SetFocus();
  lbPrivilagesForClick(lbPrivilagesFor);
end;

procedure TfrmGrantManager.FormCreate(Sender: TObject);
begin
  Left := 0; Top := 0;
  WindowState := wsMaximized;

  FUSerIndex := 0;
  FRoleIndex := 0;
end;

procedure TfrmGrantManager.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_LANGUAGE_CHANGED, 0, 0);
  ShowFormEx(Self);
end;

procedure TfrmGrantManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmGrantManager.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmGrantManager.cbPrivilagesForPropertiesChange(
  Sender: TObject);
begin
  if (cbPrivilagesFor.ItemIndex = 1) then
    dsTemp.SQL.Text := 'SELECT NAME FROM SP_GET_USER_LIST(1)'
  else
    dsTemp.SQL.Text := 'SELECT NAME FROM SP_GET_ROLE_LIST';
    
  try
    dsTemp.Open();
    LoadDBToList(dsTemp, lbPrivilagesFor.Items, ['NAME']);
    if (cbPrivilagesFor.ItemIndex = 1) then
      lbPrivilagesFor.ItemIndex := FUSerIndex
    else
      lbPrivilagesFor.ItemIndex := FRoleIndex;
  finally
    dsTemp.Close();
  end;

  lbPrivilagesForClick(lbPrivilagesFor);
end;

procedure TfrmGrantManager.lbPrivilagesForClick(Sender: TObject);
begin
  if ((cdsObjectList.Active) and (cdsObjectList.State = dsEdit)) then
    cdsObjectList.Post();

  cdsObjectList.Close();

  dsObjectList.Params.ByNameAsInteger['USER_ROLE_INC'] := cbPrivilagesFor.ItemIndex;
  dsObjectList.Params.ByNameAsString['REF_NAME'] :=
    lbPrivilagesFor.Items[lbPrivilagesFor.ItemIndex];
  dsObjectList.Params.ByNameAsInteger['OBJECT_TYPE'] := cbGrantsOn.ItemIndex;
  dsObjectList.Params.ByNameAsString['LANGUAGE'] := FMenuLanguage;

  dsObjectListUpdate.Params.ByNameAsInteger['USER_ROLE_INC'] := cbPrivilagesFor.ItemIndex;
  dsObjectListUpdate.Params.ByNameAsString['REF_NAME'] :=
    lbPrivilagesFor.Items[lbPrivilagesFor.ItemIndex];

  cdsObjectList.Open();

  { Remember privillages for whom }
  if (cbPrivilagesFor.ItemIndex = 1) then
    FUSerIndex := lbPrivilagesFor.ItemIndex
  else
    FRoleIndex := lbPrivilagesFor.ItemIndex;
end;

procedure TfrmGrantManager.btnGrantToAllClick(Sender: TObject);
var
  _RC: Integer;
  _Allowed, _Denied: Integer;
begin
  Screen.Cursor := crSQLWait;
  trnsDefault.StartTransaction();
  try
    _RC := cdsObjectListRECORD_ID.AsInteger;
    if ((Sender as TSpeedButton).Tag < 2) then
    begin
      _Allowed := (Sender as TSpeedButton).Tag;
      _Denied := 0;
    end else
    begin
      _Allowed := 0;
      _Denied := 1;
    end;
    cdsObjectList.First();
    while (not cdsObjectList.Eof) do
    begin
      cdsObjectList.Edit();
      cdsObjectListALLOWED.Value := _Allowed;
      cdsObjectListDENIED.Value := _Denied;
      cdsObjectList.Post();

      cdsObjectList.Next();
    end;
    trnsDefault.Commit();
    cdsObjectList.Locate('RECORD_ID', _RC, []);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGrantManager.cdsObjectListAfterPost(DataSet: TDataSet);
begin
  dsObjectListUpdate.Params.ByNameAsInteger['OBJECT_TYPE'] :=
    cdsObjectListOBJ_TYPE.Value;
  dsObjectListUpdate.Params.ByNameAsInteger['RECORD_ID'] :=
    cdsObjectListRECORD_ID.AsInteger;
  dsObjectListUpdate.Params.ByNameAsInteger['ALLOWED'] :=
    cdsObjectListALLOWED.AsInteger;
  dsObjectListUpdate.Params.ByNameAsInteger['DENIED'] :=
    cdsObjectListDENIED.AsInteger;

  dsObjectListUpdate.ExecSQL();
  dsObjectListUpdate.Close(etmCommit);
end;


procedure TfrmGrantManager.cdsObjectListBeforeEdit(DataSet: TDataSet);
begin
  trnsDefault.StartTransaction();
end;

procedure TfrmGrantManager.cbGrantsOnPropertiesChange(Sender: TObject);
begin
  cbPrivilagesForPropertiesChange(cbGrantsOn);
end;

procedure TfrmGrantManager.cdsObjectListCalcFields(DataSet: TDataSet);
begin
  if (FMenuLanguage = 'ENG') then
  begin
    if (cdsObjectListOBJ_TYPE.Value = 0) then
      cdsObjectListOBJ_DESC.Value := ' Menus'
    else
    if (cdsObjectListOBJ_TYPE.Value = 1) then
      cdsObjectListOBJ_DESC.Value := ' Organization';
  end else
  if (FMenuLanguage = 'THA') then
  begin
    if (cdsObjectListOBJ_TYPE.Value = 0) then
      cdsObjectListOBJ_DESC.Value := ' รายการเมนู'
    else
    if (cdsObjectListOBJ_TYPE.Value = 1) then
      cdsObjectListOBJ_DESC.Value := 'โครงสร้างองค์กร';
  end
end;

end.
