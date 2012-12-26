unit MainUserForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxLookAndFeelPainters, DB, jvuib, jvuibdataset, DBClient, Provider,
  ImgList, cxSpinEdit, cxTimeEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxMemo, cxMaskEdit, ExtCtrls, StdCtrls, Grids, DBGrids, cxCheckBox,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, ComCtrls,
  cxGraphics, cxLookAndFeels;

{$I CRG_WM_MSG.INC}

type
  TUserAction = (uaAdd, uaEdit, uaView);
  
  TfrmMainUser = class(TForm)
    pcPage: TPageControl;
    tsUserList: TTabSheet;
    Panel1: TPanel;
    lbSearchText: TLabel;
    edSearchText: TcxTextEdit;
    btnSearch: TcxButton;
    cbFilter: TcxCheckBox;
    dbgList: TDBGrid;
    Panel2: TPanel;
    lbRecord: TLabel;
    btnClose: TcxButton;
    btnNew: TcxButton;
    btnEdit: TcxButton;
    btnDelete: TcxButton;
    tsUserInfo: TTabSheet;
    gbUserInfo: TGroupBox;
    Panel3: TPanel;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    btnClearPassword: TcxButton;
    Bevel2: TBevel;
    imgList: TImageList;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label5: TLabel;
    pnAdvanceInfo: TPanel;
    Label9: TLabel;
    Image3: TImage;
    Bevel3: TBevel;
    gbBasicInfo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbCompanyCode: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    lbBranchCode: TLabel;
    dbeUserID: TcxDBTextEdit;
    cbCompany: TcxComboBox;
    dbmDesc: TcxDBMemo;
    cbBranch: TcxComboBox;
    cbRole: TcxComboBox;
    cbStatus: TcxComboBox;
    dbdFrom: TcxDBDateEdit;
    dbdThru: TcxDBDateEdit;
    gbAccesTime: TGroupBox;
    gbTime: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    cbDay1: TcxCheckBox;
    cbDay2: TcxCheckBox;
    cbDay3: TcxCheckBox;
    cbDay4: TcxCheckBox;
    cbDay5: TcxCheckBox;
    cbDay6: TcxCheckBox;
    cbDay7: TcxCheckBox;
    edFromTime1: TcxTimeEdit;
    edToTime1: TcxTimeEdit;
    edFromTime2: TcxTimeEdit;
    edToTime2: TcxTimeEdit;
    edFromTime3: TcxTimeEdit;
    edToTime3: TcxTimeEdit;
    edFromTime4: TcxTimeEdit;
    edToTime4: TcxTimeEdit;
    edFromTime5: TcxTimeEdit;
    edToTime5: TcxTimeEdit;
    edFromTime6: TcxTimeEdit;
    edToTime6: TcxTimeEdit;
    edFromTime7: TcxTimeEdit;
    edToTime7: TcxTimeEdit;
    cbUseSeflAccessRule: TcxCheckBox;
    dscUserList: TDataSource;
    dscUser: TDataSource;
    dspUserList: TDataSetProvider;
    cdsUserList: TClientDataSet;
    cdsUserListSTATUS: TStringField;
    cdsUserListCOMPANY: TStringField;
    cdsUserListBRANCH: TStringField;
    cdsUserListUSER_ID: TStringField;
    cdsUserListDESCRIPTION: TStringField;
    trnsDefault: TJvUIBTransaction;
    dsUserList: TJvUIBDataSet;
    dsTemp: TJvUIBDataSet;
    dsUser: TJvUIBDataSet;
    dsUpdateSQL: TJvUIBQuery;
    dspUser: TDataSetProvider;
    cdsUser: TClientDataSet;
    cdsUserRECORD_ID: TIntegerField;
    cdsUserSTATUS: TSmallintField;
    cdsUserCOMPANY_CODE: TIntegerField;
    cdsUserBRANCH_CODE: TIntegerField;
    cdsUserUSER_ID: TStringField;
    cdsUserUSER_PWD: TStringField;
    cdsUserDESCRIPTION: TStringField;
    cdsUserVALID_FROM: TDateField;
    cdsUserVALID_THRU: TDateField;
    cdsUserUSE_SELF_ACCESS_RULE: TIntegerField;
    btnEdit2: TcxButton;
    cdsUserOFFICER_ID: TIntegerField;
    cdsUserROLE_ID: TIntegerField;
    gbMoreInfo: TGroupBox;
    lbPosition: TLabel;
    lbDepartment: TLabel;
    lbPhoneNo: TLabel;
    dcbPosition: TcxComboBox;
    dcbDepartment: TcxComboBox;
    dbePhoneNo: TcxDBTextEdit;
    lbPhoneExt: TLabel;
    dbePhoneExt: TcxDBTextEdit;
    lbRemark: TLabel;
    Image4: TImage;
    lbUsageInfo: TLabel;
    gbUsage: TGroupBox;
    lbFirstSignedOn: TLabel;
    lbLasSignedOn: TLabel;
    lbLastActivity: TLabel;
    lbLastApplication: TLabel;
    dbdFirstSignedOn: TcxDBDateEdit;
    dbdLasSignedOn: TcxDBDateEdit;
    dbeLastActivity: TcxDBTextEdit;
    dbeLastApplication: TcxDBTextEdit;
    dbmRemark: TcxDBMemo;
    btnMoreAccessInfo: TcxButton;
    cdsUserFIRST_SIGNED_ON_DATE: TDateField;
    cdsUserLAST_SIGNED_ON_DATE: TDateField;
    cdsUserLAST_ACTIVITY: TStringField;
    cdsUserLAST_APPLICATION: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgListDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgListKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSearchTextKeyPress(Sender: TObject; var Key: Char);
    procedure cbFilterClick(Sender: TObject);
    procedure cbCompanyPropertiesChange(Sender: TObject);
    procedure pcPageChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnClearPasswordClick(Sender: TObject);
    procedure cdsUserAfterPost(DataSet: TDataSet);
    procedure cbNotSpecificPropertiesChange(Sender: TObject);
    procedure cbCompanyKeyPress(Sender: TObject; var Key: Char);
    procedure btnEdit2Click(Sender: TObject);
    procedure btnMoreAccessInfoClick(Sender: TObject);
  private
    FMenuLanguage: String;
    FOldWidth: Integer;
    FFirstSearch: Boolean;

    FFromTime: TTime;
    FToTime: TTime;

    FUserID: String;
    procedure LanguageChaged(var Message: TMessage); message WM_LANGUAGE_CHANGED;
    procedure LoadUserList();
  public
    UserAction: TUserAction;

    function ExecSQL(const _CommanText: String): Boolean;

    procedure ClearDays();
    procedure LoadUserAccessTime();
    procedure LoadUserInfo();

    procedure SaveUserAccessTime();
    procedure SaveUserInfo();
  end;

