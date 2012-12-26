unit SelectAmphurFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel,
  ExtCtrls,ReceiveFrm;

type
  TfrmSelectAmphur = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    Label1: TLabel;
    cmbSearchType: TRzComboBox;
    edSearchText: TRzEdit;
    btnSearch: TRzBitBtn;
    ListView: TListView;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
  private
    FIsOK: boolean;
    FAmphurCode: string;
    FAmphurName: string;
    FMainForm: TfrmReceive;
    FparentCode: string;
    FCode1: string;
    procedure SetAmphurCode(const Value: string);
    procedure SetAmphurName(const Value: string);
    procedure SetIsOK(const Value: boolean);
    procedure SetMainForm(const Value: TfrmReceive);
    procedure SetparentCode(const Value: string);
    procedure SetCode1(const Value: string);
    procedure fillListview();
    { Private declarations }
  public
    { Public declarations }
    property AmphurCode:string  read FAmphurCode write SetAmphurCode;
    property AmphurName:string  read FAmphurName write SetAmphurName;
    property parentCode:string read FparentCode write SetparentCode;
    property MainForm : TfrmReceive  read FMainForm write SetMainForm;
    property Code1 : string read FCode1 write SetCode1;
    property IsOK : boolean  read FIsOK write SetIsOK;
  end;

var
  frmSelectAmphur: TfrmSelectAmphur;

implementation

uses CommonLIB, CommonUtils;

{$R *.dfm}

{ TfrmSelectAmphur }

procedure TfrmSelectAmphur.SetAmphurCode(const Value: string);
begin
  FAmphurCode := Value;
end;

procedure TfrmSelectAmphur.SetAmphurName(const Value: string);
begin
  FAmphurName := Value;
end;

procedure TfrmSelectAmphur.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmSelectAmphur.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmSelectAmphur.FormShow(Sender: TObject);
begin
  cmbSearchType.Items.Clear;
  cmbSearchType.Items.AddObject('รหัส',TString.Create('code1'));
  cmbSearchType.Items.AddObject('ชื่อ',TString.Create('describe'));
  cmbSearchType.ItemIndex:=1;


  FMainForm.cdsAddrLocation.Close;
  FMainForm.cdsAddrLocation.CommandText:=''+//'select * from lookup_code where code_type=''42'' order by describe';

   ' declare @parentcode varchar(12) '+
   ' set @parentcode='''+FparentCode+'''  '+
   ' select * from lookup_code '+
   ' where '+
   ' ( '+
   '   (( @parentcode <> '''' and code1 like @parentcode+''%'' ) and code_type=''41''  ) '+
   '   or (code_type=''41'' and @parentcode='''') '+
   ' ) ';

  //inputbox('','',CommandText);

  FMainForm.cdsAddrLocation.open;
  fillListview;

end;
{
var
  item : TListItem;
begin
  with FMainForm.cdsAddrLocation do
  begin
    Close;
    CommandText:=''+//'select * from lookup_code where code_type=''42'' order by describe';

     ' declare @parentcode varchar(12) '+
     ' set @parentcode='''+FparentCode+'''  '+
     ' select * from lookup_code '+
     ' where '+
     ' ( '+
     '   (( @parentcode <> '''' and code1 like @parentcode+''%'' ) and code_type=''41''  ) '+
     '   or (code_type=''41'' and @parentcode='''') '+
     ' ) ';

    //inputbox('','',CommandText);

    open;


    ListView.Items.Clear;

    Screen.Cursor:=crHourGlass;

    if active then
      if recordcount>0 then
      begin
        first;
        self.caption:='ทั้งหมด '+ FormatCurr('#,##0',FMainForm.cdsAddrLocation.recordcount)+' รายการ';
        while not FMainForm.cdsAddrLocation.Eof do
        begin
           item := ListView.Items.Add;
           item.Caption:= FMainForm.cdsAddrLocation.fieldbyname('code1').AsString;
           item.SubItems.add(FMainForm.cdsAddrLocation.fieldbyname('describe').AsString);
           item.Data := TString.Create(FMainForm.cdsAddrLocation.fieldbyname('code1').AsString);
           //inc(rowcount);

          if not FMainForm.cdsAddrLocation.eof then FMainForm.cdsAddrLocation.Next;
        end;
      end;
    Screen.Cursor:=crDefault;
  end;

end;
}

procedure TfrmSelectAmphur.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_escape:
      begin
        IsOK := false;
        self.Close;
      end;
    vk_return:
      begin
        IsOK := true;
        if ListView.Selected<>nil then
        begin
          FAmphurCode := TString(ListView.Selected.Data).Str;
         // FProvinceName := ListView.Selected.Caption;
          FAmphurName :=  ListView.Selected.SubItems.Strings[0];
          //FdonatorLName := ListView.Selected.SubItems.Strings[1];
          close;
        end;
      end;
  end;
end;
procedure TfrmSelectAmphur.SetparentCode(const Value: string);
begin
  FparentCode := Value;
end;

procedure TfrmSelectAmphur.SetCode1(const Value: string);
begin
  FCode1 := Value;
end;





procedure TfrmSelectAmphur.fillListview;
var
  item : TListItem;
begin
  with FMainForm.cdsAddrLocation do
  begin
    ListView.Items.Clear;

    Screen.Cursor:=crHourGlass;

    if active then
      if recordcount>0 then
      begin
        first;
        self.caption:='ทั้งหมด '+ FormatCurr('#,##0',FMainForm.cdsAddrLocation.recordcount)+' รายการ';
        while not FMainForm.cdsAddrLocation.Eof do
        begin
           item := ListView.Items.Add;
           item.Caption:= FMainForm.cdsAddrLocation.fieldbyname('code1').AsString;
           item.SubItems.add(FMainForm.cdsAddrLocation.fieldbyname('describe').AsString);
           item.Data := TString.Create(FMainForm.cdsAddrLocation.fieldbyname('code1').AsString);
           //inc(rowcount);

          if not FMainForm.cdsAddrLocation.eof then FMainForm.cdsAddrLocation.Next;
        end;
      end;
    Screen.Cursor:=crDefault;
  end;

end;

procedure TfrmSelectAmphur.btnSearchClick(Sender: TObject);
begin
  FMainForm.cdsAddrLocation.close;
  FMainForm.cdsAddrLocation.CommandText:=''+
     ' declare @parentcode varchar(12) '+
     ' set @parentcode='''+FparentCode+'''  '+
     ' select * from lookup_code '+
     ' where '+
     ' ( '+
     '   (( @parentcode <> '''' and '+trim(TString(cmbSearchType.Items.Objects[cmbSearchType.ItemIndex]).Str)+' like '+trim(edSearchText.Text)+'+''%'' ) and code_type=''41''  ) '+
     '   or (code_type=''41'' and @parentcode='''') '+
     ' ) ';
  FMainForm.cdsAddrLocation.open;
  fillListview;

end;

end.
