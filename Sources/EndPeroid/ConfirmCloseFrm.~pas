unit ConfirmCloseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, Mask, RzEdit, RzLabel, RzButton,
  DBXpress, FMTBcd, Provider, DB, SqlExpr,EndPeroidFrm;

type
  TfrmConfirmClose = class(TForm)
    pnClientArea: TRzPanel;
    pnTitle3: TRzPanel;
    RzLabel3: TRzLabel;
    Label1: TLabel;
    edPeriod: TRzEdit;
    Label2: TLabel;
    edStartDate: TRzEdit;
    Label3: TLabel;
    edUserName: TRzEdit;
    Label4: TLabel;
    edWorkStation: TRzEdit;
    Label5: TLabel;
    edLocaton: TRzEdit;
    Label6: TLabel;
    edEndDate: TRzEdit;
    btnOK: TRzBitBtn;
    btnCancel: TRzBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FMainForm: TfrmEndPeroid;
    FIsConfirmClose: boolean;
    FPeroidNo: string;
    FLocationName: string;
    FWorkStation: string;
    FUserName: string;
    FEndDate: TDateTime;
    FStartDate: TDateTime;
    procedure SetMainForm(const Value: TfrmEndPeroid);
    procedure SetIsConfirmClose(const Value: boolean);
    procedure SetEndDate(const Value: TDateTime);
    procedure SetLocationName(const Value: string);
    procedure SetPeroidNo(const Value: string);
    procedure SetStartDate(const Value: TDateTime);
    procedure SetUserName(const Value: string);
    procedure SetWorkStation(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmEndPeroid read FMainForm write SetMainForm;
    property IsConfirmClose : boolean read FIsConfirmClose write SetIsConfirmClose;

    property PeroidNo : string read FPeroidNo write SetPeroidNo;
    property LocationName : string read FLocationName write SetLocationName;
    property StartDate : TDateTime read FStartDate write SetStartDate;
    property EndDate : TDateTime read FEndDate write SetEndDate;

    property UserName : string read FUserName write SetUserName;
    property WorkStation : string read FWorkStation write SetWorkStation;
  end;

var
  frmConfirmClose: TfrmConfirmClose;

implementation

{$R *.dfm}

{ TfrmConfirmClose }

procedure TfrmConfirmClose.SetIsConfirmClose(const Value: boolean);
begin
  FIsConfirmClose := Value;
end;

procedure TfrmConfirmClose.SetMainForm(const Value: TfrmEndPeroid);
begin
  FMainForm := Value;
end;

procedure TfrmConfirmClose.btnCancelClick(Sender: TObject);
begin
  FIsConfirmClose:=false;
  close;
end;

procedure TfrmConfirmClose.btnOKClick(Sender: TObject);
begin
   FIsConfirmClose := true;
   close;
end;

procedure TfrmConfirmClose.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
end;

procedure TfrmConfirmClose.SetEndDate(const Value: TDateTime);
begin
  FEndDate := Value;
  edEndDate.Text := FormatDateTime('dd/MM/yyyy',value)
end;

procedure TfrmConfirmClose.SetLocationName(const Value: string);
begin
  FLocationName := Value;
  edLocaton.Text:=value;
end;

procedure TfrmConfirmClose.SetPeroidNo(const Value: string);
begin
  FPeroidNo := Value;
  edPeriod.Text:=value;
end;

procedure TfrmConfirmClose.SetStartDate(const Value: TDateTime);
begin
  FStartDate := Value;
  edStartDate.Text := FormatDateTime('dd/MM/yyyy',value)
end;

procedure TfrmConfirmClose.SetUserName(const Value: string);
begin
  FUserName := Value;
  edUserName.Text :=value;
end;

procedure TfrmConfirmClose.SetWorkStation(const Value: string);
begin
  FWorkStation := Value;
  edWorkStation.Text := value;
end;

end.



