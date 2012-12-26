unit SelectAccCodeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls;

type
  TfrmSelectAccCode = class(TForm)
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
    FSelectAccCode: string;
    FSelectAccName: string;
    FSelectAccNo: string;
    procedure SetSelectAccCode(const Value: string);
    procedure SetSelectAccName(const Value: string);
    procedure SetSelectAccNo(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property SelectAccCode : string read FSelectAccCode write SetSelectAccCode;
    property SelectAccName : string read FSelectAccName write SetSelectAccName;
    property SelectAccNo : string read FSelectAccNo write SetSelectAccNo;
  end;

var
  frmSelectAccCode: TfrmSelectAccCode;

implementation

uses ReceiveFrm, CommonLIB;

{$R *.dfm}

{ TfrmSelectAccCode }

procedure TfrmSelectAccCode.SetSelectAccCode(const Value: string);
begin
  FSelectAccCode := Value;
end;

procedure TfrmSelectAccCode.SetSelectAccName(const Value: string);
begin
  FSelectAccName := Value;
end;

procedure TfrmSelectAccCode.SetSelectAccNo(const Value: string);
begin
  FSelectAccNo := Value;
end;

procedure TfrmSelectAccCode.FormShow(Sender: TObject);
var
  item : TListItem;
begin

 if frmReceive.cdsTemp.Active then
   with  frmReceive.cdsTemp do
   begin
      self.Caption:='บัญชีธนคาร ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not frmReceive.cdsTemp.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('accid').AsString;
         item.SubItems.Add(fieldbyname('accdesc').AsString) ;
         item.SubItems.Add(fieldbyname('accno').AsString) ;
         item.Data := TString.Create(fieldbyname('accid').AsString);
        if not frmReceive.cdsTemp.Eof then next;
      end;
   end;
end;

procedure TfrmSelectAccCode.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then close;
  if key = vk_return then
  begin
    if ListView.Selected<> nil then
    begin
      FSelectAccCode:=TString(ListView.Selected.Data).Str;
      FSelectAccName:=ListView.Selected.SubItems.Strings[0];
      FSelectAccNo:=ListView.Selected.SubItems.Strings[1];
      close;
    end;
  end;
end;

end.
