unit FundListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls, CommonLIB,
  RzButton, DB, DBClient, DBXpress, FMTBcd, Provider, SqlExpr;

type
  TfrmFundList = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    cmbSearchType: TRzComboBox;
    edSearchText: TRzEdit;
    ListView: TListView;
    Label1: TLabel;
    btnSearch: TRzBitBtn;
    cdsFundList: TClientDataSet;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewDblClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    FFundGroupCode: string;
    FSelectCode: string;
    FselectName: string;
    FDLLParameter: TDLLParameter;

    procedure SetFundGroupCode(const Value: string);
    procedure SetSelectCode(const Value: string);
    procedure fillListview();
    procedure SetselectName(const Value: string);
    procedure SetDLLParameter(const Value: TDLLParameter);
    { Private declarations }
  public
    { Public declarations }
    property FundGroupCode : string read FFundGroupCode write SetFundGroupCode;
    property SelectCode : string  read FSelectCode write SetSelectCode;
    property selectName : string read FselectName write SetselectName;
    property DLLParameter : TDLLParameter read FDLLParameter write SetDLLParameter;
  end;

var
  frmFundList: TfrmFundList;

implementation


{$R *.dfm}

{ TfrmFundList }

procedure TfrmFundList.SetFundGroupCode(const Value: string);
begin
  FFundGroupCode := Value;
end;

procedure TfrmFundList.FormShow(Sender: TObject);

begin

  cmbSearchType.Items.Clear;
  cmbSearchType.Items.AddObject('รหัส',TString.Create('fd_code'));
  cmbSearchType.Items.AddObject('ชื่อกองทุน',TString.Create('fd_title'));
  cmbSearchType.ItemIndex:=1;

  edSearchText.SetFocus;
  edSearchText.SelectAll;

  //cdsFundList.Close;
  //cdsFundList.CommandText:='select * from found_code ';
  //cdsFundList.Open;
  edSearchText.Text := DLLParameter.ParameterString1;
  btnSearchClick(sender);


  fillListview;
end;

procedure TfrmFundList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then close;
  if key = vk_return then
  begin
      if ListView.Selected<> nil then
       if ListView.Focused then
        begin
          ListViewDblClick(sender);
        end;

      if edSearchText.Focused then
        begin
          btnSearchClick(nil);
        end;




  end;


  if key = vk_down then
    if (( not ListView.Focused) and (not cmbSearchType.Focused)) then
    begin
        ListView.SetFocus;
    end;

end;

procedure TfrmFundList.SetSelectCode(const Value: string);
begin
  FSelectCode := Value;
end;


procedure TfrmFundList.ListViewDblClick(Sender: TObject);
begin
    FSelectCode:=TString(ListView.Selected.Data).Str;
    FselectName := ListView.Selected.SubItems.Strings[0];
    close;
end;

procedure TfrmFundList.btnSearchClick(Sender: TObject);
begin
    cdsFundList.Close;
  //  cdsFundList.CommandText:='select * from found_code ';
    cdsFundList.CommandText:='select * from found_code where  '+trim(TString(cmbSearchType.Items.Objects[cmbSearchType.ItemIndex]).Str)+' like '''+edSearchText.Text+'%'' and (isnull(upper(fd_status) ,'''') <> ''C'') order by fd_code';
    cdsFundList.Open;
    fillListview;
end;

procedure TfrmFundList.fillListview;
var
  item : TListItem;
begin
 if cdsFundList.Active then
   with  cdsFundList do
   begin
      self.Caption:='กองทุน ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not cdsFundList.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('fd_code').AsString;
         item.SubItems.Add(fieldbyname('fd_title').AsString) ;
         item.Data := TString.Create(fieldbyname('fd_code').AsString);
        if not cdsFundList.Eof then next;
      end;
   end;
end;

procedure TfrmFundList.SetselectName(const Value: string);
begin
  FselectName := Value;
end;

procedure TfrmFundList.SetDLLParameter(const Value: TDLLParameter);
begin
  FDLLParameter := Value;
end;

end.
