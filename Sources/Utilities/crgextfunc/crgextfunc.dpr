{ *********************************************************************** }
{                                                                         }
{ The CRG Software Cross-Platform Runtime Library                         }
{ CRG - Extended Function DLL Library                                     }
{                                                                         }
{ Copyright (c) 2006 CRG Software Co., Ltd.                               }
{                                                                         }
{ *********************************************************************** }

library crgextfunc;

uses
  SysUtils, Variants, Classes, DB, Controls;

{$R *.res}

function GetDigit(StrValue: String): Double;
var
  i: Integer;
  S: String;
begin
  S := '';
  for i := 1 to Length(StrValue) do
    if StrValue[i] in ['0'..'9', '.'] then
      S := S + StrValue[i];
  try
    Result := StrToFloat(S);
  except
    Result := 0.00;
  end;
end;

function GetStrDigit(StrValue: String): String;
var
  i: Integer;
  S: String;
begin
  S := '';
  for i := 1 to Length(StrValue) do
    if StrValue[i] in ['0'..'9', '.'] then
      S := S + StrValue[i];
  Result := S;
end;

function StrToDouble(StrValue: String): Double;
var
  i: Integer;
  S: String;
begin
  S := '';
  for i := 1 to Length(StrValue) do
    if StrValue[i] in ['0'..'9', '.'] then
      S := S + StrValue[i];
  try
    Result := StrToFloat(S);
  except
    Result := 0.00;
  end;
end;

function IntToDate(const _Int: Integer; IsBudist: Boolean = False): TDate;
var
  d, m, y: Word;
begin
  if (_Int = 0) then
  begin
    Result := Date();
    Exit;
  end;

  try
    y := _Int div 10000;
    if (IsBudist) then
      y := y - 543;
    m := (_Int mod 10000) div 100;
    d := _Int mod 100;

    Result := EncodeDate(y, m, d);
  except
    Result := Now();
  end;
end;

function DateToInt(const _Date: TDate): Integer;
var
  d, m, y: Word;
begin
  try
    DecodeDate(_Date, y, m, d);
    Result := (y * 10000) + (m * 100) + d;
  except
    Result := 0;
  end;
end;

function TimeToInt(const _Time: TDate): Integer;
var
  h, m, s, ms: Word;
begin
  try
    DecodeTime(_Time, h, m, s, ms);
    Result := (h * 10000) + (m * 100) + s;
  except
    Result := 0;
  end;
end;

function IntToTime(const _Int: Integer): TTime;
var
  h, m, s, ms: Word;
begin
  try
    h := _Int div 10000;
    m := (_Int mod 10000) div 100;
    s := _Int mod 10;
    ms := 0;

    Result := EncodeTime(h, m, s, ms);
  except
    Result := NULL;
  end;
end;

function IncludeStr(StrList: TStrings; SeparateChar: Char = '#'): String;
var
  i: Integer;
begin
  Result := '';
  if (StrList.Count = 0) then
    Exit;

  Result := StrList[0];

  for i := 1 to (StrList.Count - 1) do
    Result := Result + SeparateChar + StrList[i];
end;

function ExcludeStr(var StrSrc: String; SeparateChar: Char = '#'): String;
var
  i: Integer;
begin
  Result := '';

  i := 1;
  while (i <= Length(StrSrc)) and (StrSrc[i] <> SeparateChar) do
  begin
    Result := Result + StrSrc[i];
    Inc(i);
  end;

  if (i < Length(StrSrc)) then
    StrSrc := Copy(StrSrc, i, Length(StrSrc) - i)
  else
    StrSrc := '';
end;

function PreSort(const S: String): String;
var
  i: Integer;
  C: Char;
begin
  Result := S;
  for i := 2 to Length(S) do
    if S[i] in ['à'..'ä'] then
    begin
      C := Result[i - 1];
      Result[i - 1] := Result[i];
      Result[i] := C;
    end;
end;

function PostSort(const S: String): String;
var
  i: Integer;
  C: Char;
begin
  Result := S;
  for i := 1 to (Length(S) - 1) do
    if S[i] in ['à'..'ä'] then
    begin
      C := Result[i + 1];
      Result[i + 1] := Result[i];
      Result[i] := C;
    end;
end;

procedure AddStrFields(var StrDest: String; FieldData: String; Index: Integer);
begin
  StrDest := '$F' + IntToStr(Index) + ':' + FieldData;
end;

function GetStrFields(const StrFields: String; Index: Integer): String;
var
  P: Integer;
  S: String;
begin
  Result := '';

  S := '$F' + IntToStr(Index) + ':';
  P := Pos(S, StrFields);
  if (P = 0) then
    Exit;

  P := P + Length(S);

  while ((P <= Length(StrFields)) and (StrFields[P] <> '$')) do
  begin
    Result := Result + StrFields[P];

    Inc(P);
  end;
end;

function LoadDBToList(DataSet: TDataSet; List: TStrings;
  FieldsName: array of String): Boolean;

  function ExtractFieldSize(var S: String): Integer;
  var
    P: Integer;
  begin
    Result := 0;

    P := Pos(':', S);
    if (P <> 0) then
    begin
      try
        Result := StrToInt(Trim(Copy(S, P + 1, Length(S) - P)));
      except
        Result := 0;
      end;

      S := Copy(S, 1, P - 1);
    end;
  end;

