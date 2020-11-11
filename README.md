# RTTIOrdinals
Utility Console App to Display Ordinal RTTI Properties
## Overview
This is a short Delphi Console application that displays a number of properties about types. The information is obtained using RTTI (Run Time Type Information) methods and then displayed used a Writeln procedure. Investigation has been limited to Ordinal types, but a couple of rogue types are also included with limited success.

The display appears as a series of lines that can be copied and pasted into a .csv file for import into Excel or other program that reads .csv files. From there, it can be manipulated to serve other purposes.

It should also be mentioned that one of the reasons for writing this short program was to be able to run it both as a 32-bit Windows applicaton *and* as a 64-bit application. The results are different for some of Delphi's types. This difference is one of the main benefits of examining both sets of RTTI output.
## Output
Output consists of one line of text per type queried. Type information is obtained by using the `GetType` method of the RTTI.
### Type Name
One of the properties returned is the name of the type, which is frequently different from the name used in the `GetType` method. For example, querying the type `DWORD` returns an entry with the name `Cardinal`. I have interpreted this to mean that the query name is an alias for the returned name. When the query name and the returned name are the same, I interpret this to mean that the type is a fundamental type.
### Type Properties
   * Alias Name (Name used in the `GetType` method to obtain parameter information)
   * Fundamental Name (Name returned by the `GetType` query in the `Name` parameter)
   * TypeKind (an RTTI enumeration designating the specific type)
   * Byte Length
   * Lowest Possible Type Value (displayed in hexadecimal)
   * Highest Possible Type Value (displayed in hexadecimal)
### Sample output:
```
NativeInt,NativeInt,16,8,8000000000000000,7FFFFFFFFFFFFFFF
NativeUInt,NativeUInt,16,8,0000000000000000,FFFFFFFFFFFFFFFF
LongInt,Integer,1,4,80000000,7FFFFFFF
LongWord,Cardinal,1,4,00000000,FFFFFFFF
ShortInt,ShortInt,1,1,80,7F
Int8,ShortInt,1,1,80,7F
Byte,Byte,1,1,00,FF
UInt8,Byte,1,1,00,FF
SmallInt,SmallInt,1,2,8000,7FFF
Int16,SmallInt,1,2,8000,7FFF
Word,Word,1,2,0000,FFFF
UInt16,Word,1,2,0000,FFFF
FixedInt,Integer,1,4,80000000,7FFFFFFF
FixedUInt,Cardinal,1,4,00000000,FFFFFFFF
Integer,Integer,1,4,80000000,7FFFFFFF
Int32,Integer,1,4,80000000,7FFFFFFF
DWORD,Cardinal,1,4,00000000,FFFFFFFF
Cardinal,Cardinal,1,4,00000000,FFFFFFFF
UInt32,Cardinal,1,4,00000000,FFFFFFFF
Int64,Int64,16,8,8000000000000000,7FFFFFFFFFFFFFFF
UInt64,UInt64,16,8,0000000000000000,FFFFFFFFFFFFFFFF
Pointer,Unsupported,20,0,,
Currency,Currency,4,8,,
```
