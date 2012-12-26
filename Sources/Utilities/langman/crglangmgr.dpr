{ *********************************************************************** }
{                                                                         }
{ The CRG Software Cross-Platform Runtime Library                         }
{ CRG - Languages Manager DLL Library                                     }
{                                                                         }
{ Copyright (c) 2006 CRG Software Co., Ltd.                               }
{                                                                         }
{ *********************************************************************** }

library crglangmgr;

uses SysUtils, Variants, Classes, Controls, Forms, Graphics, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, DBCtrls, jvuib, Mask, Grids, DBGrids, cxGridDBTableView,
  cxTextEdit, cxMaskEdit, cxMemo, cxDropDownEdit, cxCalendar, cxButtonEdit,
  cxNavigator, cxDBExtLookupComboBox, cxListBox, cxRadioGroup, cxButtons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMRUEdit, cxBlobEdit,
  cxImage, cxCurrencyEdit, cxTimeEdit, cxHyperLinkEdit, cxCalc, cxSpinEdit,
  cxImageComboBox, cxCheckBox, cxDBNavigator, cxDBEdit, cxGrid;

{$R *.res}

procedure LoadComponents(_ApplicationName, _ScreenName, _Language: String;
  _Form: TForm; _Transaction: TJvUIBTransaction); stdcall;
const
  _SQL_SELECT_COMPONENTS_LIST =
    'SELECT ' +
//    '  "TYPE", NAME, TEXT, HINT, ' +
    ' NAME, TEXT, HINT, ' +
    '  "LEFT", TOP, WIDTH, HEIGHT ' + //', ' +
//    '  FONT_NAME, FONT_SIZE, FONT_STYLE, ' +
//    '  VISIBLED, ENABLED ' +
    'FROM ' +
    '  SP_GET_COMPONENTS_LIST ( ' +
    '    :LANGUAGE, :APPLICATION_NAME, :SCREEN_NAME)';
var
  _C: TComponent;
  _CIndex{, _CType}: Integer;
  _CName, _CText, _CHint: String;
//  _CLeft, _CTop, _CWidth, _CHeight: Integer;
//  _Font: TFont;
//  _CFontName, _CFontStyle: String;//  _CFontSize: Integer;
//  _IsEnabled, _IsVisibled: Boolean;
  _Pos: Integer;

  _SelectQuery: TJvUIBQuery;

  procedure _SetBound();
  begin
//    (_C as TControl).Enabled := _IsEnabled;
//    (_C as TControl).Visible := _IsVisibled;
    {
    if ((akLeft in (_C as TControl).Anchors) and
        (akTop in (_C as TControl).Anchors) and
        (not (akRight in (_C as TControl).Anchors)) and
        (not (akBottom in (_C as TControl).Anchors))) then
    begin
       Exit;
    end;

    (_C as TControl).Left := _CLeft;
    (_C as TControl).Top := _CTop;
    (_C as TControl).Width := _CWidth;
    (_C as TControl).Height := _CHeight;}
  end;

  procedure _SetFont();
  begin{
    if (Trim(_CFontName) <> '') then
      _Font.Name := _CFontName;
    if (_CFontSize <> 0) then
      _Font.Size := _CFontSize;

    if (Pos('B', _CFontStyle) <> 0) then
      _Font.Style := _Font.Style + [fsBold]
    else
      _Font.Style := _Font.Style - [fsBold];

    if (Pos('I', _CFontStyle) <> 0) then
      _Font.Style := _Font.Style + [fsItalic]
    else
      _Font.Style := _Font.Style - [fsItalic];

    if (Pos('U', _CFontStyle) <> 0) then
      _Font.Style := _Font.Style + [fsUnderline]
    else
      _Font.Style := _Font.Style - [fsUnderline];

    if (Pos('S', _CFontStyle) <> 0) then
      _Font.Style := _Font.Style + [fsStrikeOut]
    else
      _Font.Style := _Font.Style - [fsStrikeOut];    }
  end;
