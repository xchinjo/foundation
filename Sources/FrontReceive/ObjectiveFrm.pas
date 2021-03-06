unit ObjectiveFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, RzPanel, StdCtrls, Mask, RzEdit, RzCmboBx;

type
  TfrmObjective = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    ListView: TListView;
    RzComboBox2: TRzComboBox;
    Label7: TLabel;
    Label8: TLabel;
    edDonatorName: TRzEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fselectcode: string;
    FselectFundCode: string;
    procedure Setselectcode(const Value: string);
    procedure SetselectFundCode(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property selectcode :string read Fselectcode write Setselectcode;
    property selectFundCode : string read FselectFundCode write SetselectFundCode;
  end;

var
  frmObjective: TfrmObjective;

implementation

uses ReceiveFrm, DBClient, CommonLIB, FundInfoFrm, FundListFrm;

{$R *.dfm}

procedure TfrmObjective.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 frmFundL : TfrmFundList;
 frmFundInf : TfrmFundInfo;
begin
  if key = vk_escape then
  begin
    close;
  end;
  if key = vk_return then
  begin
    if ListView.Selected<> nil then
    begin
      Fselectcode:=TString(ListView.Selected.Data).Str;

        if trim(Fselectcode) <> '' then
        begin
           //if frmAddObj.selectcode<>'0' then
           with frmReceive do
           begin

              // search fundation group
              cdsFund.Close;
              cdsFund.CommandText:='select o_codefd,o_flag from object_code where o_code ='''+Fselectcode+''' and o_status<>''C'' order by  cast(o_code as integer )';
              cdsFund.Open;




              if cdsFund.Active then
               if uppercase(trim(cdsFund.FieldByName('o_flag').AsString))='N' then      // check flag create new fundation
               begin
                  frmFundInf := TfrmFundInfo.Create(self);
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
                      //frmFundL.FundGroupCode :=cdsFund.fieldbyname('o_codefd').asstring;
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
end;

procedure TfrmObjective.FormShow(Sender: TObject);
var
  item : TListItem;
begin

 if frmReceive.cdsObjective.Active then
   with  frmReceive.cdsObjective do
   begin
      self.Caption:='�ѵ�ػ��ʧ�� ( �ӹǹ '+inttostr(recordcount)+' ��¡�� )';
      ListView.Items.Clear;
      first;
      while not frmReceive.cdsObjective.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('o_code').AsString;
         item.SubItems.Add(fieldbyname('o_title').AsString) ;
         item.Data := TString.Create(fieldbyname('o_code').AsString);
        if not frmReceive.cdsObjective.Eof then next;
      end;
   end;
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

end.
