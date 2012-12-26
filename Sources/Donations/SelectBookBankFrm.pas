unit SelectBookBankFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel,
  ExtCtrls,ReceiveFrm;

type
  TfrmSelectBookBank = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    Label1: TLabel;
    cmbSearchType: TRzComboBox;
    edSearchText: TRzEdit;
    btnSearch: TRzBitBtn;
    ListView: TListView;
    procedure FormShow(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FMainForm: TfrmReceive;
    FSelectBookID: string;
    FIsOK: boolean;
    procedure SetMainForm(const Value: TfrmReceive);
    { Private declarations }
    procedure FillListview();
    procedure SetSelectBookID(const Value: string);
    procedure SetIsOK(const Value: boolean);
  public
    { Public declarations }
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property SelectBookID :string read FSelectBookID write SetSelectBookID;
    property IsOK : boolean read FIsOK write SetIsOK;
  end;

var
  frmSelectBookBank: TfrmSelectBookBank;

implementation

uses DBClient, CommonLIB, CommonUtils;

{$R *.dfm}

{ TfrmSelectBookBank }

procedure TfrmSelectBookBank.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmSelectBookBank.FormShow(Sender: TObject);
var strSQL:string;
begin
  cmbSearchType.Items.Clear;
  cmbSearchType.Items.AddObject('รหัส',TString.Create('BankBookID'));
  cmbSearchType.Items.AddObject('เลขบัญชี',TString.Create('BookNo'));
  cmbSearchType.Items.AddObject('ชื่อบัญชี',TString.Create('BankBookName'));
  cmbSearchType.Items.AddObject('รหัสธนาคาร',TString.Create('bankcode'));
  cmbSearchType.Items.AddObject('ชื่อธนาคาร',TString.Create('bankname'));
  cmbSearchType.ItemIndex:=0;

  with FMainForm.cdsBookBank do
  begin
    close;
    CommandText:=''+//'select BankBookID,BookNo,BankBookName from dbo.san$BANKBOOK where Inactive=''A'' and bankbookid not in (''1000047'',''1000035'',''1000036'') order by BankBookID';
    ' select a.BankBookID,a.BookNo,a.BankBookName,b.bankcode,b.bankname '+
    ' from dbo.san$BANKBOOK  a '+
    ' left join san$BANK  b on a.BankID=b.bankid '+
    ' where a.Inactive=''A''  and a.bankbookid not in (''1000047'',''1000035'',''1000036'') '+
    ' order by a.BankBookID ';
    Screen.Cursor:=crHourGlass;
    open;
    if FMainForm.cdsBookBank.RecordCount>0 then
      FillListview;

    Screen.Cursor:=crDefault;

  end;

  edSearchText.SetFocus;

end;

procedure TfrmSelectBookBank.FillListview;
var
  item : TListItem;
begin
 if FMainForm.cdsBookBank.Active then
   with  FMainForm.cdsBookBank do
   begin
      self.Caption:='รายชื่อสมุดบัญชี ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not FMainForm.cdsBookBank.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('BankBookID').AsString;
         item.SubItems.Add(fieldbyname('BookNo').AsString) ;
         item.SubItems.Add(fieldbyname('BankBookName').AsString) ;
         item.SubItems.Add(fieldbyname('bankcode').AsString) ;
         item.SubItems.Add(fieldbyname('bankname').AsString) ;
         item.Data := TString.Create(fieldbyname('BankBookID').AsString);
        if not FMainForm.cdsBookBank.Eof then next;
      end;
   end;

   edSearchText.SetFocus;
end;

procedure TfrmSelectBookBank.SetSelectBookID(const Value: string);
begin
  FSelectBookID := Value;
end;

procedure TfrmSelectBookBank.ListViewDblClick(Sender: TObject);
begin
  FSelectBookID:=TString(ListView.Selected.Data).Str;
  close;
end;

procedure TfrmSelectBookBank.FormKeyDown(Sender: TObject; var Key: Word;
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
      ListViewDblClick(sender);
    end;
  end;
end;

procedure TfrmSelectBookBank.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmSelectBookBank.btnSearchClick(Sender: TObject);
begin
  with FMainForm.cdsBookBank do
  begin
    close;
    CommandText:=''+
    ' select a.BankBookID,a.BookNo,a.BankBookName,b.bankcode,b.bankname '+
    ' from dbo.san$BANKBOOK  a '+
    ' left join san$BANK  b on a.BankID=b.bankid '+
    ' where a.Inactive=''A''  and a.bankbookid not in (''1000047'',''1000035'',''1000036'') '+
    ' and ( ' +trim(TString(cmbSearchType.Items.Objects[cmbSearchType.ItemIndex]).Str)+' like '''+trim(edSearchText.Text)+'%'' ) '+
    ' order by a.BankBookID ';
    open;
    if FMainForm.cdsBookBank.RecordCount>0 then
      FillListview;
    edSearchText.SetFocus;      
  end;
end;

procedure TfrmSelectBookBank.edSearchTextKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSearchClick(sender);
  if key=vk_down then ListView.SetFocus;
end;

end.


