unit ObjectiveFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, RzPanel, StdCtrls, Mask, RzEdit, RzCmboBx,ReceiveFrm, DBClient, CommonLIB,
  RzButton;

type
  TfrmObjective = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    ListView: TListView;
    Label7: TLabel;
    cmbSearchType: TRzComboBox;
    Label1: TLabel;
    edSearchText: TRzEdit;
    btnSearch: TRzBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
  private
    Fselectcode: string;
    FselectFundCode: string;
    FMainForm: TfrmReceive;
    procedure Setselectcode(const Value: string);
    procedure SetselectFundCode(const Value: string);
    procedure SetMainForm(const Value: TfrmReceive);
    procedure FillListview();
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property selectcode :string read Fselectcode write Setselectcode;
    property selectFundCode : string read FselectFundCode write SetselectFundCode;
  end;

var
  frmObjective: TfrmObjective;

implementation

uses  FundInfoFrm, FundListFrm;

{$R *.dfm}

procedure TfrmObjective.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then
    if (( not ListView.Focused) and (not cmbSearchType.Focused)) then
    begin
        ListView.SetFocus;
    end;


  if key = vk_escape then
  begin
    close;
  end;
  if key = vk_return then
  begin
      ListViewDblClick(sender);
  end;
end;

procedure TfrmObjective.FormShow(Sender: TObject);
begin

  cmbSearchType.Items.Clear;
  cmbSearchType.Items.AddObject('รหัส',TString.Create('o_code'));
  cmbSearchType.Items.AddObject('วัตถุประสงค์',TString.Create('o_title'));
  cmbSearchType.ItemIndex:=1;

  FillListview;
  edSearchText.SetFocus;
end;

procedure TfrmObjective.Setselectcode(const Value: string);
begin
  Fselectcode := Value;
end;

procedure TfrmObjective.FormCreate(Sender: TObject);
begin
 Fselectcode:='';
end;

procedure TfrmObjective.SetselectFundCode(const Value: string);
begin
  FselectFundCode := Value;
end;

procedure TfrmObjective.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmObjective.btnSearchClick(Sender: TObject);
begin
    FMainForm.cdsObjective.Close;
    FMainForm.cdsObjective.CommandText:='select * from ( select cast(o_code as integer ) roworder,* from object_code where isnull(o_status,'''')<>''C'' ) aa where '+trim(TString(cmbSearchType.Items.Objects[cmbSearchType.ItemIndex]).Str)+' like '''+trim(edSearchText.Text)+'%'' order by roworder';
    FMainForm.cdsObjective.Open;
    FillListview;
end;

procedure TfrmObjective.FillListview;
var
  item : TListItem;
begin
 if FMainForm.cdsObjective.Active then
   with  FMainForm.cdsObjective do
   begin
      self.Caption:='วัตถุประสงค์ ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not FMainForm.cdsObjective.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('o_code').AsString;
         item.SubItems.Add(fieldbyname('o_title').AsString) ;
         item.Data := TString.Create(fieldbyname('o_code').AsString);
        if not FMainForm.cdsObjective.Eof then next;
      end;
   end;
end;

procedure TfrmObjective.ListViewDblClick(Sender: TObject);
var
 frmFundL : TfrmFundList;
 frmFundInf : TfrmFundInfo;

begin
    if edSearchText.Focused then
      begin
        btnSearchClick(nil);
      end;


    if ListView.Selected<> nil then
      if ListView.Focused then
        begin
          Fselectcode:=TString(ListView.Selected.Data).Str;

            if trim(Fselectcode) <> '' then
            begin
               //if frmAddObj.selectcode<>'0' then
               with FMainForm do
               begin

                  // search fundation group
                  cdsFund.Close;
                  cdsFund.CommandText:='select o_codefd,o_flag,o_code from object_code where o_code ='''+Fselectcode+''' and o_status<>''C'' order by  cast(o_code as integer )';
                  cdsFund.Open;




                  if cdsFund.Active then
                   if uppercase(trim(cdsFund.FieldByName('o_flag').AsString))='N' then      // check flag create new fundation
                   begin
                    frmFundInf := TfrmFundInfo.Create(self);
                    frmFundInf.MainForm:=FMainForm;
                    frmFundInf.ObjectiveCode := cdsFund.FieldByName('o_code').AsString;
                    frmFundInf.Codetype := cdsFund.FieldByName('o_codefd').AsString;
                    frmFundInf.ShowModal;
                    frmFundInf.Free;
                   end
                   else if uppercase(trim(cdsFund.FieldByName('o_flag').AsString))='I' then   //
                   with cdsFund do
                    begin
                      if RecordCount>0 then
                      begin
                        // get sub fundation list send to dialog
                        cdsFundList.Close;
                        cdsFundList.CommandText:='select * from found_code where (fd_codetype = '+cdsFund.fieldbyname('o_codefd').asstring+') and (isnull(upper(fd_status) ,'''') <> ''C'') order by fd_code';
                        cdsFundList.Open;
                        if cdsFundList.RecordCount>0 then
                        begin
                          //Fselectcode :='';
                          frmFundL:=TfrmFundList.Create(self);
                          frmFundL.FundGroupCode :=cdsFund.fieldbyname('o_codefd').asstring;
                          frmFundL.MainForm:=FMainForm;
                          frmFundL.ShowModal;
                          FselectFundCode := frmFundL.SelectCode;
                          frmFundL.Free;
                        end;
                      end;
                    end
                   else if uppercase(trim(cdsFund.FieldByName('o_flag').AsString))='A' then
                    FselectFundCode:=Fselectcode;

               end;
            end;

          if trim(FselectFundCode)<>'' then close;
        end;

end;

end.
