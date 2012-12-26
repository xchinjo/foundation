library roleman;

uses
  SysUtils,
  Classes,
  Forms,
  JvUIB,
  MainRoleForm in 'MainRoleForm.pas' {frmMainRole};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

function Execute(_MainApp: TApplication; _DBConn: TJvUIBDataBase;
  _Type: TShowWindowType; _Parameter: String): TForm; stdcall;
begin
  Result := TfrmMainRole.Create(_MainApp);
  TfrmMainRole(Result).trnsDefault.Database := _DBConn;
  if (_Type = swModal) then
  begin
    Result.FormStyle := fsNormal;
    Result.WindowState := wsNormal;
    Result.ShowModal();
    FreeAndNil(Result);
  end else
  begin
    Result.FormStyle := fsMDIChild;
    Result.Show();
  end;
end;

exports
  Execute;

end.
