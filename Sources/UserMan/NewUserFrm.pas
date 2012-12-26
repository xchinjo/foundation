unit NewUserFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzEdit, RzDBEdit, StdCtrls, Mask, ExtCtrls, RzPanel,
  RzCmboBx;

type
  TfrmNewUser = class(TForm)
    PaneUser: TRzPanel;
    RzPanel2: TRzPanel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TxtId: TRzDBEdit;
    TxtName: TRzDBEdit;
    TxtUser: TRzDBEdit;
    DtDate: TRzDBDateTimeEdit;
    TxtTel: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    TxtCode: TRzMaskEdit;
    RzPanel3: TRzPanel;
    BtnSave: TRzBitBtn;
    BtnCancel: TRzBitBtn;
    rzTopPanel: TRzPanel;
    cmbRoles: TRzComboBox;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FIsOK: boolean;
    procedure SetIsOK(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property IsOK: boolean read FIsOK write SetIsOK;
  end;

var
  frmNewUser: TfrmNewUser;

implementation

{$R *.dfm}

procedure TfrmNewUser.BtnCancelClick(Sender: TObject);
begin
  IsOK:=false;
  close;
end;

procedure TfrmNewUser.BtnSaveClick(Sender: TObject);
begin
  IsOK:=true;
  close;
end;

procedure TfrmNewUser.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmNewUser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

procedure TfrmNewUser.FormShow(Sender: TObject);
begin
  IsOK := false;
end;

end.
