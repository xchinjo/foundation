unit FundListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls;

type
  TfrmFundList = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    Label8: TLabel;
    RzComboBox2: TRzComboBox;
    edDonatorName: TRzEdit;
    ListView: TListView;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FFundGroupCode: string;
    FSelectCode: string;
    procedure SetFundGroupCode(const Value: string);
    procedure SetSelectCode(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property FundGroupCode : string read FFundGroupCode write SetFundGroupCode;
    property SelectCode : string  read FSelectCode write SetSelectCode;
  end;

var
  frmFundList: TfrmFundList;

implementation

uses ReceiveFrm, CommonLIB;

{$R *.dfm}

{ TfrmFundList }

procedure TfrmFundList.SetFundGroupCode(const Value: string);
begin
  FFundGroupCode := Value;
end;

procedure TfrmFundList.FormShow(Sender: TObject);
var
  item : TListItem;
begin

 if frmReceive.cdsFundList.Active then
   with  frmReceive.cdsFundList do
   begin
      self.Caption:='กองทุน ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not frmReceive.cdsFundList.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('fd_code').AsString;
         item.SubItems.Add(fieldbyname('fd_title').AsString) ;
         item.Data := TString.Create(fieldbyname('fd_code').AsString);
        if not frmReceive.cdsFundList.Eof then next;
      end;
   end;
end;

procedure TfrmFundList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then close;
  if key = vk_return then
  begin
    if ListView.Selected<> nil then
    begin
      FSelectCode:=TString(ListView.Selected.Data).Str;
      close;
    end;
  end;
end;

procedure TfrmFundList.SetSelectCode(const Value: string);
begin
  FSelectCode := Value;
end;

end.
