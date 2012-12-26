unit EndMonthFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, DBXpress, FMTBcd, Provider, DB, SqlExpr;

type
  TfrmEndMonth = class(TForm)
    xTopPanel: TPanel;
    pnClientContainer: TPanel;
    rzTopPanel: TRzPanel;
    Conn: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    dsp: TDataSetProvider;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEndMonth: TfrmEndMonth;

implementation

uses CommonLIB, CommonUtils;

{$R *.dfm}

procedure TfrmEndMonth.FormCreate(Sender: TObject);
begin
  SetChildTaborders(pnClientContainer);
end;

procedure TfrmEndMonth.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
    Action := caFree;
end;

end.
