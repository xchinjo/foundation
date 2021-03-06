unit ChangePasswordFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, RzButton;

type
  TfrmChangePassword = class(TForm)
    lbPassword: TLabel;
    edPassword: TcxTextEdit;
    Label1: TLabel;
    edConfirmPassword: TcxTextEdit;
    btnOK: TRzBitBtn;
    btnCancel: TRzBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FIsOK: boolean;
    FNewPassword: string;
    FCurrPassword: string;
    procedure SetIsOK(const Value: boolean);
    procedure SetNewPassword(const Value: string);
    procedure SetCurrPassword(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property CurrPassword : string read FCurrPassword write SetCurrPassword;
    property IsOK:boolean read FIsOK write SetIsOK;
    property NewPassword : string read FNewPassword write SetNewPassword;
  end;

var
  frmChangePassword: TfrmChangePassword;

implementation

uses CommonLIB, CommonUtils;

{$R *.dfm}

procedure TfrmChangePassword.btnCancelClick(Sender: TObject);
begin
  IsOK := false;
  close;
end;

procedure TfrmChangePassword.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
  close;
end;

procedure TfrmChangePassword.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmChangePassword.FormShow(Sender: TObject);
begin
  IsOK:=false;
end;

procedure TfrmChangePassword.SetNewPassword(const Value: string);
begin
  FNewPassword := Value;
end;

procedure TfrmChangePassword.SetCurrPassword(const Value: string);
begin
  FCurrPassword := Value;
  edPassword.Text := value;
  edConfirmPassword.Text:= value;
end;

procedure TfrmChangePassword.btnOKClick(Sender: TObject);
begin
  if (trim(edPassword.Text)=trim(edConfirmPassword.Text)) then
  begin
    IsOK := true;
    NewPassword := trim(edPassword.Text);
    close;
  end else
  begin
    ShowMessage('Password not match!!!');
  end;
end;

end.
