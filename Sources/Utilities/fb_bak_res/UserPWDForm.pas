unit UserPWDForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmUserPWD = class(TForm)
    GroupBox1: TGroupBox;
    lbUserName: TLabel;
    edUserName: TEdit;
    lbPassword: TLabel;
    edPassword: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    IsOKClick: Boolean;
  end;

var
  frmUserPWD: TfrmUserPWD;

implementation

{$R *.dfm}

procedure TfrmUserPWD.btnOKClick(Sender: TObject);
begin
  IsOKClick := True;
  Close();
end;

procedure TfrmUserPWD.btnCancelClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmUserPWD.edUserNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmUserPWD.FormCreate(Sender: TObject);
begin
  IsOKClick := False;
end;

end.
