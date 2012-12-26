library grantpermit;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  JvUIB,
  GrantManagerForm in 'GrantManagerForm.pas' {frmGrantManager};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  Result := TfrmGrantManager.Create(_MainApp);

  with (TfrmGrantManager(Result)) do
  begin
    trnsDefault.Database := _DBConn;
    if (_Type = swModal) then
    begin
      FormStyle := fsStayOnTop;
      WindowState := wsNormal;
      Left := (Screen.Width - Width) div 2;
      Top := (Screen.Height - Height) div 2;
      BorderIcons := [biSystemMenu];

      ShowModal();

      FreeAndNil(Result);
    end else
    begin
      FormStyle := fsMDIChild;
      Show();
    end;
  end;
end;

exports
  Execute;

end.
 