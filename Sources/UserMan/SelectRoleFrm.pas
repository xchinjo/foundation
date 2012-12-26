unit SelectRoleFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx,UserListFrm;

type
  TfrmSelectRole = class(TForm)
    cmbRoles: TRzComboBox;
    btnOK: TRzButton;
    btnCancel: TRzButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FMainForm: TFrmUserList;
    FSelectRole: Integer;
    FIsOK: boolean;
    FcurrRole: integer;
    procedure SetMainForm(const Value: TFrmUserList);
    procedure SetSelectRole(const Value: Integer);
    procedure SetIsOK(const Value: boolean);
    procedure SetcurrRole(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TFrmUserList read FMainForm write SetMainForm;
    property SelectRole : Integer read FSelectRole write SetSelectRole;
    property currRole : integer read FcurrRole write SetcurrRole;
    property IsOK : boolean read FIsOK write SetIsOK;
  end;

var
  frmSelectRole: TfrmSelectRole;

implementation

uses CommonLIB, CommonUtils;

{$R *.dfm}

{ TfrmSelectRole }

procedure TfrmSelectRole.SetMainForm(const Value: TFrmUserList);
begin
  FMainForm := Value;
end;

procedure TfrmSelectRole.FormShow(Sender: TObject);
begin
  loadCmbList(cmbRoles,FMainForm.cdsRoles,'select  * from Roles','RoleId','RoleName',IntToStr(currRole));
  IsOK := false;
end;

procedure TfrmSelectRole.SetSelectRole(const Value: Integer);
begin
  FSelectRole := Value;
end;

procedure TfrmSelectRole.btnOKClick(Sender: TObject);
begin
  SelectRole := strtoint(TString(cmbRoles.Items.Objects[cmbRoles.ItemIndex]).Str);
  IsOK := true;
  Close;
end;

procedure TfrmSelectRole.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmSelectRole.btnCancelClick(Sender: TObject);
begin
  IsOK := false;
  close;
end;

procedure TfrmSelectRole.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
   btnCancelClick(sender);
end;

procedure TfrmSelectRole.SetcurrRole(const Value: integer);
begin
  FcurrRole := Value;
end;

end.