begin
  _SelectQuery := TJvUIBQuery.Create(nil);
  try
    _SelectQuery.Transaction := _Transaction;
    _SelectQuery.SQL.Text := _SQL_SELECT_COMPONENTS_LIST;

    _SelectQuery.Params.ByNameAsString['LANGUAGE'] := _Language;
    _SelectQuery.Params.ByNameAsString['APPLICATION_NAME'] := _ApplicationName;
    _SelectQuery.Params.ByNameAsString['SCREEN_NAME'] := _ScreenName;

    _SelectQuery.Open();
    while (not _SelectQuery.eof) do
    begin
      _CName := _SelectQuery.Fields.ByNameAsString['NAME'];
      
      _Pos := Pos('[', _CName);
      if (_Pos <> 0) then
      begin
        _CIndex := StrToInt(Copy(_CName, _Pos + 1, Pos(']', _CName) - _Pos - 1));
        _CName := Copy(_CName, 1, _Pos - 1);
      end else
        _CIndex := -1;

      _C := _Form.FindComponent(_CName);

      if (_C <> nil) then
      begin
        //_CType := _SelectQuery.Fields.ByNameAsInteger['TYPE'];
        _SelectQuery.ReadBlob('TEXT', _CText);
        _SelectQuery.ReadBlob('HINT', _CHint);
{
        if (_SelectQuery.Fields.ByNameAsVariant['LEFT'] <> NULL) then
          _CLeft := _SelectQuery.Fields.ByNameAsInteger['LEFT'];

        if (_SelectQuery.Fields.ByNameAsVariant['TOP'] <> NULL) then
          _CTop := _SelectQuery.Fields.ByNameAsInteger['TOP'];

        if (_SelectQuery.Fields.ByNameAsVariant['WIDTH'] <> NULL) then
          _CWidth := _SelectQuery.Fields.ByNameAsInteger['WIDTH'];

        if (_SelectQuery.Fields.ByNameAsVariant['HEIGHT'] <> NULL) then
          _CHeight := _SelectQuery.Fields.ByNameAsInteger['HEIGHT'];
}
{
        _CFontName := _SelectQuery.Fields.ByNameAsString['FONT_NAME'];
        _CFontStyle := _SelectQuery.Fields.ByNameAsString['FONT_SIZE'];        if (_SelectQuery.Fields.ByNameAsVariant['FONT_STYLE'] <> NULL) then          _CFontSize := _SelectQuery.Fields.ByNameAsInteger['FONT_STYLE']
        else
          _CFontSize := 0;
}
//        _IsEnabled := (_SelectQuery.Fields.ByNameAsInteger['ENABLED'] = 1);
//        _IsVisibled := (_SelectQuery.Fields.ByNameAsInteger['VISIBLED'] = 1);

        if (_C is TPanel) then
        begin
          (_C as TPanel).Caption := _CText;
          (_C as TPanel).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TPanel).Font;
          _SetFont();
        end else
        if (_C is TGroupBox) then
        begin
          (_C as TGroupBox).Caption := _CText;
          (_C as TGroupBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TGroupBox).Font;
          _SetFont();
        end else
        if (_C is TLabel) then
        begin
          (_C as TLabel).Caption := _CText;
          (_C as TLabel).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TLabel).Font;
          _SetFont();
        end else
        if (_C is TSpeedButton) then
        begin
          (_C as TSpeedButton).Caption := _CText;
          (_C as TSpeedButton).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TSpeedButton).Font;
          _SetFont();
        end else
        if (_C is TImage) then
        begin
          (_C as TImage).Hint := _CHint;
          _SetBound();
        end else
        if (_C is TBevel) then
        begin
          (_C as TBevel).Hint := _CHint;
          _SetBound();
        end else
        if (_C is TDBText) then
        begin
          (_C as TDBText).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBText).Font;
          _SetFont();
        end else
        if (_C is TEdit) then
        begin
          (_C as TEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TEdit).Font;
          _SetFont();
        end else
        if ((_C is TButton) or (_C is TcxButton)) then
        begin
          (_C as TButton).Caption := _CText;
          (_C as TButton).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TButton).Font;
          _SetFont();
        end else
        if (_C is TMemo) then
        begin
          (_C as TMemo).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TMemo).Font;
          _SetFont();
        end else
        if (_C is TCheckBox) then
        begin
          (_C as TCheckBox).Caption := _CText;
          (_C as TCheckBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TCheckBox).Font;
          _SetFont();
        end else
        if (_C is TRadioButton) then
        begin
          (_C as TRadioButton).Caption := _CText;
          (_C as TRadioButton).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TRadioButton).Font;
          _SetFont();
        end else
        if (_C is TListBox) then
        begin
          (_C as TListBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TListBox).Font;
          _SetFont();
        end else
        if (_C is TComboBox) then
        begin
          (_C as TComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TComboBox).Font;
          _SetFont();
        end else
        if (_C is TScrollBar) then
        begin
          (_C as TScrollBar).Hint := _CHint;
          _SetBound();
        end else
        if (_C is TRadioGroup) then
        begin
          (_C as TRadioGroup).Caption := _CText;
          (_C as TRadioGroup).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TComboBox).Font;
          _SetFont();
        end else
        if (_C is TToolButton) then
        begin
          (_C as TToolButton).Caption := _CText;
          (_C as TToolButton).Hint := _CHint;
        end else
        if (_C is TTabSheet) then
        begin
          (_C as TTabSheet).Caption := _CText;
          (_C as TTabSheet).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TTabSheet).Font;
          _SetFont();
        end else
        if (_C is TcxGridDBTableView) then
        begin
          if (_CIndex <> -1) then
            (_C as TcxGridDBTableView).Columns[_CIndex].Caption := _CText;
          // related with _SaveBound() function
          //(_C as TcxGridDBTableView).Columns[_CIndex].Width := _CWidth;
        end else
        if (_C is TcxTextEdit) then
        begin
          (_C as TcxTextEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxTextEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxMaskEdit) then
        begin
          (_C as TcxMaskEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxMaskEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxMemo) then
        begin
          (_C as TcxMemo).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxMemo).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDateEdit) then
        begin
          (_C as TcxDateEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDateEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxCheckBox) then
        begin
          (_C as TcxCheckBox).Properties.Caption := _CText;
          (_C as TcxCheckBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxCheckBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxComboBox) then
        begin
          (_C as TcxComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxComboBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxImageComboBox) then
        begin
          (_C as TcxImageComboBox).Hint := _CHint;
          _SetBound();
        end else
        if (_C is TcxSpinEdit) then
        begin
          (_C as TcxSpinEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxSpinEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxCalcEdit) then
        begin
          (_C as TcxCalcEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxCalcEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxHyperLinkEdit) then
        begin
          (_C as TcxHyperLinkEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxHyperLinkEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxTimeEdit) then
        begin
          (_C as TcxTimeEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxTimeEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxCurrencyEdit) then
        begin
          (_C as TcxCurrencyEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxCurrencyEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxImage) then
        begin
          (_C as TcxImage).Hint := _CHint;
          _SetBound();
        end else
        if (_C is TcxBlobEdit) then
        begin
          (_C as TcxBlobEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxBlobEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxMRUEdit) then
        begin
          (_C as TcxMRUEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxMRUEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxPopupEdit) then
        begin
          (_C as TcxPopupEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxPopupEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxLookupComboBox) then
        begin
          (_C as TcxLookupComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxLookupComboBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxButtonEdit) then
        begin
          (_C as TcxLookupComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxLookupComboBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxRadioButton) then
        begin
          (_C as TcxRadioButton).Caption := _CText;
          (_C as TcxRadioButton).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxRadioButton).Font;
          _SetFont();
        end else
        if (_C is TcxRadioGroup) then    // XXXXX
        begin
          (_C as TcxRadioGroup).Caption := _CText;
          (_C as TcxRadioGroup).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxRadioGroup).Style.Font;
          _SetFont();
        end else
        if (_C is TcxListBox) then
        begin
          (_C as TcxListBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxListBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxNavigator) then
        begin
          (_C as TcxNavigator).Hint := _CHint;
          _SetBound();
        end else
        if (_C is TcxDBTextEdit) then
        begin
          (_C as TcxDBTextEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBTextEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBMaskEdit) then
        begin
          (_C as TcxDBMaskEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBMaskEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBMemo) then
        begin
          (_C as TcxDBMemo).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBMemo).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBDateEdit) then
        begin
          (_C as TcxDBDateEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBDateEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBButtonEdit) then
        begin
          (_C as TcxDBButtonEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBButtonEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBCheckBox) then
        begin
          (_C as TcxDBCheckBox).Properties.Caption := _CText;
          (_C as TcxDBCheckBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBCheckBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBComboBox) then
        begin
          (_C as TcxDBComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBComboBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBImageComboBox) then
        begin
          _SetBound();
        end else
        if (_C is TcxDBSpinEdit) then
        begin
          (_C as TcxDBSpinEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBSpinEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBCalcEdit) then
        begin
          (_C as TcxDBCalcEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBCalcEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBHyperLinkEdit) then
        begin
          (_C as TcxDBHyperLinkEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBHyperLinkEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBTimeEdit) then
        begin
          (_C as TcxDBTimeEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBTimeEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBCurrencyEdit) then
        begin
          (_C as TcxDBCurrencyEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBCurrencyEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBImage) then
        begin
          _SetBound();
        end else
        if (_C is TcxDBBlobEdit) then
        begin
          (_C as TcxDBBlobEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBBlobEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBMRUEdit) then
        begin
          (_C as TcxDBMRUEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBMRUEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBPopupEdit) then
        begin
          (_C as TcxDBPopupEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBPopupEdit).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBLookupComboBox) then
        begin
          (_C as TcxDBLookupComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBLookupComboBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBRadioGroup) then
        begin
          (_C as TcxDBRadioGroup).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBRadioGroup).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBListBox) then
        begin
          (_C as TcxDBListBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TcxDBListBox).Style.Font;
          _SetFont();
        end else
        if (_C is TcxDBNavigator) then
        begin
          _SetBound();
        end else
        if (_C is TDBGrid) then
        begin
          if (_CIndex <> -1) then
          begin
            (_C as TDBGrid).Columns[_CIndex].Title.Caption := _CText;
            // Related with _SaveBound() functjion
            // (_C as TDBGrid).Columns[_CIndex].Width := _CWidth;
            //_Font := (_C as TDBGrid).Columns[_CIndex].Title.Font;
            _SetFont();
          end;

          (_C as TDBGrid).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBGrid).Font;
          _SetFont();
        end else
        if (_C is TDBNavigator) then
        begin
          _SetBound();
        end else
        if (_C is TDBEdit) then
        begin
          (_C as TDBEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBEdit).Font;
          _SetFont();
        end else
        if (_C is TDBMemo) then
        begin
          (_C as TDBMemo).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBMemo).Font;
          _SetFont();
        end else
        if (_C is TDBImage) then
        begin
          (_C as TDBImage).Hint := _CHint;
          _SetBound();
        end else
        if (_C is TDBListBox) then
        begin
          (_C as TDBListBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBListBox).Font;
          _SetFont();
        end else
        if (_C is TDBComboBox) then
        begin
          (_C as TDBComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBComboBox).Font;
          _SetFont();
        end else
        if (_C is TDBCheckBox) then
        begin
          (_C as TDBCheckBox).Caption := _CText;
          (_C as TDBCheckBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBCheckBox).Font;
          _SetFont();
        end else
        if (_C is TDBRadioGroup) then
        begin
          (_C as TDBRadioGroup).Caption := _CText;
          (_C as TDBRadioGroup).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBRadioGroup).Font;
          _SetFont();
        end else
        if (_C is TDBLookupListBox) then
        begin
          (_C as TDBLookupListBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBLookupListBox).Font;
          _SetFont();
        end else
        if (_C is TDBLookupComboBox) then
        begin
          (_C as TDBLookupComboBox).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBLookupComboBox).Font;
          _SetFont();
        end else
        if (_C is TDBRichEdit) then
        begin
          (_C as TDBRichEdit).Hint := _CHint;
          _SetBound();
          //_Font := (_C as TDBRichEdit).Font;
          _SetFont();
        end;
      end;
      _SelectQuery.Next();
    end;
  finally
    _SelectQuery.Free();
  end;
