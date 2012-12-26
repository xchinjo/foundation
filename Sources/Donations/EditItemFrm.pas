unit EditItemFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls,ReceiveFrm,
  RzButton;

type
  TfrmEditItem = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label3: TLabel;
    edObjtiveName: TRzEdit;
    edFundName: TRzEdit;
    Label11: TLabel;
    edAmount: TRzNumericEdit;
    Label1: TLabel;
    btnOK: TRzBitBtn;
    btnCancel: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure edAmountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
  private
    FitemAmount: currency;
    FitemFundCode: string;
    FitemObjCode: string;
    FMainForm: TfrmReceive;
    procedure SetitemAmount(const Value: currency);
    procedure SetitemFundCode(const Value: string);
    procedure SetitemObjCode(const Value: string);
    procedure SetMainForm(const Value: TfrmReceive);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property itemAmount : currency read FitemAmount write SetitemAmount;
    property itemObjCode : string read FitemObjCode write SetitemObjCode;
    property itemFundCode : string read FitemFundCode write SetitemFundCode;
  end;

var
  frmEditItem: TfrmEditItem;

implementation



{$R *.dfm}

{ TfrmEditItem }

procedure TfrmEditItem.SetitemAmount(const Value: currency);
begin
  FitemAmount := Value;
  edAmount.Value:=value;
end;

procedure TfrmEditItem.SetitemFundCode(const Value: string);
begin
  FitemFundCode := Value;
  edFundName.Text := value;
end;

procedure TfrmEditItem.SetitemObjCode(const Value: string);
begin
  FitemObjCode := Value;
  edObjtiveName.Text:=value;
end;

procedure TfrmEditItem.FormShow(Sender: TObject);
begin
 edAmount.SetFocus;
 edAmount.SelectAll;
end;

procedure TfrmEditItem.edAmountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_return then
  begin
     btnOKClick(sender);
  end;
end;

procedure TfrmEditItem.btnOKClick(Sender: TObject);
begin
  itemAmount:=edAmount.Value;
  self.Close;
end;

procedure TfrmEditItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then btnCancelClick(sender);
end;

procedure TfrmEditItem.btnCancelClick(Sender: TObject);
begin
 self.Close;
end;

procedure TfrmEditItem.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

end.
