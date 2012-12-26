unit SearchProjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel,
  ExtCtrls,ReceiveFrm;

type
  TfrmSearchProject = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    Label1: TLabel;
    cmbSearchType: TRzComboBox;
    edSearchText: TRzEdit;
    btnSearch: TRzBitBtn;
    ListView: TListView;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
  private
    FMainForm: TfrmReceive;
    FSelectProjectCode: string;
    FSelectProjectName: string;
    procedure SetMainForm(const Value: TfrmReceive);
    procedure FillListview;
    procedure SetSelectProjectCode(const Value: string);
    procedure SetSelectProjectName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmReceive read FMainForm write SetMainForm;
    property SelectProjectCode : string read FSelectProjectCode write SetSelectProjectCode;
    property SelectProjectName : string read FSelectProjectName write SetSelectProjectName;
  end;

var
  frmSearchProject: TfrmSearchProject;

implementation

uses CommonLIB;


{$R *.dfm}


procedure TfrmSearchProject.FillListview;
var
  item : TListItem;
begin
 if FMainForm.cdsTemp.Active then
   with  FMainForm.cdsTemp do
   begin
      self.Caption:='โครงการ ( จำนวน '+inttostr(recordcount)+' รายการ )';
      ListView.Items.Clear;
      first;
      while not FMainForm.cdsTemp.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('PjCode').AsString;
         item.SubItems.Add(fieldbyname('PjName').AsString) ;
         item.Data := TString.Create(fieldbyname('PjCode').AsString);
        if not FMainForm.cdsTemp.Eof then next;
      end;
   end;
end;

procedure TfrmSearchProject.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    ListViewDblClick(sender);
  end;
  if key=vk_escape then close;
end;

procedure TfrmSearchProject.SetMainForm(const Value: TfrmReceive);
begin
  FMainForm := Value;
end;

procedure TfrmSearchProject.FormShow(Sender: TObject);
begin
  FillListview;  
end;

procedure TfrmSearchProject.SetSelectProjectCode(const Value: string);
begin
  FSelectProjectCode := Value;
end;

procedure TfrmSearchProject.SetSelectProjectName(const Value: string);
begin
  FSelectProjectName := Value;
end;

procedure TfrmSearchProject.ListViewDblClick(Sender: TObject);
begin
    FSelectProjectCode := TString(ListView.Selected.Data).Str;
    FSelectProjectName := ListView.Selected.SubItems.Strings[0];
    close;
end;

end.