end;

procedure SaveComponents(_ApplicationName, _ScreenName, _Language: String;
  _Form: TForm; _Transaction: TJvUIBTransaction); stdcall;
const
  _SQL_INSERT_COMPONENTS_LIST =
    'EXECUTE PROCEDURE SP_INSERT_UPDATE_COMPONENT( ' +
    '  :LANGUAGE, :APPLICATION_NAME, :SCREEN_NAME, ' +
    '  :COMPONENT_TYPE, :COMPONENT_NAME, ' +
    '  :COMPONENT_TEXT, :COMPONENT_HINT, ' +
    '  :COMPONENT_LEFT, :COMPONENT_TOP, ' +
    '  :COMPONENT_WIDTH, :COMPONENT_HEIGHT, ' +
    '  :COMPONENT_FONT_NAME, :COMPONENT_FONT_SIZE, ' +
    '  :COMPONENT_FONT_STYLE, ' +
    '  :COMPONENT_VISIBLED, :COMPONENT_ENABLED, ' +
    '  :DESCRIPTION)';
var
  i, j: Integer;
  _C: TComponent;
  _CType: Integer;
  _CName, _CText, _CHint: String;
  _CLeft, _CTop, _CWidth, _CHeight: Integer;
  _CFontName, _CFontStyle: String;  _CFontSize: Integer;

  _InsertQuery: TJvUIBQuery;

  procedure _SaveText();
  var
    _Desc: String;
  begin
    _InsertQuery.Params.Clear();
    _InsertQuery.SQL.Text := _SQL_INSERT_COMPONENTS_LIST;

    _InsertQuery.Params.ByNameAsString['LANGUAGE'] := _Language;
    _InsertQuery.Params.ByNameAsString['APPLICATION_NAME'] := _ApplicationName;
    _InsertQuery.Params.ByNameAsString['SCREEN_NAME'] := _ScreenName;

    _InsertQuery.Params.ByNameAsInteger['COMPONENT_TYPE'] := _CType;
    _InsertQuery.Params.ByNameAsString['COMPONENT_NAME'] := _CName;

    if (Trim(_CText) <> '') then
      _InsertQuery.ParamsSetBlob('COMPONENT_TEXT', _CText);
    if (Trim(_CHint) <> '') then
      _InsertQuery.ParamsSetBlob('COMPONENT_HINT', _CHint);

    if (_CLeft <> -999) then
      _InsertQuery.Params.ByNameAsInteger['COMPONENT_LEFT'] := _CLeft;
    if (_CTop <> -999) then
      _InsertQuery.Params.ByNameAsInteger['COMPONENT_TOP'] := _CTop;
    if (_CWidth <> -999) then
      _InsertQuery.Params.ByNameAsInteger['COMPONENT_WIDTH'] := _CWidth;
    if (_CHeight <> -999) then
      _InsertQuery.Params.ByNameAsInteger['COMPONENT_HEIGHT'] := _CHeight;

    if (Trim(_CFontName) <> '') then
      _InsertQuery.Params.ByNameAsString['COMPONENT_FONT_NAME'] := _CFontName;
    if (Trim(_CFontStyle) <> '') then
      _InsertQuery.Params.ByNameAsInteger['COMPONENT_FONT_SIZE'] := _CFontSize;

    _InsertQuery.Params.ByNameAsString['COMPONENT_FONT_STYLE'] := _CFontStyle;

    _InsertQuery.Params.ByNameAsInteger['COMPONENT_VISIBLED'] := 1;
    _InsertQuery.Params.ByNameAsInteger['COMPONENT_ENABLED'] := 1;

    _Desc := _ApplicationName + ':' + _ScreenName + ':' + _CName;
    _InsertQuery.ParamsSetBlob('DESCRIPTION', _Desc);

    _InsertQuery.ExecSQL();
    _InsertQuery.Close(etmCommit);
    _InsertQuery.SQL.Text := '';
  end;

  procedure InitComponentValue();
  begin
    _CType := -1;
    _CName := '';
    _CText := '';

    _CLeft := -999;
    _CTop := -999;
    _CWidth := -999;
    _CHeight := -999;

    _CFontName := '';
    _CFontStyle := '';
    _CFontSize := 0;
  end;

