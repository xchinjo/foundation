unit SearchLocationFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel,
  ExtCtrls,ReceiveFrm;

type
  TfrmSearchLocation = class(TForm)
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
    procedure edSearchTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewDblClick(Sender: TObject);
  private
    FIsOK: boolean;
    FselectName: string;
    FselectCode: string;
    FProvinceCode: string;
    FAmphurCode: string;
    FselectTypecode: string;
    FTambonCode: string;
    FMainForm: TfrmReceive;
    procedure SetAmphurCode(const Value: string);
    procedure SetIsOK(const Value: boolean);
    procedure SetMainForm(const Value: TfrmReceive);
    procedure SetProvinceCode(const Value: string);
    procedure SetselectCode(const Value: string);
    procedure SetselectName(const Value: string);
    procedure SetselectTypecode(const Value: string);
    procedure SetTambonCode(const Value: string);
    procedure fillListview();
    { Private declarations }
  public
    { Public declarations }
    property ProvinceCode:string  read FProvinceCode write SetProvinceCode;
    property TambonCode:string  read FTambonCode write SetTambonCode;
    property AmphurCode:string  read FAmphurCode write SetAmphurCode;

    property selectCode:string  read FselectCode write SetselectCode;
    property selectName:string  read FselectName write SetselectName;

    property selectTypecode:string  read FselectTypecode write SetselectTypecode;

    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property IsOK : boolean read FIsOK write SetIsOK;
  end;

var
  frmSearchLocation: TfrmSearchLocation;

implementation

uses CommonLIB, CommonUtils;

{$R *.dfm}

procedure TfrmSearchLocation.FormShow(Sender: TObject);
begin

  cmbSearchType.Items.Clear;
  cmbSearchType.Items.AddObject('����',TString.Create('code1'));
  cmbSearchType.Items.AddObject('����',TString.Create('describe'));
  cmbSearchType.ItemIndex:=1;

  fillListview;

  edSearchText.SetFocus;

end;

procedure TfrmSearchLocation.SetAmphurCode(const Value: string);
begin
  FAmphurCode := Value;
end;

procedure TfrmSearchLocation.SetIsOK(const Value: boolean);
begin
  FIsOK := Value;
end;

procedure TfrmSearchLocation.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmSearchLocation.SetProvinceCode(const Value: string);
begin
  FProvinceCode := Value;
end;

procedure TfrmSearchLocation.SetselectCode(const Value: string);
begin
  FselectCode := Value;
end;

procedure TfrmSearchLocation.SetselectName(const Value: string);
begin
  FselectName := Value;
end;

procedure TfrmSearchLocation.SetselectTypecode(const Value: string);
begin
  FselectTypecode := Value;
end;

procedure TfrmSearchLocation.SetTambonCode(const Value: string);
begin
  FTambonCode := Value;
end;

procedure TfrmSearchLocation.FormKeyDown(Sender: TObject; var Key: Word;
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
        ListViewDblClick(sender);
      end;
  end;
end;

procedure TfrmSearchLocation.fillListview;
var 
  item : TListItem;

begin
  with FMainForm.cdsAddrLocation do
  begin
    Close;
    CommandText:=''+


    ' declare @provincecode varchar(12) '+
    ' declare @amphurcode varchar(12) '+
    ' declare @tamboncode varchar(12) '+
    ' declare @codetype varchar(2) '+
    ' declare @searchcode varchar(50) '+
   // ' declare @searchtext varchar(255) '+

    ' set @searchcode='''+trim(edSearchText.Text)+''' '+
  //  ' set @searchtext='''++''' '+


    ' set @provincecode='''+FProvinceCode+''' /* -- 34		=40 */ '+
    ' set @amphurcode='''+FAmphurCode+''' /* -- 3415		=41   3401,3402 */ '+
    ' set @tamboncode='''+FTambonCode+''' /*-- 341521		=42 */ '+
    ' set @codetype='''+FselectTypecode+''' '+


    ' select * from ( '+
    ' select * from lookup_code '+
    ' where '+
    ' (   '+
    ' 	/* provice */ '+
    ' 	(      '+
    ' 		(( @provincecode <> '''' and code1 =@provincecode ) and code_type=''40''  ) '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @amphurcode <> '''' and code1 like left(@amphurcode,2)+''%'' ) and code_type=''40''  ) '+
    ' 		or (code_type=''40'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''') '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @tamboncode <> '''' and code1 like left(@tamboncode,2)+''%'' ) and code_type=''40''  ) '+
    ' 		or (code_type=''40'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''' ) '+
    ' 	) '+



    ' ) and used_flag<>''C'' '+
    ' union select * from lookup_code where '+
    ' ( '+
    ' 	/* amphur */ '+

    ' 	( '+
    ' 		(( @amphurcode <> '''' and code1 =@amphurcode ) and code_type=''41''  ) '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @provincecode <> '''' and @amphurcode='''' and code1 like @provincecode+''%'' ) and code_type=''41''  ) '+
    ' 		or (code_type=''41'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''') '+
    ' 	) or  '+
    ' 	( '+
    ' 		(( @tamboncode <> '''' and code1 like left(@tamboncode,4)+''%'' ) and code_type=''41''  ) '+
    ' 		or (code_type=''41'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''' ) '+
    ' 	) '+

    ' )and used_flag<>''C'' '+
    ' union select * from lookup_code where '+
    ' ( '+
    ' 	/* tambon */ '+

    ' 	( '+
    ' 		(( @tamboncode <> '''' and code1 =@tamboncode ) and code_type=''42''  ) '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @provincecode <> '''' and @amphurcode='''' and @tamboncode='''' and  code1 like @provincecode+''%'' ) and code_type=''42''  ) '+
    ' 		or (code_type=''42'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''') '+
    ' 	) or '+
    ' 	( '+
    ' 		(( @amphurcode <> '''' and @tamboncode='''' and code1 like @amphurcode+''%'' ) and code_type=''42''  ) '+
    ' 		or (code_type=''42'' and @amphurcode='''' and @tamboncode='''' and @provincecode='''' ) '+
    ' 	) '+

    ' ) and used_flag<>''C'' '+
    ' ) xx where xx.code_type=@codetype ' +
    '      and ( '+
    '        (@searchcode='''') or (  '+TString(cmbSearchType.Items.Objects[cmbSearchType.ItemIndex]).Str+' like @searchcode+''%'') '+
    '      ) ';


    //InputBox('','',CommandText);

    open;




    ListView.Items.Clear;
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

          if not FMainForm.cdsAddrLocation.eof then FMainForm.cdsAddrLocation.Next;
        end;
      end;
    Screen.Cursor:=crDefault;
  end;

end;

procedure TfrmSearchLocation.btnSearchClick(Sender: TObject);
begin
  fillListview;
  edSearchText.SetFocus;
end;

procedure TfrmSearchLocation.edSearchTextKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then btnSearchClick(sender);
  if key=vk_down then ListView.SetFocus;
end;

procedure TfrmSearchLocation.ListViewDblClick(Sender: TObject);
begin
  if ListView.Focused then
    if ListView.Selected<>nil then
    begin
      IsOK := true;
      FselectCode := TString(ListView.Selected.Data).Str;
      FselectName :=  ListView.Selected.SubItems.Strings[0];
      close;
    end;
end;

end.
