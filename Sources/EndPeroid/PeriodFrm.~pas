unit PeriodFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls,EndPeroidFrm;

type
  TfrmPeriod = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label7: TLabel;
    Label8: TLabel;
    RzComboBox2: TRzComboBox;
    edDonatorName: TRzEdit;
    ListView: TListView;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FMainForm: TfrmEndPeroid;
    FSelectPeroid: string;
    procedure SetMainForm(const Value: TfrmEndPeroid);
    procedure SetSelectPeroid(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property MainForm : TfrmEndPeroid read FMainForm write SetMainForm;
    property SelectPeroid:string read FSelectPeroid write SetSelectPeroid;
  end;

var
  frmPeriod: TfrmPeriod;

implementation

uses CommonLIB, CommonUtils;



{$R *.dfm}

procedure TfrmPeriod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then
  begin
    SelectPeroid :=TString(ListView.Selected.Data).Str;
    close;
  end;
end;

procedure TfrmPeriod.SetMainForm(const Value: TfrmEndPeroid);
begin
  FMainForm := Value;
end;

procedure TfrmPeriod.FormShow(Sender: TObject);
var
  item : TListItem;
begin

 if FMainForm.cdsAllPeroid.Active then
   with  FMainForm.cdsAllPeroid do
   begin
      self.Caption:='จำนวน '+inttostr(recordcount)+' รายการ ';
      ListView.Items.Clear;
      first;
      while not FMainForm.cdsAllPeroid.Eof do
      begin
         item := ListView.Items.Add;
         item.Caption:= fieldbyname('pe_id').AsString;
         item.SubItems.Add(trim(fieldbyname('pe_user').AsString)+'-'+trim(fieldbyname('us_name').AsString)) ;
         item.SubItems.Add(FormatDateTime('dd/MM/yyyy hh:mm',fieldbyname('pe_closedate').AsDateTime)) ;
         item.SubItems.Add(trim(fieldbyname('pe_comment').AsString)) ;
         item.Data := TString.Create(fieldbyname('pe_id').AsString);
        if not FMainForm.cdsAllPeroid.Eof then next;
      end;
   end;
end;
procedure TfrmPeriod.SetSelectPeroid(const Value: string);
begin
  FSelectPeroid := Value;
end;

end.
