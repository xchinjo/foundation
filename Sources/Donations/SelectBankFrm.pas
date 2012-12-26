unit SelectBankFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls,ReceiveFrm, CommonLIB;

type
  TfrmSelectBank = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    Label8: TLabel;
    RzComboBox2: TRzComboBox;
    edDonatorName: TRzEdit;
    ListView: TListView;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FbankCode: string;
    FbankName: string;
    FMainForm: TfrmReceive;
    FIsOK: boolean;
    procedure SetbankCode(const Value: string);
    procedure SetbankName(const Value: string);
    procedure SetMainForm(const Value: TfrmReceive);
    procedure SetIsOK(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property bankCode : string read FbankCode write SetbankCode;
    property bankName : string read FbankName write SetbankName;
    property IsOK :boolean read FIsOK write SetIsOK;
  end;

var
  frmSelectBank: TfrmSelectBank;

implementation



{$R *.dfm}

procedure TfrmSelectBank.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
  begin
    IsOK := false;
    close;
  end;
  if key = vk_return then
  begin
    IsOK := true;
    if ListView.Selected<> nil then
    begin
      FbankCode:=TString(ListView.Selected.Data).Str;
      FbankName:=ListView.Selected.SubItems.Text;
      close;
    end;
  end;
end;


procedure TfrmSelectBank.FormShow(Sender: TObject);
var
  item : TListItem;
begin

 if FMainForm.cdsBankCode.Active then
   with  FMainForm.cdsBankCode do
   begin
      self.Caption:='ธนาคาร ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not FMainForm.cdsBankCode.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('bankcode').AsString;
         item.SubItems.Add(fieldbyname('bankname').AsString) ;
         item.Data := TString.Create(fieldbyname('bankcode').AsString);
        if not FMainForm.cdsBankCode.Eof then next;
      end;
   end;
end;
procedure TfrmSelectBank.SetbankCode(const Value: string);
begin
  FbankCode := Value;
end;

procedure TfrmSelectBank.SetbankName(const Value: string);
begin
  FbankName := Value;
end;

procedure TfrmSelectBank.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmSelectBank.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

end.