var
  frmMainUser: TfrmMainUser;

implementation

uses fbconnection, crgextfunc, fbuserman, fshow, crglangmgr, dlgbox;

{$R *.dfm}

resourcestring
  _rsCaption = 'CRG User Manager';
  _rsNew = ' - Add New User';
  _rsEdit = ' - Edit Current User';
  _rsView = ' - View Current User';

  _SQL_SELECT_TIME_ =
    'SELECT ' +
    '  DAY_ITEM, ' +
    '  FROM_TIME, ' +
    '  TO_TIME ' +
    'FROM ' +
    '  SP_GET_USER_SCHEDULED(:PARENT_ID)';

  _SQL_SELECT_ACC_TIME_DEFAULT_ =
    'SELECT ' +
    '  FROM_TIME, ' +
    '  TO_TIME ' +
    'FROM ' +
    '  SP_GET_DEFAULT_ACC_TIME_VALUE';

  _SQL_INSERT_UPDATE_TIME_ =
    'EXECUTE PROCEDURE SP_INSERT_UPDATE_USER_SCHEDULED( ' +
    ' 1, :OWNER_ID, :DAY_ITEM, :FROM_TIME, :TO_TIME)';

  _SQL_DELETE_TIME_ =
    'EXECUTE PROCEDURE SP_DELETE_USER_SCHEDULED(1, :OWNER_ID)';

  _SQL_UPDATE_USER_INFO_ =
    'EXECUTE PROCEDURE SP_INSERT_UPDATE_USER( ' +
    '  :STATUS, ' +
    '  :ORG_CODE, ' +
    '  :ROLE_ID, ' +
    '  :OFFICER_ID, ' +
    '  :USER_ID, ' +
    '  :USER_PWD, ' +
    '  :DESCRIPTION, ' +
    '  :VALID_FROM, ' +
    '  :VALID_THRU)';