begin
  _InsertQuery := TJvUIBQuery.Create(nil);
  _Transaction.StartTransaction();
  try
    _InsertQuery.Transaction := _Transaction;
    _InsertQuery.SQL.Text := _SQL_INSERT_COMPONENTS_LIST;

    _InsertQuery.Params.ByNameAsString['LANGUAGE'] := _Language;
    _InsertQuery.Params.ByNameAsString['APPLICATION_NAME'] := _ApplicationName;
    _InsertQuery.Params.ByNameAsString['SCREEN_NAME'] := _ScreenName;

    for i := 0 to (_Form.ComponentCount - 1) do
    begin
      _C := _Form.Components[i];

      InitComponentValue();
      if (_C is TPanel) then
      begin
        _CType := 101;
        _CName := _C.Name;
        if (Trim((_C as TPanel).Caption) <> '') then
          _CText := (_C as TPanel).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TPanel).Font.Name;
        _CFontSize := (_C as TPanel).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TPanel).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TPanel).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TPanel).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TPanel).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TGroupBox) then
      begin
        _CType := 102;
        _CName := _C.Name;
        if (Trim((_C as TGroupBox).Caption) <> '') then
          _CText := (_C as TGroupBox).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TGroupBox).Font.Name;
        _CFontSize := (_C as TGroupBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TGroupBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TGroupBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TGroupBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TGroupBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TLabel) then
      begin
        _CType := 103;
        _CName := _C.Name;
        if (Trim((_C as TLabel).Caption) <> '') then
          _CText := (_C as TLabel).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TLabel).Font.Name;
        _CFontSize := (_C as TLabel).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TLabel).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TLabel).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TLabel).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TLabel).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TSpeedButton) then
      begin
        _CType := 104;
        _CName := _C.Name;
        if (Trim((_C as TSpeedButton).Caption) <> '') then
          _CText := (_C as TSpeedButton).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TSpeedButton).Font.Name;
        _CFontSize := (_C as TSpeedButton).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TSpeedButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TSpeedButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TSpeedButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TSpeedButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TImage) then
      begin
        _CType := 105;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TBevel) then
      begin
        _CType := 106;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TDBText) then
      begin
        _CType := 203;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBText).Font.Name;
        _CFontSize := (_C as TDBText).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBText).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBText).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBText).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBText).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TEdit) then
      begin
        _CType := 107;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TEdit).Font.Name;
        _CFontSize := (_C as TEdit).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if ((_C is TButton) or (_C is TcxButton)) then
      begin
        _CName := _C.Name;
        _CText := (_C as TButton).Caption;
        _CHint := (_C as TButton).Hint;
        _CLeft := (_C as TButton).Left;
        _CTop := (_C as TButton).Top;
        _CWidth := (_C as TButton).Width;
        _CHeight := (_C as TButton).Height;

        _CFontName := (_C as TButton).Font.Name;
        _CFontSize := (_C as TButton).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';

        if (_C is TcxButton) then _CType := 323 else _CType := 108;
      end else
      if (_C is TMemo) then
      begin
        _CType := 109;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TMemo).Font.Name;
        _CFontSize := (_C as TMemo).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TCheckBox) then
      begin
        _CType := 110;
        _CName := _C.Name;
        if (Trim((_C as TCheckBox).Caption) <> '') then
          _CText := (_C as TCheckBox).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TCheckBox).Font.Name;
        _CFontSize := (_C as TCheckBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TRadioButton) then
      begin
        _CType := 111;
        _CName := _C.Name;
        if (Trim((_C as TRadioButton).Caption) <> '') then
          _CText := (_C as TRadioButton).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TRadioButton).Font.Name;
        _CFontSize := (_C as TRadioButton).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TListBox) then
      begin
        _CType := 112;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TListBox).Font.Name;
        _CFontSize := (_C as TListBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TComboBox) then
      begin
        _CType := 113;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TComboBox).Font.Name;
        _CFontSize := (_C as TComboBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TScrollBar) then
      begin
        _CType := 114;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TRadioGroup) then
      begin
        _CType := 115;
        _CName := _C.Name;
        if (Trim((_C as TRadioGroup).Caption) <> '') then
          _CText := (_C as TRadioGroup).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TRadioGroup).Font.Name;
        _CFontSize := (_C as TRadioGroup).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TToolButton) then
      begin
        _CType := 116;
        _CName := _C.Name;
        if (Trim((_C as TToolButton).Caption) <> '') then
          _CText := (_C as TToolButton).Caption;
        _CHint := (_C as TControl).Hint;
      end else
      if (_C is TTabSheet) then
      begin
        _CType := 117;
        _CName := _C.Name;
        if (Trim((_C as TTabSheet).Caption) <> '') then
          _CText := (_C as TTabSheet).Caption;
        _CHint := (_C as TControl).Hint;
        _CFontName := (_C as TTabSheet).Font.Name;
        _CFontSize := (_C as TTabSheet).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TTabSheet).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TTabSheet).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TTabSheet).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TTabSheet).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxGridDBTableView) then
      begin
        for j := 0 to ((_C as TcxGridDBTableView).ColumnCount - 1) do
        begin
          _CType := 422;
          _CName := _C.Name + '[' + IntToStr(j) + ']';

          if (Trim((_C as TcxGridDBTableView).Columns[j].Caption) <> '') then
            _CText := (_C as TcxGridDBTableView).Columns[j].Caption;

          _CWidth := (_C as TcxGridDBTableView).Columns[j].Width;
          _SaveText();
        end;
      end else
      if (_C is TcxTextEdit) then
      begin
        _CType := 305;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxTextEdit).Style.Font.Name;
        _CFontSize := (_C as TcxTextEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxMaskEdit) then
      begin
        _CType := 306;
        _CName := _C.Name;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxMaskEdit).Style.Font.Name;
        _CFontSize := (_C as TcxMaskEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxMemo) then
      begin
        _CType := 307;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxMemo).Style.Font.Name;
        _CFontSize := (_C as TcxMemo).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDateEdit) then
      begin
        _CType := 308;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDateEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDateEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxCheckBox) then
      begin
        _CType := 310;
        _CName := _C.Name;
        if (Trim((_C as TcxCheckBox).Properties.Caption) <> '') then
          _CText := (_C as TcxCheckBox).Properties.Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxCheckBox).Style.Font.Name;
        _CFontSize := (_C as TcxCheckBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxComboBox) then
      begin
        _CType := 311;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxComboBox).Style.Font.Name;
        _CFontSize := (_C as TcxComboBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxImageComboBox) then
      begin
        _CType := 312;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TcxSpinEdit) then
      begin
        _CType := 313;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxSpinEdit).Style.Font.Name;
        _CFontSize := (_C as TcxSpinEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxCalcEdit) then
      begin
        _CType := 314;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxCalcEdit).Style.Font.Name;
        _CFontSize := (_C as TcxCalcEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxHyperLinkEdit) then
      begin
        _CType := 315;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxHyperLinkEdit).Style.Font.Name;
        _CFontSize := (_C as TcxHyperLinkEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxTimeEdit) then
      begin
        _CType := 316;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxTimeEdit).Style.Font.Name;
        _CFontSize := (_C as TcxTimeEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxCurrencyEdit) then
      begin
        _CType := 317;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxCurrencyEdit).Style.Font.Name;
        _CFontSize := (_C as TcxCurrencyEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxImage) then
      begin
        _CType := 318;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TcxBlobEdit) then
      begin
        _CType := 319;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxBlobEdit).Style.Font.Name;
        _CFontSize := (_C as TcxBlobEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxMRUEdit) then
      begin
        _CType := 320;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxMRUEdit).Style.Font.Name;
        _CFontSize := (_C as TcxMRUEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxPopupEdit) then
      begin
        _CType := 321;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxPopupEdit).Style.Font.Name;
        _CFontSize := (_C as TcxPopupEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxLookupComboBox) then
      begin
        _CType := 322;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxLookupComboBox).Style.Font.Name;
        _CFontSize := (_C as TcxLookupComboBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxButtonEdit) then
      begin
        _CType := 309;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxButtonEdit).Style.Font.Name;
        _CFontSize := (_C as TcxButtonEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxRadioButton) then
      begin
        _CType := 324;
        _CName := _C.Name;
        if (Trim((_C as TcxRadioButton).Caption) <> '') then
          _CText := (_C as TcxRadioButton).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxRadioButton).Font.Name;
        _CFontSize := (_C as TcxRadioButton).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxRadioButton).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxRadioGroup) then    // XXXXX
      begin
        _CType := 325;
        _CName := _C.Name;
        if (Trim((_C as TcxRadioGroup).Caption) <> '') then
          _CText := (_C as TcxRadioGroup).Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxRadioGroup).Style.Font.Name;
        _CFontSize := (_C as TcxRadioGroup).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxListBox) then
      begin
        _CType := 326;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxListBox).Style.Font.Name;
        _CFontSize := (_C as TcxListBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxNavigator) then
      begin
        _CType := 327;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TcxDBTextEdit) then
      begin
        _CType := 401;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBTextEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBTextEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBTextEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBMaskEdit) then
      begin
        _CType := 402;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBMaskEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBMaskEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBMaskEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBMemo) then
      begin
        _CType := 403;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBMemo).Style.Font.Name;
        _CFontSize := (_C as TcxDBMemo).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBMemo).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBDateEdit) then
      begin
        _CType := 404;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBDateEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBDateEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBDateEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBButtonEdit) then
      begin
        _CType := 405;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBButtonEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBButtonEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBButtonEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBCheckBox) then
      begin
        _CType := 406;
        _CName := _C.Name;
        if (Trim((_C as TcxDBCheckBox).Properties.Caption) <> '') then
          _CText := (_C as TcxDBCheckBox).Properties.Caption;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBCheckBox).Style.Font.Name;
        _CFontSize := (_C as TcxDBCheckBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBCheckBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBComboBox) then
      begin
        _CType := 407;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBComboBox).Style.Font.Name;
        _CFontSize := (_C as TcxDBComboBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBImageComboBox) then
      begin
        _CType := 408;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TcxDBSpinEdit) then
      begin
        _CType := 409;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBSpinEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBSpinEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBSpinEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBCalcEdit) then
      begin
        _CType := 410;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBCalcEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBCalcEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBCalcEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBHyperLinkEdit) then
      begin
        _CType := 411;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBHyperLinkEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBHyperLinkEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBHyperLinkEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBTimeEdit) then
      begin
        _CType := 412;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBTimeEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBTimeEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBTimeEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBCurrencyEdit) then
      begin
        _CType := 413;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBCurrencyEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBCurrencyEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBCurrencyEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBImage) then
      begin
        _CType := 414;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TcxDBBlobEdit) then
      begin
        _CType := 415;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBBlobEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBBlobEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBBlobEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBMRUEdit) then
      begin
        _CType := 416;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBMRUEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBMRUEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBMRUEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBPopupEdit) then
      begin
        _CType := 417;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBPopupEdit).Style.Font.Name;
        _CFontSize := (_C as TcxDBPopupEdit).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBPopupEdit).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBLookupComboBox) then
      begin
        _CType := 418;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBLookupComboBox).Style.Font.Name;
        _CFontSize := (_C as TcxDBLookupComboBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBLookupComboBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBRadioGroup) then
      begin
        _CType := 419;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBRadioGroup).Style.Font.Name;
        _CFontSize := (_C as TcxDBRadioGroup).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBRadioGroup).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBListBox) then
      begin
        _CType := 420;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TcxDBListBox).Style.Font.Name;
        _CFontSize := (_C as TcxDBListBox).Style.Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TcxDBListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TcxDBListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TcxDBListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TcxDBListBox).Style.Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TcxDBNavigator) then
      begin
        _CType := 421;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TDBGrid) then
      begin
        for j := 0 to ((_C as TDBGrid).Columns.Count - 1) do
        begin
          _CType := 201;
          _CName := _C.Name + '[' + IntToStr(j) + ']';
          _CHint := '';
          _CWidth := (_C as TDBGrid).Columns[j].Width;
          _CFontName := (_C as TDBGrid).Columns[j].Title.Font.Name;
          _CFontSize := (_C as TDBGrid).Columns[j].Title.Font.Size;
          _CFontStyle := '';
          if (fsBold in (_C as TDBGrid).Columns[j].Title.Font.Style) then
            _CFontStyle := _CFontStyle + 'B';
          if (fsItalic in (_C as TDBGrid).Columns[j].Title.Font.Style) then
            _CFontStyle := _CFontStyle + 'I';
          if (fsUnderline in (_C as TDBGrid).Columns[j].Title.Font.Style) then
            _CFontStyle := _CFontStyle + 'U';
          if (fsStrikeOut in (_C as TDBGrid).Columns[j].Title.Font.Style) then
            _CFontStyle := _CFontStyle + 'S';

          _CText := (_C as TDBGrid).Columns[j].Title.Caption;

          _SaveText();
        end;

        InitComponentValue();

        _CType := 201;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBGrid).Font.Name;
        _CFontSize := (_C as TDBGrid).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBGrid).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBGrid).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBGrid).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBGrid).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBNavigator) then
      begin
        _CType := 202;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TDBEdit) then
      begin
        _CType := 204;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBEdit).Font.Name;
        _CFontSize := (_C as TDBEdit).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBEdit).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBMemo) then
      begin
        _CType := 205;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBMemo).Font.Name;
        _CFontSize := (_C as TDBMemo).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBMemo).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBImage) then
      begin
        _CType := 206;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end else
      if (_C is TDBListBox) then
      begin
        _CType := 207;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBListBox).Font.Name;
        _CFontSize := (_C as TDBListBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBComboBox) then
      begin
        _CType := 208;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBComboBox).Font.Name;
        _CFontSize := (_C as TDBComboBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBCheckBox) then
      begin
        _CType := 209;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBCheckBox).Font.Name;
        _CFontSize := (_C as TDBCheckBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBCheckBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBRadioGroup) then
      begin
        _CType := 210;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBRadioGroup).Font.Name;
        _CFontSize := (_C as TDBRadioGroup).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBRadioGroup).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBLookupListBox) then
      begin
        _CType := 211;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBLookupListBox).Font.Name;
        _CFontSize := (_C as TDBLookupListBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBLookupListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBLookupListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBLookupListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBLookupListBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBLookupComboBox) then
      begin
        _CType := 212;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
        _CFontName := (_C as TDBLookupComboBox).Font.Name;
        _CFontSize := (_C as TDBLookupComboBox).Font.Size;
        _CFontStyle := '';
        if (fsBold in (_C as TDBLookupComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'B';
        if (fsItalic in (_C as TDBLookupComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'I';
        if (fsUnderline in (_C as TDBLookupComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'U';
        if (fsStrikeOut in (_C as TDBLookupComboBox).Font.Style) then
          _CFontStyle := _CFontStyle + 'S';
      end else
      if (_C is TDBRichEdit) then
      begin
        _CType := 213;
        _CName := _C.Name;
        _CHint := (_C as TControl).Hint;
        _CLeft := (_C as TControl).Left;
        _CTop := (_C as TControl).Top;
        _CWidth := (_C as TControl).Width;
        _CHeight := (_C as TControl).Height;
      end;

      if (_CName <> '') then
        _SaveText();
    end;
  finally
    _InsertQuery.Free();

    if (_Transaction.InTransaction) then
      _Transaction.Commit();
  end;
end;

exports
  LoadComponents, SaveComponents;

end.
