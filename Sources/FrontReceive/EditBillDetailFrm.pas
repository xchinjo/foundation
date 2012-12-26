unit EditBillDetailFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, RzEdit, RzCmboBx, RzPanel, ExtCtrls,
  RzButton;

type
  TfrmEditItem = class(TForm)
    pnClientContainer: TPanel;
    pnTop: TRzPanel;
    Label3: TLabel;
    edObjtiveName: TRzEdit;
    edFundName: TRzEdit;
    Label11: TLabel;
    edAmount: TRzNumericEdit;
    Label1: TLabel;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditItem: TfrmEditItem;

implementation

{$R *.dfm}

end.
