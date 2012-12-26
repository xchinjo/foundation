unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, jvuib, ComCtrls;

type
  TfrmMain = class(TForm)
    gbGroup: TGroupBox;
    dbcConnection: TJvUIBDataBase;
    stbStatus: TStatusBar;
    Label1: TLabel;
    edDefaultServerName: TEdit;
    Label2: TLabel;
    edDefaultDatabaseName: TEdit;
    Label3: TLabel;
    edDefaultUserName: TEdit;
    Label4: TLabel;
    edDefaultPassword: TEdit;
    Label9: TLabel;
    edDefaultConfrimPassword: TEdit;
    Label5: TLabel;
    Label17: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    edCtrlServerNamse: TEdit;
    Label7: TLabel;
    edCtrlDatabaseName: TEdit;
    Label8: TLabel;
    edCtrlUserName: TEdit;
    Label14: TLabel;
    edCtrlPassword: TEdit;
    Label15: TLabel;
    edCtrlConfirmPassword: TEdit;
    Label10: TLabel;
    edSecurityUserName: TEdit;
    Label11: TLabel;
    edSecurityPassword: TEdit;
    Label13: TLabel;
    edSecurityConfirmPassword: TEdit;
    Label16: TLabel;
    Label18: TLabel;
    edManagerUserName: TEdit;
    Label19: TLabel;
    edManagerPassword: TEdit;
    Label20: TLabel;
    edManagerConfirmPassword: TEdit;
    btnSave: TButton;
    btnReload: TButton;
    btnTest: TButton;
    btnClose: TButton;
    btnAbout: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stbStatusHint(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure edDefaultServerNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAboutClick(Sender: TObject);
  private
    FChanged: Boolean;

    procedure DisableEditOnChange();
    procedure EnableEditOnChange();
  public
    procedure LoadFromFile();
    procedure SaveToFile();
  end;

var
  frmMain: TfrmMain;

implementation

uses fbconnection, crgsec, fctrlversion;

{$R *.dfm}

procedure TfrmMain.DisableEditOnChange();
var
  i: Integer;
begin
  for i := 0 to (gbGroup.ControlCount - 1) do
  begin
    if (gbGroup.Controls[i] is TEdit) then
    begin
      (gbGroup.Controls[i] as TEdit).OnChange := nil;
      (gbGroup.Controls[i] as TEdit).Font.Style := []; 
    end;
  end;
end;

procedure TfrmMain.EnableEditOnChange();
var
  i: Integer;
begin
  for i := 0 to (gbGroup.ControlCount - 1) do
  begin
    if (gbGroup.Controls[i] is TEdit) then
      (gbGroup.Controls[i] as TEdit).OnChange := EditChange;
  end;
end;

procedure TfrmMain.LoadFromFile();
begin
  DisableEditOnChange();

  edDefaultServerName.Text := GetDefaultServer();
  edDefaultDatabaseName.Text := GetDefaultDBName();
  edDefaultUserName.Text := GetDefaultUserID();
  edDefaultPassword.Text := GetDefaultUserPWD();
  edDefaultConfrimPassword.Text := edDefaultPassword.Text;

  edCtrlServerNamse.Text := GetCtrlVerServer();
  edCtrlDatabaseName.Text := GetCtrlVerDBName();
  edCtrlUserName.Text := GetCtrlVerUserID();
  edCtrlPassword.Text := GetCtrlVerUserPWD();
  edCtrlConfirmPassword.Text := edDefaultPassword.Text;

  edSecurityUserName.Text := GetSecurityUserID();
  edSecurityPassword.Text := GetSecurityUserPWD();
  edSecurityConfirmPassword.Text := edSecurityPassword.Text;

  edManagerUserName.Text := GetManagerUserID();
  edManagerPassword.Text := GetManagerUserPWD();
  edManagerConfirmPassword.Text := edManagerPassword.Text;

  EnableEditOnChange();
  FChanged := False;
end;

procedure TfrmMain.SaveToFile();
var
  _S: String;
begin
  _S := '';
  if (edDefaultPassword.Text <> edDefaultConfrimPassword.Text) then
    _S := 'Default password and its confirmation password is not matched';
  if (edCtrlPassword.Text <> edCtrlConfirmPassword.Text) then
    _S := _S + #10#13 +
      'Control version password and its confirmation password is not matched';
  if (edSecurityPassword.Text <> edSecurityConfirmPassword.Text) then
    _S := _S + #10#13 +
      'Security password and its confirmation password is not matched';
  if (edManagerPassword.Text <> edManagerConfirmPassword.Text) then
    _S := _S + #10#13 +
      'Application Loader manager password and its confirmation password is not matched';

  if (_S <> '') then
  begin
    Application.MessageBox(PChar(_S), 'Verify Error', MB_OK or MB_ICONERROR);
    Exit;
  end;
  
  DisableEditOnChange();
  try
    dbcConnection.DatabaseName :=
      edDefaultServerName.Text + ':' + edDefaultDatabaseName.Text;
    dbcConnection.UserName := edDefaultUserName.Text;
    dbcConnection.PassWord := edDefaultPassword.Text;
    SaveConnection(dbcConnection);

    dbcConnection.DatabaseName :=
      edCtrlServerNamse.Text + ':' + edCtrlDatabaseName.Text;
    dbcConnection.UserName := edCtrlUserName.Text;
    dbcConnection.PassWord := edCtrlPassword.Text;
    SaveConnection(dbcConnection, False);

    SetSecurityID(edSecurityUserName.Text, edSecurityPassword.Text);
    SetManagerID(edManagerUserName.Text, edManagerPassword.Text);
  finally
    EnableEditOnChange();
  end;

  FChanged := False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  if (FileExists(SystemDir + _CRG_CONFIG)) then
    LoadFromFile()
  else
    EnableEditOnChange();
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

  FChanged := False;
end;

procedure TfrmMain.stbStatusHint(Sender: TObject);
begin
  stbStatus.Panels[1].Text := ' ' + GetLongHint(Application.Hint);
end;

procedure TfrmMain.EditChange(Sender: TObject);
begin
  (Sender as TEdit).Font.Style := [fsBold];
  FChanged := True;
end;

procedure TfrmMain.edDefaultServerNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
begin
  SaveToFile();
end;

procedure TfrmMain.btnReloadClick(Sender: TObject);
begin
  LoadFromFile();
end;

procedure TfrmMain.btnTestClick(Sender: TObject);
var
  _ErrorCount: Integer;
  _S: String;
begin
  _S := '';
  if (edDefaultPassword.Text <> edDefaultConfrimPassword.Text) then
    _S := 'Default password and its confirmation password is not matched';
  if (edCtrlPassword.Text <> edCtrlConfirmPassword.Text) then
    _S := _S + #10#13 +
      'Control version password and its confirmation password is not matched';
  if (edSecurityPassword.Text <> edSecurityConfirmPassword.Text) then
    _S := _S + #10#13 +
      'Security password and its confirmation password is not matched';
  if (edManagerPassword.Text <> edManagerConfirmPassword.Text) then
    _S := _S + #10#13 +
      'Application Loader manager password and its confirmation password is not matched';

  if (_S <> '') then
  begin
    Application.MessageBox(PChar(_S), 'Verify Error', MB_OK or MB_ICONERROR);
    Exit;
  end;

  _ErrorCount := 0;
  _S := '';

  dbcConnection.Connected := False;
  dbcConnection.DatabaseName :=
    edDefaultServerName.Text + ':' + edDefaultDatabaseName.Text;
  dbcConnection.UserName := edDefaultUserName.Text;
  dbcConnection.PassWord := edDefaultPassword.Text;

  try
    dbcConnection.Connected := True;
    _S := 'Default conection testing was passed'#10#10#13;
  except
    Inc(_ErrorCount);
    _S := 'Default conection testing was failed'#10#10#13;
  end;

  dbcConnection.Connected := False;
  dbcConnection.DatabaseName :=
    edCtrlServerNamse.Text + ':' + edCtrlDatabaseName.Text;
  dbcConnection.UserName := edCtrlUserName.Text;
  dbcConnection.PassWord := edCtrlPassword.Text;

  try
    dbcConnection.Connected := True;
    _S := _S + 'Control version conection testing was passed'#10#10#13;
  except
    Inc(_ErrorCount);
    _S := _S + 'Control version connection testing was failed'#10#10#13;
  end;

  dbcConnection.Connected := False;
  dbcConnection.DatabaseName :=
    edDefaultServerName.Text + ':' + edDefaultDatabaseName.Text;
  dbcConnection.UserName := edSecurityUserName.Text;
  dbcConnection.PassWord := edSecurityPassword.Text;
  try
    dbcConnection.Connected := True;
    _S := _S + 'Security user and password testing was passed'#10#10#13;
  except
    Inc(_ErrorCount);
    _S := _S + 'Security user and password testing was failed'#10#10#13;
  end;

  dbcConnection.Connected := False;
  dbcConnection.UserName := edManagerUserName.Text;
  dbcConnection.PassWord := edManagerPassword.Text;
  try
    dbcConnection.Connected := True;
    _S := _S + 'Manager user and password testing was passed'#10#10#13;
  except
    Inc(_ErrorCount);
    _S := _S + 'Manager user and password testing was failed'#10#10#13;
  end;

  if (_ErrorCount = 0) then
    _S := _S + 'There are no errer.'
  else
    _S := _S + 'There are ' + IntToStr(_ErrorCount) + ' errer(s) occurred.';

  Application.MessageBox(PChar(_S), 'Test Information', MB_OK or MB_ICONINFORMATION);
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  _R: Integer;
begin
  if (FChanged) then
  begin
    _R := Application.MessageBox(
            'Configuration has been changed, Do you want to save?',
            'Comfirm', MB_YESNOCANCEL or MB_ICONQUESTION);
    if (_R = idYes) then
      SaveToFile();

    Canclose := (_R <> idCancel);
  end;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F4: WinExec(PChar('notepad.exe ' + SystemDir + _CRG_CONFIG), SW_SHOW);
  end;
end;

procedure AboutBox(Title, Msg: PChar); stdcall;
  external 'crgabout.dll' name 'AboutBox';
procedure TfrmMain.btnAboutClick(Sender: TObject);
const
  _CR = #13;
begin
  AboutBox(
    'Config Application Loader',
    PChar(
      'Application Loader Version: ' +
      GetFileVerionString(Application.ExeName) + _CR +
      'Configuration Application Loader database connection'+ _CR +
      'including users name and passwords for security ' + _CR +
      'management.' + _CR +
      _CR +
      'Powered By: The CRG Real Team' + _CR +
      'Distributed By: CRG Software Co., Ltd.' + _CR +
      _CR +
      'In associated with:' + _CR +
      'The Computer Research Group.' + _CR +
      'The CRG, The CRG RT , The CRG Software is' + _CR +
      'trade mark of the CRG Software Co., Ltd.'));
end;

end.
