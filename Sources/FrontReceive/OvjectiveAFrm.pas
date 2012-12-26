unit OvjectiveAFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, StdCtrls, Mask, RzEdit, RzCmboBx, ExtCtrls,
  RzPanel, DB, DBClient, GridsEh, DBGridEh;

type
  TfrmOvjectiveA = class(TForm)
    GD: TDBGridEh;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    pnTop: TRzPanel;
    Label7: TLabel;
    Label8: TLabel;
    RzComboBox2: TRzComboBox;
    edDonatorName: TRzEdit;
    procedure GDDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure GDColEnter(Sender: TObject);
    procedure GDColExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SearchVal:String;
  public
    { Public declarations }
    ThaiMode:Boolean;
  end;



var
  frmOvjectiveA: TfrmOvjectiveA;

implementation

{$R *.dfm}

procedure TfrmOvjectiveA.GDDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
   if (gdFocused in State)  or (gdCurrent in State) then
      begin
         if Trim(SearchVal) <> '' then
            begin
              GD.Canvas.Font.color := clwhite;
              GD.Canvas.Brush.Color := clRed;
              GD.Canvas.TextOut(Rect.Left+1,Rect.Top+1,SearchVal);
            end;
      end;    
end;

procedure TfrmOvjectiveA.GDColEnter(Sender: TObject);
begin
  SearchVal := '';
  if (GD.SelectedField.DataType = ftString) then
     begin
       if Not(ThaiMode) then ActivateKeyboardLayout(HKL_Next, KLF_REORDER);
       ThaiMode := True;
     end;
  GD.Columns[0].OptimizeWidth;   
end;

procedure TfrmOvjectiveA.GDColExit(Sender: TObject);
begin
  if not(GD.SelectedField.DataType = ftString) then
     begin
       if ThaiMode then ActivateKeyboardLayout(HKL_Prev, KLF_REORDER);
       ThaiMode := False;
     end;
end;

procedure TfrmOvjectiveA.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #8 then Delete(SearchVal,Length(SearchVal),1);
   if key <> #8 then SearchVal := SearchVal + Key;
   caption := SearchVal;
   //if not GD.DataSource.DataSet.Locate(GD.SelectedField.FieldName,SearchVal,[lopartialkey,locaseinsensitive]) then GD.DataSource.DataSet.First;
end;

procedure TfrmOvjectiveA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  ShowMessage(ClientDataSet1.fieldbyname('UNID').AsString);
 end;
end;

end.
