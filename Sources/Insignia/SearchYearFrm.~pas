unit SearchYearFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls, RzPanel,InsigniaFrm,
  frxClass, frxDBSet, frxDesgn, DB ;

type
  TFrmSearchYear = class(TForm)
    RzPanel1: TRzPanel;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    TxtYear: TRzEdit;
    BtnSearchYear: TRzBitBtn;
    DsRpt: TDataSource;
    frxDesigner1: TfrxDesigner;
    FdbDs: TfrxDBDataset;
    Rpt_RoyalYear: TfrxReport;
    procedure BtnSearchYearClick(Sender: TObject);
    procedure TxtYearKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FMainForm: TfrmInsignia;
    procedure SetMainForm(const Value: TfrmInsignia);


  private


    { Private declarations }
  public
    { Public declarations }
     property MainForm : TfrmInsignia  read FMainForm write SetMainForm;

  end;

var
  FrmSearchYear: TFrmSearchYear;

implementation


{$R *.dfm}

{ TFrmSearchYear }


{ TFrmSearchYear }



{ TFrmSearchYear }

procedure TFrmSearchYear.SetMainForm(const Value: TfrmInsignia);
begin
  FMainForm := Value;
end;

procedure TFrmSearchYear.BtnSearchYearClick(Sender: TObject);
begin
  if trim(TxtYear.Text) = '' then
    begin TxtYear.Text := '2012' ; end;

  if StrToInt(TxtYear.Text) > 2500 then
    begin TxtYear.Text := IntToStr(StrToInt(TxtYear.Text)-543) ; end;

  with FMainForm  do
    begin
      CdsRpt.close ;
//      CdsRpt.CommandText := 'select Ry.ryid,ry.ryrdate,Bl.bdate,Bl.bno,Ry.rytotal,Bl.btotal,Ry.ryappdate,rc.ry_level,rc.ry_title,Ry.ryappdoc,Ry.ryininame,Ry.ryname,Ry.ryfname,Bl.bid '+
//                            ' from royal Ry left join royal_code Rc on Ry.ryrcode = Rc.ry_code ' +
//                            ' left join bill Bl on Ry.id = Bl.Bid '+
//                            ' where left(ry.ryrdate,4)='+ QuotedStr(TxtYear.Text) + ' and Ry.ryid = Bl.bryid '+
//                            ' group by Ry.ryid,ry.ryrdate,Bl.bdate,Ry.ryappdate,Ry.ryininame,Ry.ryname,Ry.ryfname, Bl.bno,Bl.bid,Ry.rytotal,Ry.ryappdoc,Bl.btotal,rc.ry_level,rc.ry_title '+
//                            ' order by Bl.bdate ' ;
      CdsRpt.CommandText := 'select '+
                            'Ry.ryid, '+
                            'ry.ryrdate, '+
                            'Ry.rytotal, '+
                            'Ry.ryappdate, '+
                            'rc.ry_level, '+
                            'rc.ry_title, '+
                            'Ry.ryappdoc, '+
                            'Ry.ryininame, '+
                            'Ry.ryname, '+
                            'Ry.ryfname, '+
                            'ryapyear '+
                         'from royal Ry '+
                         'left join royal_code Rc on Ry.ryrcode = Rc.ry_code '+
                         'where '+
                         'ry.ryapyear=' + QuotedStr(TxtYear.Text) +
                         'group by Ry.ryid,ry.ryrdate,Ry.ryappdate,Ry.ryininame,Ry.ryname '+
                         ',Ry.ryfname, Ry.rytotal,Ry.ryappdoc,rc.ry_level,rc.ry_title ,ryapyear '+
                         'order by Ry.ryid ' ;
      CdsRpt.Open ;
//      InputBox('','',CdsRpt.CommandText )  ;
       if CdsRpt.RecordCount = 0 then
         begin
           Application.MessageBox('ไม่มีรายการขอเครื่องราชฯที่ได้รับการอนุมัติ','ไม่มีรายการ', MB_OK + MB_ICONWARNING);
           Exit ;
         end;

      Rpt_RoyalYear.FileName := ExtractFilePath(Application.ExeName)+'Reports\SearchRoyalYear.fr3' ;
      CdsRpt.DisableControls;
        try
          Rpt_RoyalYear.DesignReport() ;
          Rpt_RoyalYear.PrepareReport(true);
          Rpt_RoyalYear.ShowPreparedReport;
        finally
          CdsRpt.EnableControls;
        end;
    end;
end;

procedure TFrmSearchYear.TxtYearKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then BtnSearchYearClick(sender) ;
end;

procedure TFrmSearchYear.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_Escape then
    Self.Close;
end;

end.
