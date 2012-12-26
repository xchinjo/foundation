{ *********************************************************************** }
{                                                                         }
{ The CRG Software Cross-Platform Runtime Library                         }
{ CRG - Message Dialog DLL Library                                        }
{                                                                         }
{ Copyright (c) 2006 CRG Software Co., Ltd.                               }
{                                                                         }
{ *********************************************************************** }

library dlgbox;

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  JvUIB,
  DialogForm in 'DialogForm.pas' {frmDialog};

{$R *.res}

type
  TShowWindowType = (swNone, swModal, swNormal);

function MsgDlgBox(_MainApp: TApplication; _Msg: String; _DialogType: TDialogType;
  _Button: TDialogButton; _Language: String; _Title: String;
  _Button1: String; _Button2: String): TDialogResult; stdcall;
begin
  Result :=
    DialogForm.MsgDlgBox(
      _MainApp,_Msg, _DialogType, _Button, _Language,
      _Title, _Button1, _Button2);
end;

exports
  MsgDlgBox;

end.
 