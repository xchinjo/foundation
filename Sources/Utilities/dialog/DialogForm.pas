unit DialogForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGraphics, cxLookAndFeels, Menus;

type
  TDialogType = (dtWarning, dtError, dtInformation, dtConfirmation);
  TDialogButton = (btOK, btOKCancel, btYesNo);
  TDialogLang = (dlEng, dlTha);
  TDialogResult = (drOK, drCancel);

  TfrmDialog = class(TForm)
    btn1: TcxButton;
    btn2: TcxButton;
    imgInformation: TImage;
    lbMsg: TLabel;
    imgError: TImage;
    imgConfirmation: TImage;
    imgWarning: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDlgResult: TDialogResult;
  public
    procedure Init(_Msg: String; _DialogType: TDialogType;
      _Button: TDialogButton; _Language: String = 'ENG'; _Title: String = '';
      _Button1: String = ''; _Button2: String = '');

    property DlgResult: TDialogResult read FDlgResult write FDlgResult;
  end;

function MsgDlgBox(_MainApp: TApplication; _Msg: String; _DialogType: TDialogType;
  _Button: TDialogButton; _Language: String = 'ENG'; _Title: String = '';
  _Button1: String = ''; _Button2: String = ''): TDialogResult;

var
  frmDialog: TfrmDialog;

implementation

uses fshow;

{$R *.dfm}

const
  _CAPTION_ :array[TDialogLang, TDialogType] of String =
    (('Warning', 'Error', 'Information', 'Confirm'),
     ('เตือน', 'ผิดพลาด', 'รายละเอียด', 'ยืนยัน'));

  _BTN_CAPTION_ :array[TDialogLang, Boolean, 1..2] of String =
    ((('&OK', '&Cancel'),('&Yes', '&No')),
      (('&ตกลง', '&ยกเลิก'),('ใ&ช่', '&ไม่ใช่')));

function MsgDlgBox(_MainApp: TApplication; _Msg: String; _DialogType: TDialogType;
  _Button: TDialogButton; _Language: String = 'ENG'; _Title: String = '';
  _Button1: String = ''; _Button2: String = ''): TDialogResult;
begin
  with (TfrmDialog.Create(_MainApp)) do
  try
    Init(_Msg, _DialogType, _Button, _Language, _Title, _Button1, _Button2);
    ShowModal();
    Result := DlgResult;
  finally
    Free();
  end;
end;

procedure TfrmDialog.Init(_Msg: String; _DialogType: TDialogType;
  _Button: TDialogButton; _Language: String = 'ENG'; _Title: String = '';
  _Button1: String = ''; _Button2: String = '');
var
  _dL: TDialogLang;
  _IsYesNoBtn: Boolean;
begin
  lbMsg.Caption := _Msg;

  ClientWidth := lbMsg.Width + imgInformation.Width + 30;
  ClientHeight := lbMsg.Height + btn1.Height + 50;

  if (UpperCase(_Language) = 'ENG') then _dL := dlEng else _dL := dlTha;

  if (_Title = '') then
    Caption := _CAPTION_[_dL, _DialogType]
  else
    Caption := _Title;

  btn2.Visible := (_Button in [btOKCancel, btYesNo]);
  _IsYesNoBtn := (_Button = btYesNo);

  if (_Button1 = '') then
    btn1.Caption := _BTN_CAPTION_[_dl, _IsYesNoBtn, 1]
  else
    btn1.Caption := _Button1;

  if (_Button2 = '') then
    btn2.Caption := _BTN_CAPTION_[_dl, _IsYesNoBtn, 2]
  else
    btn2.Caption := _Button2;

  case _DialogType of
    dtWarning: imgInformation.Picture.Assign(imgWarning.Picture);
    dtError: imgInformation.Picture.Assign(imgError.Picture);
//    dtInformation: imgInformation.Picture.Assign(imgInformation.Picture);
    dtConfirmation: imgInformation.Picture.Assign(imgConfirmation.Picture);
  end;

  btn1.Top := ClientHeight - btn1.Height - 10;
  if (btn2.Visible) then
  begin
    if (ClientWidth < (btn1.Width + btn2.Width + 30)) then
      ClientWidth := (btn1.Width + btn2.Width + 30);

    btn1.Left := (ClientWidth - (btn1.Width + btn2.Width + 10)) div 2;
    btn2.Left := btn1.Left + btn1.Width + 10;
    btn2.Top := btn1.Top;
  end else
    btn1.Left := (ClientWidth - btn1.Width) div 2;

  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TfrmDialog.FormCreate(Sender: TObject);
begin
  FDlgResult := drCancel;
end;

procedure TfrmDialog.btn1Click(Sender: TObject);
begin
  FDlgResult := drOK;
  Close();
end;

procedure TfrmDialog.btn2Click(Sender: TObject);
begin
  Close();
end;

{
  Init(
    'Test Dialog Caption XXXXXXXXXXXXXXXXXXXx'#10#13'Lines 2'#10#13'Line 3',
    dtConfirmation, btOKCancel, 'THA', '', 'ยอมรับ', 'ไม่ยอมรับ');
}

procedure TfrmDialog.FormShow(Sender: TObject);
begin
  ShowFormEx(Self);
end;

end.
