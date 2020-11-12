program prRTTI;
{
MIT License

Copyright (c) 2020 Milan Vydareny

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}

{$APPTYPE CONSOLE}

{$R *.res}
{$M+}

uses
  System.SysUtils, System.RTTI, System.TypInfo, System.Types;

procedure LogType(const AStatedType: String; const ARTTIType: TRTTIType);
var
  LName: String;
  LKind: TTypeKind;
  LMinValue: Int64;
  LMaxValue: Int64;
  LMinValue32: Int32;
  LMaxValue32: Int32;
  LMinValue16: Int16;
  LMaxValue16: Int16;
  LMinValue8: Int8;
  LMaxValue8: Int8;
  LSize: Integer;
  LMinString: String;
  LMaxString: String;
begin
  case ARTTIType.TypeKind of
    TTypeKind.tkInteger:
      with TRTTIOrdinalType(ARTTIType) do
      begin
        LName := Name;
        LKind := TypeKind;
        LSize := TypeSize;
        case Typesize of
          1:
            begin
              LMinValue8 := MinValue;
              LMaxValue8 := MaxValue;
              LMinString := IntToHex(LMinValue8);
              LMaxString := IntToHex(LMaxValue8);
            end;
          2:
            begin
              LMinValue16 := MinValue;
              LMaxValue16 := MaxValue;
              LMinString := IntToHex(LMinValue16);
              LMaxString := IntToHex(LMaxValue16);
            end
        else
          begin
            LMinValue32 := MinValue;
            LMaxValue32 := MaxValue;
            LMinString := IntToHex(LMinValue32);
            LMaxString := IntToHex(LMaxValue32);
          end;
        end;
      end;
    TTypeKind.tkInt64:
      with TRTTIInt64Type(ARTTIType) do
      begin
        LName := Name;
        LKind := TypeKind;
        LMinValue := MinValue;
        LMaxValue := MaxValue;
        LSize := TypeSize;
        LMinString := IntToHex(LMinValue);
        LMaxString := IntToHex(LMaxValue);
      end;
    TTypeKind.tkFloat:
      with TRTTIFloatType(ARTTIType) do
      begin
        LName := Name;
        LKind := TypeKind;
        LMinValue := 0;
        LMaxValue := 0;
        LSize := TypeSize;;
        LMinString := '';
        LMaxString := '';
      end
  else
    begin
      with TRTTIPointerType(ARTTIType) do
      begin
        LName := Name;
        LKind := ARTTIType.TypeKind;
        LSize := TypeSize;
        LMinValue := 0;
        LMaxValue := 0;
        LMinString := '';
        LMaxString := '';
      end;
    end;
  end;

  WriteLn(Format('%s,%s,%u,%u,%s,%s', [AStatedType, LName, Ord(LKind), LSize, LMinString, LMaxString]));
end;

var
  LRTTIContext: TRTTIContext;
begin
  LRTTIContext := TRTTIContext.Create;
  try
    LogType('NativeInt', LRTTIContext.GetType(TypeInfo(NativeInt)));
    LogType('NativeUInt', LRTTIContext.GetType(TypeInfo(NativeUInt)));
    LogType('LongInt', LRTTIContext.GetType(TypeInfo(LongInt)));
    LogType('LongWord', LRTTIContext.GetType(TypeInfo(LongWord)));
    LogType('ShortInt', LRTTIContext.GetType(TypeInfo(ShortInt)));
    LogType('Int8', LRTTIContext.GetType(TypeInfo(Int8)));
    LogType('Byte', LRTTIContext.GetType(TypeInfo(Byte)));
    LogType('UInt8', LRTTIContext.GetType(TypeInfo(UInt8)));
    LogType('SmallInt', LRTTIContext.GetType(TypeInfo(SmallInt)));
    LogType('Int16', LRTTIContext.GetType(TypeInfo(Int16)));
    LogType('Word', LRTTIContext.GetType(TypeInfo(Word)));
    LogType('UInt16', LRTTIContext.GetType(TypeInfo(UInt16)));
    LogType('Integer', LRTTIContext.GetType(TypeInfo(Integer)));
    LogType('Int32', LRTTIContext.GetType(TypeInfo(Int32)));
    LogType('FixedInt', LRTTIContext.GetType(TypeInfo(FixedInt)));
    LogType('Cardinal', LRTTIContext.GetType(TypeInfo(Cardinal)));
    LogType('UInt32', LRTTIContext.GetType(TypeInfo(UInt32)));
    LogType('FixedUInt', LRTTIContext.GetType(TypeInfo(FixedUInt)));
    LogType('DWORD', LRTTIContext.GetType(TypeInfo(DWORD)));
    LogType('Int64', LRTTIContext.GetType(TypeInfo(Int64)));
    LogType('UInt64', LRTTIContext.GetType(TypeInfo(Uint64)));
    LogType('Pointer', LRTTIContext.GetType(TypeInfo(Pointer)));
    LogType('Currency', LRTTIContext.Gettype(TypeInfo(Currency)));
    Readln;
  finally
    LRTTIContext.Free;
  end;
end.
