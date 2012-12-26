unit BackupForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, jvuib, ComCtrls, StdCtrls;

type
  TfrmBackForm = class(TForm)
    jvBackUp: TJvUIBBackup;
    pnConfig: TPanel;
    pnVerbose: TPanel;
    sbStatus: TStatusBar;
    mmVerbose: TMemo;
    lbHost: TLabel;
    edHost: TEdit;
    lbDatabaseName: TLabel;
    edDatabaseName: TEdit;
    lbBakcupFileType: TLabel;
    cbBackupType: TComboBox;
    lbBakcupFileName: TLabel;
    edBackupFile: TEdit;
    btnStart: TButton;
    btnSave: TButton;
    btnClose: TButton;
    tmTime: TTimer;
    pnBackupList: TPanel;
    lbBackupList: TLabel;
    cbBackupList: TComboBox;
    jvRestore: TJvUIBRestore;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure jvBackUpVerbose(Sender: TObject; Message: String);
    procedure cbBackupTypeChange(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure tmTimeTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbBackupListChange(Sender: TObject);
    procedure edHostChange(Sender: TObject);
    procedure edDatabaseNameChange(Sender: TObject);
    procedure edBackupFileChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsBackUp: Boolean;
    FBAKRESText: String;
    FAutoBackUp: Boolean;
    FAutoRun: Boolean;
    FIsVerbose: Boolean;
    FShowWindow: Boolean;

    FUserName: String;
    FPassword: String;

    FHostList: TStringList;
    FDBFiles: TStringList;
    FBAKTypes: TStringList;
    FBAKFiles: TStringList;

    procedure SetIsBackUp(Value: Boolean);
    procedure UpdateBackupList();
  public
    procedure StartBackup();
    procedure BackupAll();

    property IsBackUp: Boolean read FIsBackUp write SetIsBackUp;
  end;

var
  frmBackForm: TfrmBackForm;

implementation

uses IniFiles, crgsec, UserPWDForm;

{$R *.dfm}

const
  _PF_TXT = 'CRG_BAK: ';

var
  _fb_back_conf: String;

function GetIdent(const _S: String): String;
var
  _P: Integer;
begin
  Result := '';
  _P := Pos('=', _S);
  if (_P <> 0) then
    Result := Copy(_S, 1, _P - 1);
end;

function GetValues(const _S: String): String;
var
  _P: Integer;
begin
  Result := '';
  _P := Pos('=', _S);
  if (_P <> 0) then
    Result := Copy(_S, _P + 1, Length(_S) - _P);
end;

procedure TfrmBackForm.SetIsBackUp(Value: Boolean);
begin
  FIsBackUp := Value;
  if (FIsBackUp) then
    FBAKRESText := 'Backup'
  else
    FBAKRESText := 'Restore';

  sbStatus.Panels[3].Text := ' Method: ' + FBAKRESText;
end;

procedure TfrmBackForm.UpdateBackupList();
var
  _Index: Integer;
begin
  _Index := cbBackupList.ItemIndex;

  cbBackupList.OnChange := nil;
  try
    cbBackupList.Items[_Index] :=
      GetValues(FHostList[_Index]) + ':' +
      GetValues(FDBFiles[_Index]) + '-->' +
      GetValues(FBAKFiles[_Index]) + '(' +
      cbBackupType.Items[StrToInt(GetValues(FBAKTypes[_Index]))] + ')';

    cbBackupList.ItemIndex := _Index;
  finally
    cbBackupList.OnChange := cbBackupListChange;
  end;
end;

function GetBakFileName(const _File: String; const _Type: Integer): String;
const
  _WEEKDAYS: array [1..7] of String[10] =
    ('Sunday', 'Monday', 'Tuesday', 'Wednesday',
     'Thursday', 'Friday', 'Saturday');
begin
 case _Type of
   0: Result := _File;
   1: Result := _File + FormatDateTime('yyyymmdd', Now()) + '.fbk';
   2: Result := _File + FormatDateTime('yyyymmdd.hhmmss', Now()) + '.fbk';
   3: Result := _File + _WEEKDAYS[DayOfWeek(Now())] + '.fbk';
 end;
end;

procedure TfrmBackForm.StartBackup();
begin
  mmVerbose.Lines.Add(
    _PF_TXT + 'Backup ' + edHost.Text + ':' + edDatabaseName.Text +
    ' started at: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()));

  if (not FIsVerbose) then
    mmVerbose.Lines.Add(
      'CRG: ' + FBAKRESText + ' is running in background process...');

  if (IsBackUp) then
  begin
    jvBackUp.Host := edHost.Text;
    jvBackUp.Database := edDatabaseName.Text;

    jvBackUp.BackupFiles.Text :=
      GetBakFileName(edBackupFile.Text, cbBackupType.ItemIndex);

    jvBackUp.UserName := FUserName;
    jvBackUp.PassWord := FPassword;

    jvBackUp.Run();
  end else
  begin
    jvRestore.Host := edHost.Text;
    jvRestore.Database := edDatabaseName.Text;

    jvRestore.BackupFiles.Text :=
      GetBakFileName(edBackupFile.Text, cbBackupType.ItemIndex);

    jvRestore.UserName := FUserName;
    jvRestore.PassWord := FPassword;

    jvRestore.Run();
  end;

  mmVerbose.Lines.Add(_PF_TXT + FBAKRESText + ' finished at: ' +
    FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()));
  mmVerbose.Lines.Add('');
end;

procedure TfrmBackForm.BackupAll();
var
  i: Integer;
  _Start_Time, _Stop_Time: TTime;
begin
  mmVerbose.Clear();
  mmVerbose.Lines.Add('CRG_BAK - Firebird Backup Utilites version 1.0');
  if (not FIsVerbose) then
    mmVerbose.Lines.Add('CRG_BAK - Verbose is off.')
  else
    mmVerbose.Lines.Add('CRG_BAK - Verbose is on.');

  _Start_Time := Now();
  for i := 0 to (cbBackupList.Items.Count - 1) do
  begin
    sbStatus.Panels[2].Text :=
      Format(' Current backup item: %d', [i + 1]);

    cbBackupList.ItemIndex := i;
    Application.ProcessMessages();

    edHost.Text := GetValues(FHostList[i]);
    edDatabaseName.Text := GetValues(FDBFiles[i]);
    cbBackupType.ItemIndex := StrToInt(GetValues(FBAKTypes[i]));
    edBackupFile.Text := GetValues(FBAKFiles[i]);

    StartBackup();
  end;
  _Stop_Time := Now();

  mmVerbose.Lines.Add('CRG_BAK - Estimated time used: ' +
    FormatDateTime('hh:mm:ss.nn', _Stop_Time - _Start_Time));

  if (FAutoBackUp) then
    Application.Terminate();
end;

procedure TfrmBackForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  FHostList := TStringList.Create();
  FDBFiles := TStringList.Create();
  FBAKTypes := TStringList.Create();
  FBAKFiles := TStringList.Create();
  
  with TIniFile.Create(_fb_back_conf) do
  try
    ReadSectionValues('db.hosts', FHostList);
    ReadSectionValues('db.files', FDBFiles);
    ReadSectionValues('bak.types', FBAKTypes);
    ReadSectionValues('bak.files', FBAKFiles);

    IsBackUp := (ReadInteger('options', 'method', 0) = 0);

    FAutoBackUp := ReadBool('options', 'autobackup', False);
    FIsVerbose := ReadBool('options', 'verbose', True);
    FShowWindow := ReadBool('options', 'show_window', True);

    FUserName := ReadString('options', 'user_name', 'sysdba');
    FPassword :=
      DecryptEx(ReadString('options', 'password',
      (****** Default for "masterkey" ******)
      'C7CDC7B8C6BAC6BFC7BCC6BDC7CBC7BCC6C9'));
  finally
    Free();
  end;

  for i := 0 to (FHostList.Count - 1) do
  begin
    cbBackupList.Items.Add(
      GetValues(FHostList[i]) + ':' +
      GetValues(FDBFiles[i]) + '-->' +
      GetValues(FBAKFiles[i]) + '(' +
      cbBackupType.Items[StrToInt(GetValues(FBAKTypes[i]))] + ')');
  end;

  if (cbBackupList.Items.Count = 0) then
  begin
    FHostList.Add('host1= ');
    FDBFiles.Add('file1= ');
    FBAKTypes.Add('type1= ');
    FBAKFiles.Add('file1= ');
  end;

  cbBackupList.ItemIndex := 0;
  cbBackupListChange(cbBackupList);

  pnBackupList.Visible := (cbBackupList.Items.Count > 1);

  FAutoRun :=
    (((ParamCount > 0) and (UpperCase(ParamStr(1)) = 'AUTO')) or FAutoBackUp);

  if (FAutoRun) then
  begin
    Application.ShowMainForm := FShowWindow;
    if (not FShowWindow) then
      FIsVerbose := False;

    tmTime.Enabled := True;
  end;
  
  jvBackUp.Verbose := FIsVerbose;
  jvRestore.Verbose := jvBackUp.Verbose;
  jvRestore.UserName := jvBackUp.UserName;
  jvRestore.PassWord := jvBackUp.PassWord;
end;

procedure TfrmBackForm.FormShow(Sender: TObject);
begin
//
end;

procedure TfrmBackForm.jvBackUpVerbose(Sender: TObject; Message: String);
begin
  mmVerbose.Lines.Add(_PF_TXT + Copy(Message, 6, Length(Message) - 6));
end;

procedure TfrmBackForm.cbBackupTypeChange(Sender: TObject);
var
  _Index: Integer;
begin
  _Index := cbBackupType.ItemIndex;
  if (_Index = 0) then
    lbBakcupFileName.Caption := '  Backup Full Path&&File Name'
  else
    lbBakcupFileName.Caption := '  Backup Only Full Path Name';

  if (not FAutoBackup) then
  begin
    FBAKTypes[cbBackupList.ItemIndex] :=
     GetIdent(FBAKTypes[cbBackupList.ItemIndex]) + '=' + IntToStr(_Index);

    UpdateBackupList();
  end;
end;

procedure TfrmBackForm.btnStartClick(Sender: TObject);
begin
  btnSaveClick(btnSave);

  pnBackupList.Enabled := False;
  pnConfig.Enabled := False;
  mmVerbose.Clear();
  mmVerbose.Lines.Add('CRG_BAK - Firebird Backup/Restore Utility version 1.0');
  if (not FIsVerbose) then
    mmVerbose.Lines.Add('CRG_BAK - Verbose is off.')
  else
    mmVerbose.Lines.Add('CRG_BAK - Verbose is on.');

  try
    StartBackup();
  finally
    pnConfig.Enabled := True;
    pnBackupList.Enabled := True;
  end;
end;

procedure TfrmBackForm.btnSaveClick(Sender: TObject);
var
  i: Integer;
begin
  with TIniFile.Create(_fb_back_conf) do
  try
    for i := 0 to (cbBackupList.Items.Count - 1) do
    begin
      WriteString('db.hosts', GetIdent(FHostList[i]), GetValues(FHostList[i]));
      WriteString('db.files', GetIdent(FDBFiles[i]), GetValues(FDBFiles[i]));
      WriteInteger('bak.types', GetIdent(FBAKTypes[i]),
        StrToInt(GetValues(FBAKTypes[i])));
      WriteString('bak.files', GetIdent(FBAKFiles[i]), GetValues(FBAKFiles[i]));
    end;

    WriteInteger('options', 'method', Integer(not FIsBackUp));

    WriteBool('options', 'verbose', FIsVerbose);
    WriteBool('options', 'show_window', FShowWindow);
    WriteBool('options', 'autobackup', FAutoBackup);

    WriteString('options', 'user_name', FUserName);
    WriteString('options', 'password', EncryptEx(FPassword));
  finally
    Free();
  end;
end;

procedure TfrmBackForm.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmBackForm.tmTimeTimer(Sender: TObject);
begin
  tmTime.Enabled := False;

  pnBackupList.Enabled := False;
  pnConfig.Enabled := False;

  BackupAll();
  Close();
end;

procedure TfrmBackForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not FAutoRun) then
    btnSaveClick(btnSave);

  FHostList.Free();
  FDBFiles.Free();
  FBAKTypes.Free();
  FBAKFiles.Free();
