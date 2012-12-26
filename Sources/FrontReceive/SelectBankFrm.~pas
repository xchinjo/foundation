unit SelectBankFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls;

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
    procedure SetbankCode(const Value: string);
    procedure SetbankName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property bankCode : string read FbankCode write SetbankCode;
    property bankName : string read FbankName write SetbankName;
  end;

var
  frmSelectBank: TfrmSelectBank;

implementation

uses ReceiveFrm, CommonLIB;

{$R *.dfm}

procedure TfrmSelectBank.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then close;
  if key = vk_return then
  begin
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

 if frmReceive.cdsBankCode.Active then
   with  frmReceive.cdsBankCode do
   begin
      self.Caption:='ธนาคาร ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not frmReceive.cdsBankCode.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('bk_code').AsString;
         item.SubItems.Add(fieldbyname('bk_title').AsString) ;
         item.Data := TString.Create(fieldbyname('bk_code').AsString);
        if not frmReceive.cdsBankCode.Eof then next;
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

end.
