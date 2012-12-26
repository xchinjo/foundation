library appoint;

uses
  Forms,
  SysUtils,
  Classes,
  pFIBDatabase;

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNomal);

function Execute(_MainApp: TApplication; _DBConn: TpFIBDatabase;
  _Type: TShowWindowType; _Parameter: ShortString): TForm; stdcall;
begin
  Result := nil;
end;

exports
  Execute;

end.
 