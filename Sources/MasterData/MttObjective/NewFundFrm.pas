unit NewFundFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzButton, StdCtrls, Mask, RzEdit, RzDBEdit,
  RzLabel;

type
  TfrmNewFund = class(TForm)
    rzTopPanel: TRzPanel;
    pnClientContainer: TRzPanel;
    btnObjSave: TRzBitBtn;
    btnObjCancel: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel2: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzLabel3: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzLabel4: TRzLabel;
    RzDBEdit4: TRzDBEdit;
    RzLabel5: TRzLabel;
    RzDBEdit5: TRzDBEdit;
    RzLabel6: TRzLabel;
    RzDBEdit6: TRzDBEdit;
    RzLabel7: TRzLabel;
    RzDBEdit7: TRzDBEdit;
    RzLabel8: TRzLabel;
    RzDBEdit8: TRzDBEdit;
    procedure btnObjCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewFund: TfrmNewFund;

implementation

{$R *.dfm}

procedure TfrmNewFund.btnObjCancelClick(Sender: TObject);
begin
 close;
end;

procedure TfrmNewFund.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_escape then close;
end;

end.
