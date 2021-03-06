unit ReportsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, DBXpress, FMTBcd, Provider, DB, SqlExpr,
  RzButton, frxClass, frxDBSet, DBClient, frxDesgn, StdCtrls, RzLabel;

type
  TfrmReports = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    btnFundSummaryReport: TRzBitBtn;
    cdsReport: TClientDataSet;
    frxReport: TfrxReport;
    frxDataset5: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    pnHeader: TRzPanel;
    lbHeader: TRzLabel;
    frxDataset1: TfrxDBDataset;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    RzBitBtn7: TRzBitBtn;
    RzBitBtn8: TRzBitBtn;
    RzBitBtn9: TRzBitBtn;
    RzBitBtn10: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFundSummaryReportClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure RzBitBtn8Click(Sender: TObject);
    procedure RzBitBtn9Click(Sender: TObject);
    procedure RzBitBtn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReports: TfrmReports;

implementation

uses CommonUtils, CommonLIB;

{$R *.dfm}

procedure TfrmReports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

procedure TfrmReports.btnFundSummaryReportClick(Sender: TObject);
var
    dllParams : TDLLParameter;
begin
  dllParams.ReportCode:='RPT01';
  ShowReportGenerator(Application,nil,swModal,dllParams,nil);
end;

(*

var FReport:string;
begin
  cdsReport.Close;
  cdsReport.CommandText := 'select aa.*, bb.fd_title from ( ' + #13 +
                      'select a.BatchNo                ' + #13 +
                      '   , b.RcvDno                   ' + #13 +
                      '   , c.Item                     ' + #13 +
                      '   , c.DocNo                    ' + #13 +
                      '   , c.DocDate                  ' + #13 +
                      '   , c.AccCode                  ' + #13 +
                      '   , c.FndCode                  ' + #13 +
                      '   , c.[Description] as Descrip ' + #13 +
                      '   , c.Flag                     ' + #13 +
                      '   , c.Amount                   ' + #13 +
                      '   , c.Period                   ' + #13 +
                      '   , c.AFlag                    ' + #13 +
                      'from MttReceiveBatch a          ' + #13 +
                      'left join MttReceiveHdr b on a.BatchNo=b.BatchNo and b.RecActivate=''A''' + #13 +
                      'left join MttReceive c on b.RcvDno=c.RcvDno and c.AFlag=''Y''           ' + #13 +
                      'where a.RecStatus=''A''                                                 ' + #13 +
                      'UNION                           ' + #13 +
                      'select a.BatchNo                ' + #13 +
                      '     , NULL as RcvDno           ' + #13 +
                      '     , NULL as Item             ' + #13 +
                      '     , NULL as DocNo            ' + #13 +
                      '     , a.BringDate              ' + #13 +
                      '     , NULL as AccCode          ' + #13 +
                      '     , a.FndCode                ' + #13 +
                      '     , ''�ʹ¡��'' as Descrip   ' + #13 +
                      '     , a.BringFlag              ' + #13 +
                      '     , a.BringForward           ' + #13 +
                      '     , NULL as Period           ' + #13 +
                      '     , ''X'' as AFlag           ' + #13 +
                      'from MttReceiveBatch a          ' + #13 +
                      'where a.RecStatus=''A''         ' + #13 +
                      'UNION                           ' + #13 +
                      'select b.BatchNo                ' + #13 +
                      '     , NULL as RcvDno           ' + #13 +
                      '     , NULL as Item             ' + #13 +
                      '     , NULL as DocNo            ' + #13 +
                      '     , b.CarryDate              ' + #13 +
                      '     , NULL as AccCode          ' + #13 +
                      '     , b.FndCode                ' + #13 +
                      '     , ''�ʹ¡�'' as Descrip   ' + #13 +
                      '     , b.CarryFlag              ' + #13 +
                      '     , b.CarryForward           ' + #13 +
                      '     , NULL as Period           ' + #13 +
                      '     , ''Z'' as AFlag           ' + #13 +
                      'from MttReceiveBatch b          ' + #13 +
                      'where b.RecStatus=''A''         ' + #13 +
                      ') aa                            ' + #13 +
                      'left join found_code bb on aa.FndCode=bb.fd_code' + #13 +
                      'order by FndCode,BatchNo,AFlag,RcvDno,Item';
  cdsReport.Open;

  FReport := ExtractFilePath(Application.ExeName) + 'Reports\CloseMonth.fr3';
  if not FileExists(FReport) then
    begin
      MessageDlg('����� Report ����� :' + FReport,mtWarning,[mbOK], 0);
    end
  else
    begin
      frxReport.LoadFromFile(FReport);
      //frxReport.DesignReport;
      frxReport.ShowReport;
    end;


end;

*)

procedure TfrmReports.RzBitBtn1Click(Sender: TObject);
var
  dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('MT',FormatDateTime('MM',Now)));
  DefaltValue.Add(TStringValue.Create('YR',FormatDateTime('yyyy',Now)));
  dllParams.ReportCode:='RPT002';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;



procedure TfrmReports.RzBitBtn2Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('MT',FormatDateTime('MM',Now)));
  DefaltValue.Add(TStringValue.Create('YR',FormatDateTime('yyyy',Now)));
  dllParams.ReportCode:='RPT001';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmReports.RzBitBtn3Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('YR',FormatDateTime('yyyy',Now)));
  dllParams.ReportCode:='RPT003';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmReports.RzBitBtn4Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('M',FormatDateTime('MM',Now)));
  DefaltValue.Add(TStringValue.Create('Y',FormatDateTime('yyyy',Now)));
  dllParams.ReportCode:='RPT0502';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmReports.RzBitBtn5Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('AF','10000'));
  DefaltValue.Add(TStringValue.Create('AT','1000000'));
  dllParams.ReportCode:='RPT0504';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmReports.RzBitBtn6Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('AF','10000'));
  DefaltValue.Add(TStringValue.Create('AT','1000000'));
  dllParams.ReportCode:='RPT0503';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmReports.RzBitBtn7Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('AF','10000'));
  DefaltValue.Add(TStringValue.Create('AT','1000000'));
  dllParams.ReportCode:='RPT0505';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;


procedure TfrmReports.RzBitBtn8Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('AF','10000'));
  DefaltValue.Add(TStringValue.Create('AT','1000000'));
  dllParams.ReportCode:='RPT0506';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmReports.RzBitBtn9Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
//  DefaltValue.Add(TStringValue.Create('DTF',FormatDateTime('MM',Now)));
//  DefaltValue.Add(TStringValue.Create('DTT',FormatDateTime('yyyy',Now)));
  DefaltValue.Add(TStringValue.Create('AF','10000'));
  DefaltValue.Add(TStringValue.Create('AT','1000000'));
  dllParams.ReportCode:='RPT0507';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

procedure TfrmReports.RzBitBtn10Click(Sender: TObject);
var dllParams : TDLLParameter;
  DefaltValue:TList;
begin
  DefaltValue:=TList.Create;
  DefaltValue.Add(TStringValue.Create('M',FormatDateTime('MM',Now)));
  DefaltValue.Add(TStringValue.Create('Y',FormatDateTime('yyyy',Now)));
  dllParams.ReportCode:='RPT0508';
  ShowReportGenerator(Application,nil,swModal,dllParams,DefaltValue);
end;

end.
