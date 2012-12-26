unit upload_main_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FileCtrl, StdCtrls, jvuib;

type
  TForm1 = class(TForm)
    dcDefault: TJvUIBDataBase;
    trnsDefault: TJvUIBTransaction;
    sqlData: TJvUIBQuery;
    Button1: TButton;
    edAppType: TEdit;
    Label1: TLabel;
    dcbDrive: TDriveComboBox;
    dlbDir: TDirectoryListBox;
    flbFiles: TFileListBox;
    Label2: TLabel;
    cbPath: TComboBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure GetFileVersion(const AFileName: String; var dwFileVersionMS,
  dwFileVersionLS: Cardinal);
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  FileName := AFileName;
  UniqueString(FileName);
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if (InfoSize <> 0) then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if (GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf)) then
        if (VerQueryValue(VerBuf, '\', Pointer(FI), VerSize)) then
        begin
          dwFileVersionMS := FI.dwFileVersionMS;
          dwFileVersionLS := FI.dwFileVersionLS;
        end;
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

function GetFileVerionString(const AFileName: String): String; stdcall;
var
  HiVer, LoVer: Cardinal;
begin
  GetFileVersion(AFileName, HiVer, LoVer);

  Result :=
    Format('%d.%d.%d.%d',
      [HiWord(HiVer), LoWord(HiVer), HiWord(LoVer), LoWord(LoVer)]);
end;

function GetFileVerionStringEx(const AFileName: String): String; stdcall;
var
  HiVer, LoVer: Cardinal;
  _Major, _Minor, _Release, _Build: String[5];
begin
  GetFileVersion(AFileName, HiVer, LoVer);

  _Major := Format('%u', [HiWord(HiVer)]);
  while (Length(_Major) < 5) do
    _Major := '0' + _Major;

  _Minor := Format('%u', [LoWord(HiVer)]);
  while (Length(_Minor) < 5) do
    _Minor := '0' + _Minor;

  _Release := Format('%u', [HiWord(LoVer)]);
  while (Length(_Release) < 5) do
    _Release := '0' + _Release;

  _Build:= Format('%u', [LoWord(LoVer)]);
  while (Length(_Build) < 5) do
    _Build := '0' + _Build;

  Result := Format('%s%s%s%s', [_Major, _Minor, _Release, _Build]);
end;

//****************************************************************************//


procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  _filename: String;
  _filepath: String;
  _fileversion: String;
  _filedata: TMemoryStream;
begin
  if (Application.MessageBox(
        PChar('Do you want to upload directoy: ' + dlbDir.Directory),
        'Confirm', MB_YESNO) = idNo) then
    Exit;
    
  Screen.Cursor := crHourGlass;
  dcDefault.Connected := True;
  _filedata := TMemoryStream.Create();
  try
    _filepath := cbPath.Text;

    sqlData.Params.ByNameAsString['SYSTEM'] := 'NGF';
    sqlData.Params.ByNameAsString['FILE_PATH'] := _filepath;

    for i := 0 to (flbFiles.Count - 1) do
    begin
      _filename := flbFiles.Items[i];
      if (ExtractFileExt(_filename) = '.' + edAppType.Text) then
      begin
        sqlData.Params.ByNameAsString['FILE_NAME'] := _filename;

        if ((UpperCase(edAppType.Text) = 'EXE') or
            (UpperCase(edAppType.Text) = 'DLL') or
            (UpperCase(edAppType.Text) = 'BPL')) then
          _fileversion := GetFileVerionStringEx(dlbDir.Directory + '\' + _filename)
        else
          _fileversion := '<NONE>';

        sqlData.Params.ByNameAsString['FILE_VERSION'] := _fileversion;

        _filedata.LoadFromFile(dlbDir.Directory + '\' + _filename);
        sqlData.ParamsSetBlob('FILE_DATA', _filedata);

        sqlData.ExecSQL();
      end;
    end;
    sqlData.Close(etmCommit);
  finally
    _filedata.Free();
    dcDefault.Connected := False;
    Screen.Cursor := crDefault;
  end;
end;

end.