function TfrmMainUser.ExecSQL(const _CommanText: String): Boolean;
begin
  Result := True;
  dsUpdateSQL.SQL.Text := _CommanText;
  try
    dsUpdateSQL.ExecSQL();
    dsUpdateSQL.Close(etmCommit);
  except
    Result := False;
  end;
end;

procedure TfrmMainUser.ClearDays();
var
  _Day: TcxCheckBox;
  _Time: TcxTimeEdit;
  i: Integer;
begin
  for i := 1 to 7 do
  begin
    _Day := FindComponent('cbDay' + IntToStr(i)) as TcxCheckBox;
    _Day.Checked := False;
    _Time := FindComponent('edFromTime' + IntToStr(i)) as TcxTimeEdit;
    _Time.Time := FFromTime;
    _Time := FindComponent('edToTime' + IntToStr(i)) as TcxTimeEdit;
    _Time.Time := FToTime;
  end;
end;

procedure TfrmMainUser.LoadUserAccessTime();
var
  _Day: TcxCheckBox;
  _Time: TcxTimeEdit;
begin
  dsTemp.SQL.Text := _SQL_SELECT_TIME_;

  dsTemp.Params.ByNameAsInteger['PARENT_ID'] :=
    cdsUserRECORD_ID.AsInteger;

  dsTemp.Open();
  try
    cbUseSeflAccessRule.Checked := (cdsUserUSE_SELF_ACCESS_RULE.Value = 1);
    while (not dsTemp.Eof) do
    begin
      _Day :=
        FindComponent('cbDay' + dsTemp.FieldByName('DAY_ITEM').AsString) as
        TcxCheckBox;

      if (_Day <> nil) then
        _Day.Checked := True;

      _Time :=
        FindComponent('edFromTime' + dsTemp.FieldByName('DAY_ITEM').AsString) as
        TcxTimeEdit;

      if (_Time <> nil) then
        _Time.Time := TTime(dsTemp.FieldByName('FROM_TIME').AsDateTime);

      _Time :=
        FindComponent('edToTime' + dsTemp.FieldByName('DAY_ITEM').AsString) as
        TcxTimeEdit;

      if (_Time <> nil) then
        _Time.Time := TTime(dsTemp.FieldByName('TO_TIME').AsDateTime);

      dsTemp.Next();
    end;
  finally
    dsTemp.Close();
  end;
end;

procedure TfrmMainUser.LoadUserInfo();
begin
  ClearDays();

  cdsUser.Close();
  if (UserAction = uaAdd) then
  begin
    dbeUserID.Enabled := True;
    cbCompany.ItemIndex := 0;
    cbRole.ItemIndex := -1;
    cbStatus.ItemIndex := 0;
    cbStatus.Enabled := False;
    dsUser.Params.ByNameAsString['UID'] := '';
    cdsUser.Open();
    if (cdsUser.IsEmpty) then
      cdsUser.Append();

    gbAccesTime.Enabled := False;
  end else
  if (UserAction in [uaEdit, uaView]) then
  begin
    dbeUserID.Enabled := False;
    dsUser.Params.ByNameAsString['UID'] := cdsUserListUSER_ID.Value;
    cdsUser.Open();
    cbCompany.ItemIndex :=
      FindSubStrInList(
        IntToStr(cdsUserCOMPANY_CODE.Value),
        cbCompany.Properties.Items);
    if (cbCompany.ItemIndex <> -1) then
    begin
      cbBranch.ItemIndex :=
        FindSubStrInList(
         IntToStr(cdsUserBRANCH_CODE.Value),
         cbBranch.Properties.Items);
    end;
    cbRole.ItemIndex :=
      FindSubStrInList(
        IntToStr(cdsUserROLE_ID.AsInteger),
        cbRole.Properties.Items);
    cbStatus.ItemIndex :=
      FindSubStrInList(
        IntToStr(cdsUserSTATUS.Value),
        cbStatus.Properties.Items);
    if (UserAction = uaEdit) then
      cdsUser.Edit();

    LoadUserAccessTime();
  end;

  gbUserInfo.Enabled := (UserAction <> uaView);
  btnSave.Enabled := gbUserInfo.Enabled;
  if (btnSave.Enabled) then
    btnClearPassword.Enabled := (not cdsUserUSER_PWD.IsNull)
  else
    btnClearPassword.Enabled := False;

  btnEdit2.Visible := ((UserAction = uaView) and (not cdsUser.IsEmpty));