end;

procedure TfrmBackForm.cbBackupListChange(Sender: TObject);
begin
  edHost.Text := GetValues(FHostList[cbBackupList.ItemIndex]);
  edDatabaseName.Text := GetValues(FDBFiles[cbBackupList.ItemIndex]);
  cbBackupType.ItemIndex :=
    StrToInt(GetValues(FBAKTypes[cbBackupList.ItemIndex]));
  edBackupFile.Text := GetValues(FBAKFiles[cbBackupList.ItemIndex]);

  cbBackupList.Hint := cbBackupList.Text;
  lbBackupList.Hint := cbBackupList.Text;

  sbStatus.Panels[1].Text :=
    Format(' %d backup(s) existed', [cbBackupList.Items.Count]);

  sbStatus.Panels[2].Text :=
    Format(' Current backup item: %d', [cbBackupList.ItemIndex + 1]);
end;

procedure TfrmBackForm.edHostChange(Sender: TObject);
begin
  if (not FAutoBackup) then
  begin
    FHostList[cbBackupList.ItemIndex] :=
      GetIdent(FHostList[cbBackupList.ItemIndex]) + '=' + edHost.Text;

    UpdateBackupList();
  end;
end;

procedure TfrmBackForm.edDatabaseNameChange(Sender: TObject);
begin
  if (not FAutoBackup) then
  begin
    FDBFiles[cbBackupList.ItemIndex] :=
      GetIdent(FDBFiles[cbBackupList.ItemIndex]) + '=' + edDatabaseName.Text;

    UpdateBackupList();
  end;
