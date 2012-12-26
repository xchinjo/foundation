unit BackupForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, jvuib, ComCtrls, StdCtrls;

type
  TfrmBackForm = class(TForm)
    jvBackup: TJvUIBBackup;
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure jvBackupVerbose(Sender: TObject; Message: String);
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
    FAutoBackup: Boolean;
    FAutoRun: Boolean;
    FIsVerbose: Boolean;
    FShowWindow: Boolean;

    FHostList: TStringList;
    FDBFiles: TStringList;
    FBAKTypes: TStringList;
    FBAKFiles: TStringList;

    procedure UpdateBackupList();
  public
    procedure StartBackup();
    procedure BackupAll();
  end;

var
  frmBackForm: TfrmBackForm;

implementation

uses IniFiles, crgsec;

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
    mmVerbose.Lines.Add('CRG: Backup is running in background process...');

  jvBackup.Host := edHost.Text;
  jvBackup.Database := edDatabaseName.Text;

  jvBackup.BackupFiles.Text :=
    GetBakFileName(edBackupFile.Text, cbBackupType.ItemIndex);

  jvBackup.Run();

  mmVerbose.Lines.Add(_PF_TXT + 'Backup finished at: ' +
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

  if (FAutoBackup) then
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

    FAutoBackup := ReadBool('options', 'autobackup', False);
    FIsVerbose := ReadBool('options', 'verbose', True);
    FShowWindow := ReadBool('options', 'show_window', True);

    jvBackup.UserName := ReadString('options', 'user_name', 'sysdba');
    jvBackup.PassWord :=
      DecryptEx(ReadString('options', 'password', 'masterkey'));
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
    (((ParamCount > 0) and (UpperCase(ParamStr(1)) = 'AUTO')) or FAutoBackup);

  if (FAutoRun) then
  begin
    Application.ShowMainForm := FShowWindow;
    if (not FShowWindow) then
      FIsVerbose := False;

    tmTime.Enabled := True;
  end;

  jvBackup.Verbose := FIsVerbose;
end;

procedure TfrmBackForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmBackForm.jvBackupVerbose(Sender: TObject; Message: String);
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
  {** Save changed current configuration **}
  btnSaveClick(btnSave);

  pnBackupList.Enabled := False;
  pnConfig.Enabled := False;
  mmVerbose.Clear();
  mmVerbose.Lines.Add('CRG_BAK - Firebird Backup Utility version 1.0');
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


    WriteBool('options', 'verbose', FIsVerbose);
    WriteBool('options', 'autobackup', FAutoBackup);
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
    _C := Char(Lo(Key));
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
    if (_C = 'V') then
    begin
      jvBackup.Verbose := not jvBackup.Verbose;
      FIsVerbose := jvBackup.Verbose;
      if (FIsVerbose) then
        Application.MessageBox(
          'Verbose is now turn on.', 'Verbose', MB_OK or MB_ICONINFORMATION)
      else
        Application.MessageBox(
          'Verbose is now turn off.', 'Verbose', MB_OK or MB_ICONINFORMATION);
    end;
  end;
end;

initialization
  _fb_back_conf := ExtractFileName(Application.ExeName);
  _fb_back_conf := Copy(_fb_back_conf, 1, Pos('.', _fb_back_conf) - 1);

  _fb_back_conf :=
    ExtractFilePath(Application.ExeName) + PathDelim + _fb_back_conf + '.conf';

end.
