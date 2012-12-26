library crgabout;

uses
  SysUtils,
  Classes,
  Forms, 
  AboutForm in 'AboutForm.pas' {frmAbout};

{$R *.res}

procedure AboutBox(Title, Msg: PChar); stdcall;
begin
  with TfrmAbout.Create(Application) do
  try
    Caption := Caption + ' ' + StrPas(Title) + '...';
    lbMsg.Caption := StrPas(Msg);

    Parent := Application.MainForm;
    ShowModal();
  finally
    Free();
  end;
end;

exports
  AboutBox;

begin
end.
