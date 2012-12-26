unit ChangPWDForm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, ExtCtrls, cxGraphics, cxLookAndFeels;

type
  TfrmChangPWD = class(TForm)
    pnPanel: TPanel;
    Label3: TLabel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnSignOn: TcxButton;
    btnClear: TcxButton;
    lbUserID: TLabel;
    lbPassword1: TLabel;
    lbPassword2: TLabel;
    edUserID: TcxTextEdit;
    edPassword1: TcxTextEdit;
    edPassword2: TcxTextEdit;
    lbOldPassword: TLabel;
    edOldPassword: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edPassword1KeyPress(Sender: TObject; var Key: Char);
    procedure btnSignOnClick(Sender: TObject);
  private
    FPWD: String;
  public
    property Password: String read FPWD write FPWD;
  end;

var
  frmChangPWD: TfrmChangPWD;

implementation

uses fshow;

{$R *.dfm}

procedure TfrmChangPWD.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - ClientWidth) div 2;
  Top := (Screen.Height - ClientHeight) div 2;
end;

procedure TfrmChangPWD.FormShow(Sender: TObject);
begin
  ShowFormEx(Self);

  if (edOldPassword.Enabled) then
    edOldPassword.SetFocus();
end;

procedure TfrmChangPWD.edPassword1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmChangPWD.btnSignOnClick(Sender: TObject);
begin
  if ((edOldPassword.Enabled) and (edOldPassword.Text <> FPWD)) then
  begin
    Application.MessageBox(
      'Old Password does not matched.',
      'Error', MB_OK or MB_ICONERROR);

    edOldPassword.SetFocus();
    Exit;
  end;

  if (edPassword1.Text <> edPassword2.Text) then
  begin
    Application.MessageBox(
      'Confirm Password does not matched.',
      'Error', MB_OK or MB_ICONERROR);

    edPassword2.SetFocus();
    Exit;
  end;

  ModalResult := mrOk;
end;

end.
