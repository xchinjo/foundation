unit UIBDM;

interface

uses
  SysUtils, Classes, JvUIB, JvComponentBase;

type
  TMDM = class(TDataModule)
    DBConn: TJvUIBDataBase;
    DbTrans: TJvUIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MDM: TMDM;

implementation

{$R *.dfm}

end.
