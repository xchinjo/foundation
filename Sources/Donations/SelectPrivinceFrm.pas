unit SelectPrivinceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel,
  ExtCtrls,ReceiveFrm;

type
  TfrmSelectPrivince = class(TForm)
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
  private
    FProvinceCode: string;
    FProvinceName: string;
    FMainForm: TfrmReceive;
    FIsOK: boolean;
    FparentCode: string;
    procedure SetProvinceCode(const Value: string);
    procedure SetProvinceName(const Value: string);
    procedure SetMainForm(const Value: TfrmReceive);
    procedure SetIsOK(const Value: boolean);
    procedure SetparentCode(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property ProvinceCode:string read FProvinceCode write SetProvinceCode;
    property ProvinceName:string read FProvinceName write SetProvinceName;
    property parentCode:string read FparentCode write SetparentCode;
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property IsOK : boolean read FIsOK write SetIsOK;
  end;

var
  frmSelectPrivince: TfrmSelectPrivince;

implementation

uses DBClient, CommonLIB, CommonUtils;

{$R *.dfm}

{ TfrmSelectPrivince }

procedure TfrmSelectPrivince.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmSelectPrivince.SetProvinceCode(const Value: string);
begin
  FProvinceCode := Value;
end;

procedure TfrmSelectPrivince.SetProvinceName(const Value: string);
begin
  FProvinceName := Value;
end;

procedure TfrmSelectPrivince.FormShow(Sender: TObject);
var rowcount:integer;
  item : TListItem;
begin
  with FMainForm.cdsAddrLocation do
  begin
    Close;
    CommandText:='select * from lookup_code where code_type=''40'' order by describe';
    open;


    ListView.Items.Clear;
    rowcount:=0;
    Screen.Cursor:=crHourGlass;

    if active then
      if recordcount>0 then
      begin
        first;
        self.caption:='������ '+ FormatCurr('#,##0',FMainForm.cdsAddrLocation.recordcount)+' ��¡��';
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

{

begin
  ListView.Items.Clear;
  rowcount:=0;
  Screen.Cursor:=crHourGlass;



  with FMainForm.cdsSearch do
  begin
    first;
      self.caption:='������ '+ FormatCurr('#,##0',FMainForm.cdsSearch.recordcount)+' ��¡��';
    while not FMainForm.cdsSearch.Eof do
    begin
       item := ListView.Items.Add;
       item.Caption:= FMainForm.cdsSearch.fieldbyname('do_prename').AsString;
       item.SubItems.add(FMainForm.cdsSearch.fieldbyname('do_name').AsString);
       item.SubItems.Add(FMainForm.cdsSearch.fieldbyname('do_lname').AsString) ;
       item.SubItems.Add(FMainForm.cdsSearch.fieldbyname('do_id').AsString) ;
       item.Data := TString.Create(FMainForm.cdsSearch.fieldbyname('do_id').AsString);
       //inc(rowcount);

      if not FMainForm.cdsSearch.eof then FMainForm.cdsSearch.Next;
    end;
  end;
  Screen.Cursor:=crDefault;

end;
}

procedure TfrmSelectPrivince.FormKeyDown(Sender: TObject; var Key: Word;
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
          FProvinceCode := TString(ListView.Selected.Data).Str;
         // FProvinceName := ListView.Selected.Caption;
          FProvinceName :=  ListView.Selected.SubItems.Strings[0];
          //FdonatorLName := ListView.Selected.SubItems.Strings[1];
          close;
        end;
      end;
  end;
end;

procedure TfrmSelectPrivince.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmSelectPrivince.SetparentCode(const Value: string);
begin
  FparentCode := Value;
end;

end.