end;

procedure TfrmMainUser.SaveUserAccessTime();
var
  _Day: TcxCheckBox;
  _Time: TcxTimeEdit;
  i: Integer;
begin
  trnsDefault.StartTransaction();
  try
    dsUpdateSQL.SQL.Text := _SQL_DELETE_TIME_;
    dsUpdateSQL.Params.ByNameAsInteger['OWNER_ID'] :=
      cdsUserRECORD_ID.AsInteger;
    dsUpdateSQL.ExecSQL();
    dsUpdateSQL.Close(etmCommit);

    if (cbUseSeflAccessRule.Checked) then
    begin
      dsUpdateSQL.SQL.Text := _SQL_INSERT_UPDATE_TIME_;
      for i := 1 to 7 do
      begin
        _Day := FindComponent('cbDay' + IntToStr(i)) as TcxCheckBox;
        if (_Day.Checked) then
        begin
          dsUpdateSQL.Params.ByNameAsInteger['OWNER_ID'] :=
            cdsUserRECORD_ID.AsInteger;
          dsUpdateSQL.Params.ByNameAsInteger['DAY_ITEM'] := i;
          _Time := FindComponent('edFromTime' + IntToStr(i)) as TcxTimeEdit;
          dsUpdateSQL.Params.ByNameAsDateTime['FROM_TIME'] := _Time.Time;
          _Time := FindComponent('edToTime' + IntToStr(i)) as TcxTimeEdit;
          dsUpdateSQL.Params.ByNameAsDateTime['TO_TIME'] := _Time.Time;

          dsUpdateSQL.ExecSQL();
          dsUpdateSQL.Close(etmCommit);
        end;
      end;
    end;
  finally
    if (trnsDefault.InTransaction) then
      trnsDefault.Commit();
  end;
end;

procedure TfrmMainUser.SaveUserInfo();
begin
  trnsDefault.StartTransaction();
  try
    dsUpdateSQL.SQL.Text := _SQL_UPDATE_USER_INFO_;

    dsUpdateSQL.Params.ByNameAsInteger['STATUS'] := cdsUserSTATUS.Value;
    dsUpdateSQL.Params.ByNameAsInteger['ORG_CODE'] := cdsUserBRANCH_CODE.Value;
    dsUpdateSQL.Params.ByNameAsInteger['ROLE_ID'] := cdsUserROLE_ID.Value;
    if (not cdsUserOFFICER_ID.IsNull) then
      dsUpdateSQL.Params.ByNameAsInteger['OFFICER_ID'] := cdsUserOFFICER_ID.Value;      
    dsUpdateSQL.Params.ByNameAsString['USER_ID'] := cdsUserUSER_ID.Value;
    if (not cdsUserUSER_PWD.IsNull) then
      dsUpdateSQL.Params.ByNameAsString['USER_PWD'] := cdsUserUSER_PWD.Value;
    dsUpdateSQL.Params.ByNameAsString['DESCRIPTION'] := cdsUserDESCRIPTION.Value;
    if (not cdsUserVALID_FROM.IsNull) then
      dsUpdateSQL.Params.ByNameAsDate['VALID_FROM'] := cdsUserVALID_FROM.AsVariant;
    if (not cdsUserVALID_THRU.IsNull) then
      dsUpdateSQL.Params.ByNameAsDate['VALID_THRU'] := cdsUserVALID_THRU.AsVariant;

    dsUpdateSQL.ExecSQL();
    dsUpdateSQL.Close(etmCommit);
  except
    trnsDefault.RollBack();
  end;
