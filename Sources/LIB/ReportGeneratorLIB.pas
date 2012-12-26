unit ReportGeneratorLIB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBClient, MConnect, SConnect,
   StdCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  frxClass, frxDBSet, frxADOComponents, frxIBXComponents, frxBDEComponents,
  frxBarcode, frxDBXComponents, frxChart, frxExportHTML, frxDCtrl,
  frxExportPDF, frxExportXLS, frxExportCSV, ExtCtrls,ZLibEx,
  Grids, DBGrids, ListViewEx, DBXpress, SqlExpr, FMTBcd, Provider, RzPanel,
  RzLabel;



type

 TRParams = record
      Name : string;
      Value : string;
    end;


 TReportParam = Class
      public
        RParams : array of TRParams;

      constructor Create;
      procedure AddParam(Name: string; Value: string);
    End;

  TGenParamType = (rpDate,rpString,rpStringList);

  TGenParam = class
    rpType:TGenParamType;
    rpDesc:string;
    rpCode:string;
    rpValue:string;
  //  rpList:TStrings;
  end;



  TSQLGenParam = record
    sqlParamNo:integer;
    sqlParams: array of TGenParam;
  end;

  TSQLGenParamClass = class
    public
      _params : array of TSQLGenParam;
    constructor create;
    procedure addParam(pNo:integer;Value:array of TGenParam);
  end;

    function  genReportA(scon: TSQLConnection; cds,_cdsTemp: TClientDataSet;sql_fieldname, reportid: string; _params: TClientDataSet): boolean;
    procedure ShowReport(scon:TSQLConnection;reportid: string;cdsRepTemp,cdsParamObjValue:TClientDataSet;frxReport,frxReport1,frxReport2,frxReport3,frxReport4,frxReport5:TfrxReport;cdsReport,cdsReport1,cdsReport2,cdsReport3,cdsReport4,cdsReport5,_cdsTemp:TClientDataSet);
    procedure CompressStream(inpStream, outStream: TStream);
    procedure DecompressStream(inpStream, outStream: TStream);



implementation

{ Compress a stream }
procedure CompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf: Pointer;
  InpBytes, OutBytes: Integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  try
    GetMem(InpBuf, inpStream.Size);
    inpStream.Position := 0;
    InpBytes := inpStream.Read(InpBuf^, inpStream.Size);

    ZCompress(InpBuf, InpBytes, OutBuf, OutBytes);
    outStream.Write(OutBuf^, OutBytes);
  finally
    if InpBuf <> nil then FreeMem(InpBuf);
    if OutBuf <> nil then FreeMem(OutBuf);
  end;
end;





{ Decompress a stream }
procedure DecompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf: Pointer;
  OutBytes, sz: Integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  sz     := inpStream.Size - inpStream.Position;
  if sz > 0 then
    try
      GetMem(InpBuf, sz);
      inpStream.Read(InpBuf^, sz);
      ZDecompress(InpBuf, sz, OutBuf, OutBytes);
      outStream.Write(OutBuf^, OutBytes);
    finally
      if InpBuf <> nil then FreeMem(InpBuf);
      if OutBuf <> nil then FreeMem(OutBuf);
    end;
  outStream.Position := 0;
end;

function genReportA(scon: TSQLConnection; cds,_cdsTemp: TClientDataSet;
  sql_fieldname, reportid: string; _params: TClientDataSet): boolean;
var p,pcount,sqlCount,paramCount:integer;
    paramName,paramValue,sqlstr:string;

    isok:boolean;

    //_cdsTemp:TClientDataSet;
    GenParams: TSQLGenParamClass;
    rptPStream:TStream;
    blobF : TBlobField;