end;

procedure TfrmBackForm.edBackupFileChange(Sender: TObject);
begin
  if (not FAutoBackup) then
  begin
    FBAKFiles[cbBackupList.ItemIndex] :=
      GetIdent(FBAKFiles[cbBackupList.ItemIndex]) + '=' + edBackupFile.Text;

    UpdateBackupList();
  end;
end;

procedure TfrmBackForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
  _ON_OFF_: array[False..True] of String[3] =
    ('off', 'on');
  _BAK_RES_: array[0..1] of String[7] =
    ('restore', 'backup');
var
  _Count: Integer;
  _C: Char;
begin
  if ((Key = VK_F2) and (not FAutoBackup)) then
  begin
    _Count := FHostList.Count + 1;

    FHostList.Add('host' + IntToStr(_Count) + '=newhost');
    FDBFiles.Add('file' + IntToStr(_Count) + '=newdb');
    FBAKTypes.Add('type' + IntToStr(_Count) + '=0');
    FBAKFiles.Add('file' + IntToStr(_Count) + '=drive:\path');

    cbBackupList.ItemIndex := cbBackupList.Items.Count - 1;
    UpdateBackupList();
  end else
  if (Key = VK_F1) then
  begin
    Application.MessageBox(
      PChar(
        'Screen Objects:'#10#13 +
        '  "Setting Up List of Backup" --> All backup/restore targets.'#10#13 +
        '  "Database Server" --> each database server to backup/restore.'#10#13 +
        '  "Database Name" --> each database name to backup/restore.'#10#13 +
        '  "Backup File Type" --> each backup/restore type'#10#13 +
        '      - Full Path Name = Needed full path and name.'#10#13 +
        '      - By Date (yyyymmdd.fbk) = Date is used for name.'#10#13 +
        '      - By Date/Time (yyyymmdd.hhmmss.fbk) = Date/Time is used for name.'#10#13 +
        '      - By Day of Week Days (DayOfWeek.fbk) = Day of week is used for name.'#10#13 +
        '  "Backup Full Path&File Name" --> each name to backup/restore.'#10#13 +
        #10#13 +
        'Button Command:'#10#13 +
        '  Start Button --> Start backup/restore.'#10#13 +
        '  Save Button --> Save all setting.'#10#13 +
        '  Close Button --> Close this application.'#10#13 +
        #10#13 +
        'Short-cut Key:'#10#13 +
        '  F1 --> This help.'#10#13 +
        '  F2 --> Add new backup/restore target.'#10#13 +
        '  F9 --> Backup/Restore from/to all targets.'#10#13 +
        '  Ctrl + F4 --> Show invisible setting values.'#10#13 +
        '  Ctrl + ''A'' --> Turn on/off automatic backup/restore.'#10#13 +
        '  Ctrl + ''B'' --> Select backup method.'#10#13 +
        '  Ctrl + ''R'' --> Select restore method.'#10#13 +
        '  Ctrl + ''S'' --> Save all setting.'#10#13 +
        '  Ctrl + ''V'' --> Turn on/off backup/restore verbose.'#10#13 +
        '  Ctrl + ''U'' --> Change default User/Password to backup/restore.'#10#13 +
        '  Ctrl + ''W'' --> Visible/Invisible window on automatic backup/restore mode.'#10#13 +
        #10#13 +
        'TIP: '#10#13 +
        '  Configuration file was saved on the same application name'#10#13 +
        '  but differrent for file extension, so that mean you can create'#10#13+
        '  more effective backup/restore by rename this application and'#10#13 +
        '  its configuration files for more scheduled methods.'#10#13 +
        #10#13 +
        'For more information contact your program vendor.'#10#10#13 +
        'Contact developer:'#10#13 +
        '  via URL: http://www.crgsoftware.com'#10#13 +
        '  via E-MAIL: support@crgsoftware.com'),
      'CRG Backup/Restore Help', MB_OK or MB_ICONINFORMATION)
  end else
  if (Key = VK_F4) then
  begin
    if (ssCtrl in Shift) then
    begin
      Application.MessageBox(
        PChar(
          'Invisible Setting Values:'#10#13 +
          '  Method is ' + _BAK_RES_[Integer(FIsBackUp)] + #10#13 +
          '  Auto-Backup/Restore is ' + _ON_OFF_[FAutoBackUp] + #10#13 +
          '  Visible window on Auto-Backup/Restore method is ' + _ON_OFF_[FShowWindow] + #10#13 +
          '  Verbos is ' + _ON_OFF_[FIsVerbose] + #10#13 +
          '  User Name is "' + FUserName + '"'#10#13 +
          '  Password is "' + EncryptEx(FPassword) + '" (encrypted)'),
        'CRG Backup/Restore Information', MB_OK or MB_ICONINFORMATION);
      Key := 0;
    end;
  end else
  if (Key = VK_F9) then
  begin
    pnBackupList.Enabled := False;
    pnConfig.Enabled := False;
    try
      BackupAll();
    finally
      pnBackupList.Enabled := True;
      pnConfig.Enabled := True;
    end;
  end else
  if (ssCtrl in Shift) then
  begin
    _C := UpCase(Char(Lo(Key)));
    if (_C = 'A') then
    begin
      FAutoBackup := not FAutoBackup;
      if (FAutoBackup) then
        Application.MessageBox(
          'Auto-Backup is now turn on.', 'Run', MB_OK or MB_ICONINFORMATION)
      else
        Application.MessageBox(
          'Auto-Backup is now turn off.', 'Run', MB_OK or MB_ICONINFORMATION);
    end else
    if (_C = 'B') then
    begin
     if (IsBackUp) then
       Exit;

      Application.MessageBox(
        'Method is now switch to "Backup".', 'Run', MB_OK or MB_ICONINFORMATION);
      IsBackUp := True;
    end else
    if (_C = 'R') then
    begin
      if (not IsBackUp) then
       Exit;
       
      Application.MessageBox(
        'Method is now switch to "Restore".', 'Run', MB_OK or MB_ICONINFORMATION);
      IsBackUp := False;
    end else
    if (_C = 'S') then
    begin
      btnSaveClick(btnSave);
    end else
    if (_C = 'V') then
    begin
      jvBackUp.Verbose := not jvBackUp.Verbose;
      FIsVerbose := jvBackUp.Verbose;
      if (FIsVerbose) then
        Application.MessageBox(
          'Verbose is now turn on.', 'Verbose', MB_OK or MB_ICONINFORMATION)
      else
        Application.MessageBox(
          'Verbose is now turn off.', 'Verbose', MB_OK or MB_ICONINFORMATION);
    end else
    if (_C = 'U') then
    begin
      with TfrmUserPWD.Create(Self) do
      try
        edUserName.Text := FUserName;
        edPassword.Text := FPassword;

        ShowModal();

        if (IsOKClick) then
        begin
          FUserName := Trim(edUserName.Text);
          FPassword := edPassword.Text;
        end;
      finally
        Free();
      end;
    end else
    if (_C = 'W') then
    begin
      FShowWindow := not FShowWindow;
      if (FShowWindow) then
        Application.MessageBox(
          'Auto-backup window is visibled', 'Window', MB_OK or MB_ICONINFORMATION)
      else
        Application.MessageBox(
          'Auto-backup window is invisibled.', 'Window', MB_OK or MB_ICONINFORMATION);
    end;
  end;
end;

initialization
  _fb_back_conf := ExtractFileName(Application.ExeName);
  _fb_back_conf := Copy(_fb_back_conf, 1, Pos('.', _fb_back_conf) - 1);

  _fb_back_conf :=
    ExtractFilePath(Application.ExeName) + PathDelim + _fb_back_conf + '.conf';

end.
