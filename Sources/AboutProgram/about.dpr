library about;

uses
  SysUtils,
  Classes,
  Forms, 
  AboutForm in 'AboutForm.pas' {frmAbout};

{$R *.res}

function PrgDesc(): PChar; stdcall;
begin
  Result := 'NGF System';
end;

procedure AboutBox(); stdcall;
begin
  with TfrmAbout.Create(Application) do
  try
    Parent := Application.MainForm;
    ShowModal();
  finally
    Free();
  end;
end;

exports
  PrgDesc,
  AboutBox;

begin
end.