begin

          isok:=true;
          //_cdsTemp:=TClientDataSet.Create(self);

          _cdsTemp.Close;


          //_cdsTemp.RemoteServer:=scon;
          //TSQLConnection(_cdsTemp.RemoteServer).AddProv('report_prov005', 'ALL');
          //_cdsTemp.ProviderName:='report_prov005';

         // if trim(_cdsTemp.ProviderName)<>'' then
         /// initDatasetA(self,Conn,_cdsTemp);
        //TSQLConnection(_cdsTemp.RemoteServer).AddProv('report_prov005', 'ALL');

        //_cdsTemp.ProviderName:='report_prov005';

         // _cdsTemp.ProviderName:='cdsRepTemp';
         // _cdsTemp.RemoteServer:=scon;
          _cdsTemp.CommandText:='select * from  AppReport  where REPORT_ID='''+reportid+'''';
          _cdsTemp.Open;

          //rptPStream:=cdsRepTemp.CreateBlobStream(cdsRepTemp.FieldByName('SQLPOBJ'), bmRead);


          blobF := _cdsTemp.FieldByName('SQLPOBJ') as TBlobField;
          rptPStream := _cdsTemp.CreateBlobStream(blobF, bmRead);
          //rptPStream.Read(GenParams,rptPStream.Size);
          rptPStream.Read(GenParams,SizeOf(TSQLGenParamClass));



          sqlstr:=_cdsTemp.fieldbyname(sql_fieldname).AsString;

          if (Trim(sqlstr)<>'') then
          begin
            cds.Close;
            //cds.RemoteServer:=scon;
            //TSQLConnection(cds.RemoteServer).AddProv('report_prov006', 'ALL');
            //cds.ProviderName:='report_prov006';

            //cds.ProviderName:='report_prov006';
            cds.CommandText:=sqlstr;
            if _params<>nil then      // have parameter
            begin
             // if High(_params.RParams)>0 then
              //ShowMessage(inttostr(cds.Params.Count));
              begin
              //if ((cds.Params.Count>0) and (_params.RecordCount>=cds.Params.Count)) then
              if (cds.Params.Count>0) then
                for p:=0 to cds.Params.Count-1 do
                begin
                  //if Trim(paramName)<>'' then
                    _params.First;
                    for pcount:=0 to _params.RecordCount-1 do
                    begin
                      paramName:= trim(_params.FieldByName('CODE').AsString);//Before('=',params.Strings[pcount]);
                      paramValue:=trim(_params.FieldByName('VALUE').AsString);//After('=',params.Strings[pcount]);

                      //ShowMessage(cds.Params[p].Name);
                      
                      if pcount<=cds.Params.Count then
                        //if cds.Params[0] [].Items[p].Name=paramName then
                        if cds.Params[p].Name=paramName then
                        begin
                           //cds.Params.Items[p].Value:=paramValue;

                           cds.Params[p].Value:=paramValue;
                           //ShowMessage(paramName+'='+paramValue);
                        end;
                      if not _params.Eof then _params.Next;                      
                    end;
                  (********* for support empty value
                  if Trim(cds.Params.Items[p].Value)='' then
                  begin

                    MessageDlg('Parameter '''+cds.Params.Items[p].Name+''' not found!!!',mtWarning,[mbOK],0);

                    //Application.MessageBox(pchar('Parameter '''+cds.Params.Items[p].Name+''' not found!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
                    isok:=false;
                  end;
                  *)
                end;

              end;{ else
              begin
                // no parameter found
                Application.MessageBox(pchar('No Parameter  found!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
                isok:=false;
              end;  }
              if isok then
                cds.open;
            end else
              begin
                // no parameter found
                MessageDlg('Parameter '''+cds.Params.Items[p].Name+''' not found!!!',mtWarning,[mbOK],0);
                //Application.MessageBox(pchar('No Parameter  found!!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
                isok:=false;
              end;
          end;

          Result:=isok;
end;


procedure ShowReport(scon:TSQLConnection;reportid: string;cdsRepTemp,cdsParamObjValue:TClientDataSet;frxReport,frxReport1,frxReport2,frxReport3,frxReport4,frxReport5:TfrxReport;cdsReport,cdsReport1,cdsReport2,cdsReport3,cdsReport4,cdsReport5,_cdsTemp:TClientDataSet);
var
  I,j,reportTag,sqlCount,paramCount: Integer;
 // dsName:TStringList;
  rStream,rptStream:Tstream;
  showreport:boolean;

  rpVariable:TReportParam;
  blobF : TBlobField;
  rptPStream:TStream;
  GenParams: TSQLGenParamClass;

  //_sqlParams:TGenParam;
  bs,rs : TStream;

  // for sample write to file
  Stream: TFileStream;

begin
  showreport:=true;


  rptStream:=TMemoryStream.Create;
  rStream:=TMemoryStream.Create;
  cdsRepTemp.Close;

//  cdsRepTemp.RemoteServer:=scon;
//  TSQLConnection(cdsRepTemp.RemoteServer).AddProv('report_prov004', 'ALL');
 // cdsRepTemp.ProviderName:='report_prov004';
  cdsRepTemp.CommandText:='select * from  AppReport  where REPORT_ID='''+reportid+'''';

  cdsRepTemp.Open;

  if cdsRepTemp.Active then
    if cdsRepTemp.RecordCount>0 then
    begin

       rStream:=cdsRepTemp.CreateBlobStream(cdsRepTemp.FieldByName('REPORT_CONTEXT'), bmRead);
       reportTag:=cdsRepTemp.fieldByName('ID').AsInteger;

       if (rStream.Size>0) then
       begin
         DecompressStream(rStream,rptStream);
         frxReport.LoadFromStream(rptStream);



         cdsReport.close;
         cdsReport1.close;
         cdsReport2.close;
         cdsReport3.close;
         cdsReport4.close;
         cdsReport5.close;
         _cdsTemp.close;



                  if trim(cdsRepTemp.fieldbyname('STRSQL').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport,_cdsTemp,'STRSQL',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL1').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport1,_cdsTemp,'STRSQL1',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL2').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport2,_cdsTemp,'STRSQL2',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL3').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport3,_cdsTemp,'STRSQL3',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL4').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport4,_cdsTemp,'STRSQL4',reportid,cdsParamObjValue);

                  if trim(cdsRepTemp.fieldbyname('STRSQL5').AsString)<>'' then
                  showreport:=genReportA(scon,cdsReport5,_cdsTemp,'STRSQL5',reportid,cdsParamObjValue);


                  frxReport.Tag:= reportTag;


                  Application.ProcessMessages;
                  Screen.Cursor:=crDefault;
                  if showreport then
                  begin
                      frxReport.Variables['PARAM_UID'] :=QuotedStr('USERID');
                      frxReport.Variables['PARAM_REPORTID'] :=QuotedStr('REPORTID');
                      frxReport.PrepareReport();
                      frxReport.ShowReport();
                  end;


       end;


    end;
end;



{ TReportParam }

procedure TReportParam.AddParam(Name, Value: string);
begin

end;

constructor TReportParam.Create;
begin

end;


{ TSQLGenParamClass }

procedure TSQLGenParamClass.addParam(pNo: integer;
  Value: array of TGenParam);
var NewCount,i:integer;
begin
  NewCount := Length(_params)+1;
  SetLength(_params, NewCount);
  _params[High(_params)].sqlParamNo:=pNo;

  SetLength(_params[High(_params)].sqlParams,High(Value));
  for i := 0 to High(Value)-1 do
  begin
    _params[High(_params)].sqlParams[i]:=TGenParam.Create;
    _params[High(_params)].sqlParams[i].rpType:=Value[i].rpType;
    _params[High(_params)].sqlParams[i].rpDesc:=Value[i].rpDesc;
    _params[High(_params)].sqlParams[i].rpCode:=Value[i].rpCode;
    _params[High(_params)].sqlParams[i].rpValue:=Value[i].rpValue;
//    _params[High(_params)].sqlParams[i].rpList:=Value[i].rpList;
  end;
end;

constructor TSQLGenParamClass.create;
begin
     inherited Create;
    _params:=nil;
end;



end.
