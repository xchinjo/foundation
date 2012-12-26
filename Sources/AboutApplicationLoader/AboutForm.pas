unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxGraphics, cxLookAndFeels, Menus;

type
  TfrmAbout = class(TForm)
    imgCRG: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    btnOk: TcxButton;
    lbMsg: TLabel;
    lbSystem: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses fshow;

{$R *.dfm}

function GetCurrentUserName(): String;
var
  _Buffer: array[0..255] of Char;
  _SizeOfBuff: Cardinal;
begin
  _SizeOfBuff := 256;
  GetUserName(_Buffer, _SizeOfBuff);
  Result := StrPas(_Buffer);
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
var
  _OSVersionInfo: TOSVersionInfo;
  _MemoryStatus: TMemoryStatus;
  _C, _S: String;
  _MemoryAvailable: Cardinal;
begin
  _OSVersionInfo.dwOSVersionInfoSize := SizeOf(_OSVersionInfo);
  GetVersionEx(_OSVersionInfo);

  case _OSVersionInfo.dwPlatformId of
    VER_PLATFORM_WIN32s: _S := 'Win32s ';
    VER_PLATFORM_WIN32_WINDOWS: _S := 'Windows 95/98 ';
    VER_PLATFORM_WIN32_NT: _S := 'WindowsNT ';
  end;

  _S :=
    _S + IntToStr(_OSVersionInfo.dwMajorVersion) + '.' +
    IntToStr(_OSVersionInfo.dwMinorVersion) + '(Build: ' +
    IntToStr(_OSVersionInfo.dwBuildNumber) + ' ' +
    StrPas(_OSVersionInfo.szCSDVersion) + ')';

  _MemoryStatus.dwLength := SizeOf(_MemoryStatus);
  GlobalMemoryStatus(_MemoryStatus);
  _MemoryAvailable := _MemoryStatus.dwTotalPhys;

  _C := GetCurrentUserName();

  lbSystem.Caption := Format(lbSystem.Caption, [_S, _MemoryAvailable/1024, _C]);

//  Left := (Screen.Width - Width) div 2;
//  Top := (Screen.Height - Height) div 2;
end;

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  ShowFormEx(Self);
end;

procedure TfrmAbout.btnOkClick(Sender: TObject);
begin
  Close();
end;

end.
