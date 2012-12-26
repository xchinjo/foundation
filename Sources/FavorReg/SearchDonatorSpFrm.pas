unit SearchDonatorSpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, ExtCtrls, RzPanel,FavorRegisterFrm, cxCheckBox,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid ;

type
  TFrmSearchDonatorSp = class(TForm)
    RzPanel1: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    FMainForm: TfrmFavorRegister;
    FSelectDonatorLName: String;

    FSelectDonatorPreName: String;
    FSelectDonatorName: String;
    FSelectDonatorID: string;
    FSelectDonatorID2: string;
    FSelectSpCode: String;
    procedure SetMainForm(const Value: TfrmFavorRegister);
    procedure SetSelectDonatorID(const Value: string);
    procedure SetSelectDonatorLName(const Value: String);
    procedure SetSelectDonatorName(const Value: String);
    procedure SetSelectDonatorPreName(const Value: String);
    procedure SetSelectDonatorID2(const Value: string);
    procedure SetSelectSpCode(const Value: String);
    procedure ChkData ;


  public
    property MainForm : TfrmFavorRegister  read FMainForm write SetMainForm;
    property SelectDonatorID : string  read FSelectDonatorID write SetSelectDonatorID;
    property SelectDonatorID2 : string  read FSelectDonatorID2 write SetSelectDonatorID2;
    property SelectDonatorPreName : String  read FSelectDonatorPreName write SetSelectDonatorPreName;
    property SelectDonatorName : String  read FSelectDonatorName write SetSelectDonatorName;
    property SelectDonatorLName : String  read FSelectDonatorLName write SetSelectDonatorLName;
    property SelectSpCode : String  read FSelectSpCode write SetSelectSpCode;



  end;

var
  FrmSearchDonatorSp: TFrmSearchDonatorSp;

implementation


{$R *.dfm}


procedure TFrmSearchDonatorSp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    if FMainForm.CdsSearch.RecordCount > 0 then
    begin
      ChkData;
    end;
end;

procedure TFrmSearchDonatorSp.SetMainForm(const Value: TfrmFavorRegister);
begin
  FMainForm := Value;
end;

procedure TFrmSearchDonatorSp.SetSelectDonatorID(const Value: string);
begin
  FSelectDonatorID := Value;
end;

procedure TFrmSearchDonatorSp.SetSelectDonatorLName(const Value: String);
begin
  FSelectDonatorLName := Value;
end;

procedure TFrmSearchDonatorSp.SetSelectDonatorName(const Value: String);
begin
  FSelectDonatorName := Value;
end;

procedure TFrmSearchDonatorSp.SetSelectDonatorPreName(const Value: String);
begin
  FSelectDonatorPreName := Value;
end;

procedure TFrmSearchDonatorSp.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_Escape then
    Self.Close;
end;

procedure TFrmSearchDonatorSp.FormShow(Sender: TObject);
begin
  Screen.Cursor := crDefault ;
end;

procedure TFrmSearchDonatorSp.SetSelectDonatorID2(const Value: string);
begin
  FSelectDonatorID2 := Value;
end;

procedure TFrmSearchDonatorSp.SetSelectSpCode(const Value: String);
begin
  FSelectSpCode := Value;
end;

procedure TFrmSearchDonatorSp.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  ChkData;
end;

procedure TFrmSearchDonatorSp.ChkData;
begin
  FSelectDonatorID := FMainForm.CdsSearch.FieldByName('do_id').AsString ;
  FSelectDonatorID2 := FMainForm.CdsSearch.FieldByName('do_id').AsString ;
  FSelectDonatorPreName := FMainForm.CdsSearch.FieldByName('do_prename').AsString ;
  FSelectDonatorName := FMainForm.CdsSearch.FieldByName('do_name').AsString ;
  FSelectDonatorLName := FMainForm.CdsSearch.FieldByName('do_lname').AsString ;
  FSelectSpCode := FMainForm.CdsSearch.FieldByName('spcode').AsString ;
  close;
end;

end.

