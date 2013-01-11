{ *********************************************************************** }
{                                                                         }
{ The Bantung Software  Runtime Library                                   }
{ Bantung - Form Show Manager DLL Library                                 }
{                                                                         }
{ Copyright (c) 2012 Bantung Software Co., Ltd.                           }
{                                                                         }
{ *********************************************************************** }

library fshow;

uses Forms, SmoothShow;

{$R *.res}

procedure ShowFormEx(_Form: TForm); stdcall;
begin
{
  with TSmoothShow.Create(_Form) do
  try
    BorderWidth := 2;
    Delay := 15;
    Execute();
    while (Busy) do Application.ProcessMessages();
  finally
    Free();
  end;
  }
  _Form.Show;
end;

exports
  ShowFormEx;
begin
end.
