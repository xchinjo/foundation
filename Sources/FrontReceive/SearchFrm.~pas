unit SearchFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls;

type
  TfrmSearch = class(TForm)
    Bevel1: TBevel;
    ListView: TListView;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    FdonatorID: string;
    FdonatorName: string;
    FdonatorLName: string;
    FdonatorPreName: string;
    procedure SetdonatorID(const Value: string);
    procedure SetdonatorName(const Value: string);
    procedure SetdonatorLName(const Value: string);
    procedure SetdonatorPreName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property donatorID:string read FdonatorID write SetdonatorID;
    property donatorPreName : string  read FdonatorPreName write SetdonatorPreName;
    property donatorName:string  read FdonatorName write SetdonatorName;
    property donatorLName:string read FdonatorLName write SetdonatorLName;
  end;

var
  frmSearch: TfrmSearch;

implementation

uses ReceiveFrm, DB, CommonLIB;

{$R *.dfm}

{ TfrmSearch }

procedure TfrmSearch.SetdonatorID(const Value: string);
begin
  FdonatorID := Value;
end;

procedure TfrmSearch.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_escape: close;
    vk_return:
      begin
        if ListView.Selected<>nil then
        begin
          FdonatorID := TString(ListView.Selected.Data).Str;
          FdonatorPreName := ListView.Selected.Caption;
          FdonatorName :=  ListView.Selected.SubItems.Strings[0];
          FdonatorLName := ListView.Selected.SubItems.Strings[1];
          close;
        end;
      end;
  end;
end;

procedure TfrmSearch.FormShow(Sender: TObject);
var rowcount:integer;
  item : TListItem;
begin
  ListView.Items.Clear;
  rowcount:=0;
  Screen.Cursor:=crHourGlass;
  with frmReceive.cdsSearch do
  begin
    first;
    while not frmReceive.cdsSearch.Eof do
    begin
       item := ListView.Items.Add;
       item.Caption:= frmReceive.cdsSearch.fieldbyname('do_prename').AsString;
       item.SubItems.add(frmReceive.cdsSearch.fieldbyname('do_name').AsString);
       item.SubItems.Add(frmReceive.cdsSearch.fieldbyname('do_lname').AsString) ;
       item.SubItems.Add(frmReceive.cdsSearch.fieldbyname('do_id').AsString) ;
       item.Data := TString.Create(frmReceive.cdsSearch.fieldbyname('do_id').AsString);
       //inc(rowcount);

      if not frmReceive.cdsSearch.eof then frmReceive.cdsSearch.Next;
    end;
  end;
  Screen.Cursor:=crDefault;
  
end;

procedure TfrmSearch.SetdonatorName(const Value: string);
begin
  FdonatorName := Value;
end;

procedure TfrmSearch.SetdonatorLName(const Value: string);
begin
  FdonatorLName := Value;
end;

procedure TfrmSearch.ListViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
//if (Item.Index = Sender.Items.Count - 1) then
  begin
    Sender.Canvas.Brush.Color := clInfoBk;
    Sender.Canvas.FillRect(Item.DisplayRect(drBounds));
  end;
end;

procedure TfrmSearch.SetdonatorPreName(const Value: string);
begin
  FdonatorPreName := Value;
end;

end.