end;

procedure TfrmMainUser.LanguageChaged(var Message: TMessage);
begin
  FMenuLanguage := GetMenuLanguage();
  LoadComponents('usrman.dll', Name, FMenuLanguage, Self, trnsDefault);
//  SaveComponents('usrman.dll', Name, 'ENG', Self, trnsDefault);

  LoadUserList();

  dsTemp.SQL.Text :=
    'SELECT CODE, NAME FROM SP_GET_COMPANY_LIST(' + QuotedStr(FMenuLanguage) + ')';

  LoadDBToList(dsTemp, cbCompany.Properties.Items, ['CODE', 'NAME']);
  cbCompany.ItemIndex := 0;
end;

procedure TfrmMainUser.LoadUserList();
var
  _UserID: String;
begin
    cdsUserList.Close();
  dsUserList.Params.ByNameAsString['LANGUAGE'] := FMenuLanguage;

  if (cdsUserList.Active) then
    _UserID := cdsUserListUSER_ID.Value
  else
    _UserID := '';

  cdsUserList.Open();

  if (_UserID <> '') then
    cdsUserList.Locate('USER_ID', _UserID, []);

  if (FMenuLanguage = 'THA') then
    lbRecord.Caption :=
      Format('พบ %.0n ผู้ใช้งาน', [cdsUserList.RecordCount / 1])
  else
  if (FMenuLanguage = 'ENG') then
    lbRecord.Caption :=
      Format('%.0n user(s) found.', [cdsUserList.RecordCount / 1]);

  btnEdit.Enabled := (not cdsUserList.IsEmpty());
  btnDelete.Enabled := btnEdit.Enabled;
end;

procedure TfrmMainUser.FormCreate(Sender: TObject);
begin
  FOldWidth := dbgList.Width;

  FFirstSearch := True;
  Caption := _rsCaption;

  UserAction := uaView;

  WindowState := wsMaximized;
end;

procedure TfrmMainUser.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_LANGUAGE_CHANGED, 0, 0);
  LoadUserList();
  
  pcPage.ActivePage := tsUserList;
  dsTemp.SQL.Text := _SQL_SELECT_ACC_TIME_DEFAULT_;
  try
    dsTemp.Open();
    try
      FFromTime := TTime(dsTemp.FieldByName('FROM_TIME').AsDateTime);
      FToTime := TTime(dsTemp.FieldByName('TO_TIME').AsDateTime);
    except
      FFromTime := StrToTime('00:00:00');
      FToTime := StrToTime('00:00:00');
    end;
  finally
    dsTemp.Close();
  end;

  dsTemp.SQL.Text :=
    'SELECT CODE, NAME FROM SP_GET_ROLE_LIST';
  LoadDBToList(dsTemp, cbRole.Properties.Items, ['CODE', 'NAME']);

  ShowFormEx(Self);
end;

procedure TfrmMainUser.btnNewClick(Sender: TObject);
begin
  Caption := _rsCaption + _rsNew;
  UserAction := uaAdd;
  pcPage.ActivePage := tsUserInfo;
  tsUserList.Enabled := False;
  
  LoadUserInfo();
end;

procedure TfrmMainUser.btnEditClick(Sender: TObject);
begin
  FUserID := cdsUserListUSER_ID.Value;
  Caption := _rsCaption + _rsEdit;
  UserAction := uaEdit;
  pcPage.ActivePage := tsUserInfo;
  LoadUserInfo();
  tsUserList.Enabled := False;
end;

procedure TfrmMainUser.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmMainUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainUser.dbgListDblClick(Sender: TObject);
begin
  if (not btnEdit.Enabled) then
    Exit;

  userAction := uaView;
  Caption := _rsCaption + _rsView;
  pcPage.ActivePage := tsUserInfo;

  LoadUserInfo();
end;

