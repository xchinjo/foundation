unit SearchDonatorFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, RzLabel, ExtCtrls, RzPanel, InsigniaFrm ;

type
  TFrmSearchDonator = class(TForm)
    RzPanel1: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    FMainForm: TfrmInsignia;
    FRy_id: String;
    procedure SetMainForm(const Value: TfrmInsignia);
    procedure SetRy_id(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmInsignia  read FMainForm write SetMainForm;
    property Ry_id : String  read FRy_id write SetRy_id;
  end;

var
  FrmSearchDonator: TFrmSearchDonator;

implementation

{$R *.dfm}

{ TFrmSearchDonator }

procedure TFrmSearchDonator.SetMainForm(const Value: TfrmInsignia);
begin
  FMainForm := Value;
end;

procedure TFrmSearchDonator.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    if FMainForm.CdsSearch.RecordCount> 0 then
    begin
      Ry_id := FMainForm.CdsSearch.fieldByname('id').AsString ;      
      close;
    end ;
end;

procedure TFrmSearchDonator.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_Escape then
    Self.Close;
end;

procedure TFrmSearchDonator.FormShow(Sender: TObject);
begin
  if MainForm.ChkRb = '1' then
    begin
      cxGrid1DBTableView1DBColumn1.DataBinding.FieldName := 'do_prename' ;
      cxGrid1DBTableView1DBColumn2.DataBinding.FieldName := 'do_name' ;
      cxGrid1DBTableView1DBColumn3.DataBinding.FieldName := 'do_lname' ;

    end
  else if MainForm.ChkRb = '2' then
    begin
      cxGrid1DBTableView1DBColumn1.DataBinding.FieldName := 'ryininame' ;
      cxGrid1DBTableView1DBColumn2.DataBinding.FieldName := 'ryname' ;
      cxGrid1DBTableView1DBColumn3.DataBinding.FieldName := 'ryfname' ;

    end;
end;

procedure TFrmSearchDonator.SetRy_id(const Value: String);
begin
  FRy_id := Value;
end;

procedure TFrmSearchDonator.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  Ry_id := FMainForm.CdsSearch.fieldByname('id').AsString ;
  close;
end;

end.