var
  i, Size: Integer;
  FieldName, sData, S: String;
  Openned: Boolean;
begin
  Openned := False;
  try
    Result := True;
    List.Clear();
    try
      Openned := DataSet.Active;
      if (not Openned) then
        DataSet.Open();

      DataSet.First();
      while not DataSet.Eof do
      begin
        FieldName := FieldsName[Low(FieldsName)];
        Size := ExtractFieldSize(FieldName);

        case DataSet.FieldByName(FieldName).DataType of
          ftInteger:
            S := IntToStr(DataSet.FieldByName(FieldName).AsInteger);
          ftWideString, ftString, ftFixedChar:
            S := Trim(DataSet.FieldByName(FieldName).AsString);
        end;

        sData := Format('%' + IntToStr(Size) + 's', [S]);

        for i := Low(FieldsName) + 1 to High(FieldsName) do
        begin
          FieldName := FieldsName[i];
          Size := ExtractFieldSize(FieldName);

          case DataSet.FieldByName(FieldName).DataType of
            ftInteger:
              S := IntToStr(DataSet.FieldByName(FieldName).AsInteger);
            ftWideString, ftString, ftFixedChar:
              S := Trim(DataSet.FieldByName(FieldName).AsString);
          end;

          sData := sData + ' | ' + Format('%' + IntToStr(Size) + 's', [S]);
        end;
        List.Add(sData);

        DataSet.Next();
      end;
    except
      Result := False;
    end;
  finally
    if (not Openned) then
    begin
      if DataSet.Active then
        DataSet.Close();
    end;
  end;
end;

function FindSubStrInList(const SubStr: String; StrList: TStrings;
  StartIndex: Integer = 0): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := StartIndex to (StrList.Count - 1) do
    if (Pos(UpperCase(SubStr), UpperCase(StrList[i])) <> 0) then
    begin
      Result := i;
      Break;
    end;
end;

function GetStrCode(const S: String; const SubStr: String = '|';
  Fld : integer = 0): String;
var
  P_Start : integer;
  i , C_SubStr_1 , C_SubStr_2 : integer;
begin
  if Fld = 0 then
    Result := Trim(Copy(S, 1, Pos(SubStr, S) - 1))
  else
  begin
    C_SubStr_1 := 0;
    for i := 0 to Length(S) do
    begin
      if S[i] = SubStr then
        Inc(C_SubStr_1);
      if C_SubStr_1 = Fld then
        Break;
    end;

    C_SubStr_2 := C_SubStr_1;
    P_Start := i + 1;

    for i:= P_Start to Length(S) do
    begin
      if S[i] = SubStr then
      begin
        Inc(C_SubStr_2);
        Break;
      end;
    end;

    if (C_SubStr_1 = C_SubStr_2) then
      Result := Trim(Copy(S, P_Start, Length(S)))
    else
      Result := Trim(Copy(S, P_Start, i - 1));
  end;
end;

function GetStrDesc(const S: String; const SubStr: String = '|'): String;
var
  P: Integer;
begin
  P := Pos(SubStr, S);
  Result := Trim(Copy(S, P + 2, Length(S) - (P + 1)));
end;

function ConvertStrListToStr01(const _FileName: String): String;
var
  T: TStringList;
  i: Integer;
begin
  Result := '';

  T := TStringList.Create();
  try
    T.LoadFromFile(_FileName);
    for i := 0 to (T.Count - 1) do
      Result := Result + T[i] + '#';
  finally
    T.Free();
  end;
end;

function ConvertStrListToStr02(_SL: TStrings): String;
var
  i: Integer;
begin
  Result := '';

  for i := 0 to (_SL.Count - 1) do
    Result := Result + _SL[i] + '#';
end;

procedure ConvertStrToStrList01(const _Str: String; _SL: TStrings);
var
  i: Integer;
  S: String;
begin
  i := 1;  S := '';
  while (i <= Length(_Str)) do
  begin
    if (_Str[i] = '#') then
    begin
      _SL.Add(S);
      S := '';
    end else
      S := S + _Str[i];

    Inc(i);
  end;
end;

procedure ConvertStrToStrList02(const _Str: String; const _FileName: String);
var
  _SL: TStringList;
  i: Integer;
  S: String;
begin
  _SL := TStringList.Create();
  try
    i := 1;  S := '';
    while (i <= Length(_Str)) do
    begin
      if (_Str[i] = '#') then
      begin
        _SL.Add(S);
        S := '';
      end else
        S := S + _Str[i];

      Inc(i);
    end;
    if (_SL.Count > 0) then
      _SL.SaveToFile(_FileName);
  finally
    _SL.Free();
  end;
end;

exports
  GetDigit,
  GetStrDigit,
  StrToDouble,

  IntToDate,
  DateToInt,
  TimeToInt,
  IntToTime,
  IncludeStr,
  ExcludeStr,

  PreSort,
  PostSort,

  AddStrFields,
  GetStrFields,

  LoadDBToList,

  FindSubStrInList,
  GetStrCode,
  GetStrDesc,

  ConvertStrListToStr01,
  ConvertStrListToStr02,

  ConvertStrToStrList01,
  ConvertStrToStrList02;

end.