procedure TfrmMainUser.btnDeleteClick(Sender: TObject);
var
  _UserId: String;
begin
  _UserId := cdsUserListUSER_ID.Value;

  if (UpperCase(Trim(_UserId)) = 'ADMIN') then
  begin
    MsgDlgBox(TApplication(Self.Owner),
      'Built-in administrator user could not be deleted.',
      dtError, btOk, FMenuLanguage);

    Exit;
  end;

  if (Application.MessageBox(PChar('Do you want to delete user: ' +
      cdsUserListUSER_ID.Value + '?'),
    'Confirm', MB_YESNO or MB_ICONQUESTION) = idYes) then
  begin
    trnsDefault.StartTransaction();
    try
      ExecSQL(
        'DELETE FROM TB_USERS ' +
        'WHERE (USER_ID = ' + QuotedStr(_UserId) + ')');
      DeleteUser(_UserId);
      trnsDefault.Commit();
    except
      trnsDefault.RollBack();
    end;

    LoadUserList();
  end;
end;

procedure TfrmMainUser.btnSearchClick(Sender: TObject);
begin
  if (Trim(edSearchText.Text) = '') then
    Exit;

  cdsUserList.Filter :=
    'STATUS LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'COMPANY LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'BRANCH LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'USER_ID LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%') + ' OR ' +
    'DESCRIPTION LIKE ' + QuotedStr('%' + Trim(edSearchText.Text) + '%');

  if (cbFilter.Checked) then
  begin
    cdsUserList.Filtered := True;
  end else
  if (FFirstSearch) then
  begin
    if (cdsUserList.FindFirst()) then
    begin
      dbgList.SetFocus();
      FFirstSearch := False
    end else
      Application.MessageBox(
        'ไม่พบข้อมูลที่ต้องการค้นหา',
        'Message', MB_OK or MB_ICONINFORMATION);
  end else
  begin
    if (not cdsUserList.FindNext()) then
    begin
      if (Application.MessageBox(
            'การค้นหามาถึงเรคอร์ดสุดท้ายแล้ว คุณต้องการเริ่มต้นค้นใหม่หรือเปล่า?',
            'Message', MB_YESNO or MB_ICONINFORMATION) = idYes) then
        FFirstSearch := True;
    end else
      dbgList.SetFocus();
  end;
end;

procedure TfrmMainUser.dbgListKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    dbgListDblClick(dbgList);
  end;
end;

procedure TfrmMainUser.FormResize(Sender: TObject);
var
  _Delta, _ChangeSize, i: Integer;
  _PercentChange: Double;
begin
  _Delta := dbgList.Width - FOldWidth;
  if (_Delta = 0) then
    Exit;

  for i := 0 to (dbgList.Columns.Count - 1) do
  begin
    _PercentChange := Round(dbgList.Columns[i].Width / (FOldWidth / 100));
    _ChangeSize := Round((_Delta / 100) * _PercentChange);

    dbgList.Columns[i].Width := dbgList.Columns[i].Width + _ChangeSize;
  end;

  FOldWidth := dbgList.Width;
end;

procedure TfrmMainUser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F7) then
    btnSearchClick(btnSearch);
end;

procedure TfrmMainUser.edSearchTextKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    btnSearchClick(btnSearch);
  end;
end;

procedure TfrmMainUser.cbFilterClick(Sender: TObject);
begin
  if (cbFilter.Checked) then
    btnSearchClick(btnSearch)
  else
    cdsUserList.Filtered := False;

  FFirstSearch := True;
end;

procedure TfrmMainUser.cbCompanyPropertiesChange(Sender: TObject);
begin
  dsTemp.SQL.Text :=
    'SELECT CODE, NAME FROM SP_GET_BRANCH_LIST(' +
    GetStrCode(cbCompany.Text) + ', ' + QuotedStr(FMenuLanguage) +  ')';

  LoadDBToList(dsTemp, cbBranch.Properties.Items, ['CODE', 'NAME']);
  cbBranch.ItemIndex := 0;
end;

