unit SearchSupportFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel,FavorFrm, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, RzLabel ;

type
  TFrmSearchSupport = class(TForm)
    Pane: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    FMainForm: TfrmFavor;
    FSelectSpId: String;
    FSelectSpLName: String;
    FSelectSpName: String;
    FSelect_DoLName: String;
    FSelect_DoName: String;
    procedure SetMainForm(const Value: TfrmFavor);
    procedure SetSelectSpId(const Value: String);
    procedure SetSelectSpLName(const Value: String);
    procedure SetSelectSpName(const Value: String);
    procedure SetSelect_DoLName(const Value: String);
    procedure SetSelect_DoName(const Value: String);
    procedure ChkData ;
    { Private declarations }
  public
    { Public declarations }
     property MainForm : TfrmFavor  read FMainForm write SetMainForm ;
     property SelectSpId : String  read FSelectSpId write SetSelectSpId;
     property SelectSpName : String  read FSelectSpName write SetSelectSpName;
     property SelectSpLName : String  read FSelectSpLName write SetSelectSpLName;
     property Select_DoName : String  read FSelect_DoName write SetSelect_DoName;
     property Select_DoLName : String  read FSelect_DoLName write SetSelect_DoLName;
  end;

var
  FrmSearchSupport: TFrmSearchSupport;

implementation


{$R *.dfm}

{ TFrmSearchSupport }

procedure TFrmSearchSupport.SetMainForm(const Value: TfrmFavor);
begin
  FMainForm := Value;
end;

procedure TFrmSearchSupport.FormShow(Sender: TObject);
begin
  if MainForm.ChkRb = '1' then
    begin
      cxGrid1DBTableView1DBColumn1.DataBinding.FieldName := 'do_prename' ;
      cxGrid1DBTableView1DBColumn2.DataBinding.FieldName := 'do_name' ;
      cxGrid1DBTableView1DBColumn3.DataBinding.FieldName := 'do_lname' ;
    end
  else if MainForm.ChkRb = '2' then
    begin
      cxGrid1DBTableView1DBColumn1.DataBinding.FieldName := 'spininame' ;
      cxGrid1DBTableView1DBColumn2.DataBinding.FieldName := 'spname' ;
      cxGrid1DBTableView1DBColumn3.DataBinding.FieldName := 'spfname' ;
    end;
end;

procedure TFrmSearchSupport.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then Self.Close;
end;

procedure TFrmSearchSupport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    if FMainForm.CdsSearch.RecordCount> 0 then
    begin
      ChkData ;
    end ;
end;

procedure TFrmSearchSupport.SetSelectSpId(const Value: String);
begin
  FSelectSpId := Value;
end;

procedure TFrmSearchSupport.SetSelectSpLName(const Value: String);
begin
  FSelectSpLName := Value;
end;

procedure TFrmSearchSupport.SetSelectSpName(const Value: String);
begin
  FSelectSpName := Value;
end;

procedure TFrmSearchSupport.SetSelect_DoLName(const Value: String);
begin
  FSelect_DoLName := Value;
end;

procedure TFrmSearchSupport.SetSelect_DoName(const Value: String);
begin
  FSelect_DoName := Value;
end;

procedure TFrmSearchSupport.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  ChkData;
end;

procedure TFrmSearchSupport.ChkData;
begin
  if MainForm.ChkRb = '1' then
    begin
      SelectSpId     := FMainForm.CdsSearch.FieldByName('do_id').AsString ;
      Select_DoName  := FMainForm.CdsSearch.FieldByName('do_name').AsString ;
      Select_DoLName := FMainForm.CdsSearch.FieldByName('do_lname').AsString ;
    end
  else if MainForm.ChkRb = '2' then
    begin
      SelectSpId    := FMainForm.CdsSearch.FieldByName('spid').AsString ;
      SelectSpName  := FMainForm.CdsSearch.FieldByName('spname').AsString ;
      SelectSpLName := FMainForm.CdsSearch.FieldByName('spfname').AsString ;
    end;
  close;
end;

end.