procedure TfrmMainUser.pcPageChange(Sender: TObject);
begin
  if (pcPage.ActivePage = tsUserList) then
  begin
    if (cdsUser.State in [dsEdit, dsInsert]) then
      cdsUser.Cancel();

    cdsUser.Close();
    Caption := _rsCaption;

    LoadUserList();
  end else
  if (pcPage.ActivePage = tsUserInfo) then
  begin
    if (tsUserList.Enabled) then
      dbgListDblClick(dbgList);
  end;
end;

procedure TfrmMainUser.btnSaveClick(Sender: TObject);
begin
  if (cbStatus.ItemIndex <> -1) then
    cdsUserSTATUS.Value := StrToInt(GetStrCode(cbStatus.Text, '-'));
  if (cbCompany.ItemIndex <> -1) then
    cdsUserCOMPANY_CODE.Value  := StrToInt(GetStrCode(cbCompany.Text));
  if (cbBranch.ItemIndex <> -1) then
    cdsUserBRANCH_CODE.Value  := StrToInt(GetStrCode(cbBranch.Text));
  if (cbRole.ItemIndex <> -1) then
    cdsUserROLE_ID.AsInteger  := StrToInt(GetStrCode(cbRole.Text));

  cdsUser.Post();

  if (UserAction = uaAdd) then
  begin
    FUserID := Trim(dbeUserID.Text);
    AddUser(
      cdsUserUSER_ID.Value,
      cdsUserUSER_ID.Value,
      cdsUserUSER_ID.Value,
      '', '');
  end;

  cdsUserList.Close();
  cdsUserList.Open();
  if (UserAction = uaEdit) then
    cdsUserList.Locate('USER_ID', FUserID, []);

  tsUserList.Enabled := True;
  pcPage.ActivePageIndex := 0;
  UserAction := uaView;
end;

procedure TfrmMainUser.btnCancelClick(Sender: TObject);
begin
  cdsUser.Cancel();
  tsUserList.Enabled := True;
  pcPage.ActivePageIndex := 0;
  UserAction := uaView;
end;

procedure TfrmMainUser.btnClearPasswordClick(Sender: TObject);
var
  _Msg, _Caption: String;
begin
  if (FMenuLanguage = 'ENG') then
  begin
    _Caption := 'Confirm';
    _Msg := 'Do you want to clear password for current user?';
  end else
  if (FMenuLanguage = 'THA') then
  begin
    _Caption := 'ยืนยัน';
    _Msg := 'คุณต้องการลบรหัสผ่านของผู้ใช้งานปัจจุบันหรือเปล่า?';
  end;

  if (Application.MessageBox(
    PChar(_Msg), PChar(_Caption), MB_YESNO or MB_ICONQUESTION) = idYes) then
  begin
    cdsUserUSER_PWD.Clear();
    btnClearPassword.Enabled := False;
  end;
end;

procedure TfrmMainUser.cdsUserAfterPost(DataSet: TDataSet);
begin
  SaveUserInfo();
  SaveUserAccessTime();
end;

procedure TfrmMainUser.cbNotSpecificPropertiesChange(Sender: TObject);
begin
  gbTime.Enabled := (cbUseSeflAccessRule.Checked);
  if (gbTime.Enabled) then
  begin
    if (cdsUserUSE_SELF_ACCESS_RULE.Value = 1) then
      LoadUserAccessTime()
    else
      ClearDays();
  end else
  begin
    if (cdsUserUSE_SELF_ACCESS_RULE.Value = 0) then
      LoadUserAccessTime()
    else
      ClearDays();
  end;
end;

procedure TfrmMainUser.cbCompanyKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmMainUser.btnEdit2Click(Sender: TObject);
begin
  btnEditClick(btnEdit2);
end;

procedure TfrmMainUser.btnMoreAccessInfoClick(Sender: TObject);
begin
  Application.MessageBox(
    PChar(
      'The CRG History Log for NGF modules must be installed ' +
      'before starting this option.'#10#13 +
      'Therefor above, check your installation and license to ensure you have been granted with this module.'#10#10#13 +
      'If you were granted and this your first experienced problem contract your program vendor.'),
    'System Warning', MB_OK or MB_ICONWARNING);
end;

end.
