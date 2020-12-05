# Delphi Integer Types
Exploring Dephi Integer types

##Overview
I counted 21 different `Integer` types generally available in Delphi. If you add to this the `Pointer` and `Currency` types (that seem like integers but are not the same as integer types) the number becomes 23. Additionally, there are at least three platforms available to the developer (Win-32, Win-64 and Linux-64) not to mention others making a somewhat daunting array of choices facing the developer. Actually, it's not that daunting and once you get matters sorted out in your head, it's a pretty well-organized and logical system. But, since I've been meaning to explore `RTTI` (Runtime Type Information) for some time, it was a good excuse to write some simple code to explore Integer Types using `RTTI`.

As a framework, `Ordinals` are one of Delphi's `Simple` Types. A Taxonomy of Delphi Types can be found at [**About Data Types (Delphi)**](http://docwiki.embarcadero.com/RADStudio/Sydney/en/About_Data_Types_(Delphi) "About Data Types (Delphi)")

`Simple` types consist of `Ordinal` Types and `Real` Types. `Ordinal` Types include `Integer` Types but also `Character`, `Boolean`, `Enumerated` and `Subrange` Types. This blog is concerned with `Integers` with a few comments tossed in about `Real` (in the form of `Currency`) and `Pointer` Types.

## Methodology
I started by writing a short Delphi Console application that displays some of the `RTTI` properties for Delphi's `Integers`. Next, I consolidated the output from running the application three times, once as a Windows-32 app, once as a Windows-64 app, and once as a Linux-64 app.

You can download the project from GitHub:

[RTTIIntegers](https://github.com/Pasquina/RTTIIntegers.git "GitHub Project")

I recommend downloading the project and then opening the **Platform Types.pdf** file in the Output folder. It will be much easier to read than the thumbnail that I'm showing here.

![Platform Types](https://user-images.githubusercontent.com/19628561/101221830-1c97ee00-364e-11eb-9056-e7ed45ff6714.jpg)

## Discussion

Refer to the *RAD Studio Docwiki* [Simple Types (Delphi)](http://docwiki.embarcadero.com/RADStudio/Sydney/en/Simple_Types_(Delphi) "RAD Studio DocWiki").

According to the *Embarcadero DocWiki*, `Integer` types can be platform-dependent or platform-independent.

Platform-dependent `integers`

:	These are shown in the salmon-colored area of the spreadsheet. Their properties change from platform to platform as you might expect from their classification.

Platform-independent `integers`

:	These are shown in the blue-colored area. As you can see, their properties remain the same across all three of the platforms.

Non-conforming `integers`

:	These are shown in the green-colored area. Although they serve largely as `integers`, they are not considered `integer` types. They are included here as a matter of interest and completeness

###Platform-independent Integers

The largest part of the chart is taken by the Platform-independent Integers. Under most circumstances, you will use Integers that are Platform-independent. Further, the most common choice is likely to be the Integer type. The fundamental types are a result of two characteristics:

- The range or length of the Integer. Integers can be 1, 2, 4 or 8 bytes in length.
- The signedness of the Integer. Signed Integers can represent both positive and negative numbers; Unsigned Integers are only capable of representing positive values.

In fact, there are only two fundamental types for each of the four range values; one for signed and one for unsigned.

ShortInt and Byte
:	represent signed and unsigned Integers of one byte in length respectively.

SmallInt and Word 
:	are the signed and unsigned types of two bytes length.

Integer and Cardinal 
:	are four bytes in length and designate signed and unsigned values respectively.

Int64 and UInt64 
:	handle valaues eight bytes in length, signed and unsigned.

Each of these fundamental types has a number of aliases which may be used in place of the fundamental type. There are undoubtedly other aliases I haven't mentioned, and additionally any developer is free to define his own aliases local to his application, although doing so should be approached with caution so as to avoid unnecessary clutter and confusion.

###Platform-dependent `Integers`

According to Marco Cantù’s Object Pascal Handbook,[^1] the `Integer` types 

`NativeInt` and `NativeUInt` 
:	adapt to the `Pointer` size. Hence, if you need an `Integer` that adapts to the `Pointer` characteristics, these are the choice to make. In other words, `NativeInt` and `NativeUInt` adapt to `Pointers` on the Native Platform.

`LongInt` and `LongUint`
:	are used when it is necessary to map to native platform APIs. Since mapping to API functions is not frequently encountered, you will probably not find yourself using these types a great deal.

`Pointer` and `Currency`
:	A Pointer is a Main Storage addressing mechanism, thus you would expect it to change size depending on platform. In fact, it does just that, being 32 bits on 32-bit platforms and 64 bits on 64-bit platforms. Also note that `RTTI` handles `Pointers` differently from `Integers`. The `TypeKind` value for `Pointer` is different from all other types illustrated.

:	The `Currency` type is actually a floating point number that behaves like a fixed point number. It always has four decimal places and is included to facilitate monetary calculations with no loss of precision. `Currency` has a `TypeKind` value of 4, indicating that it is a floating point number.

##Conclusion

Under most circumstances, `Integer` will probably be your best choice for *integer* representation. If a different range or signedness is required, a type can be selected from the fundamental types with the required characteristics. Using the real names (not aliases) of the fundamental types will help readability. You will undoubtedly find uses of aliases in code you are called upon to maintain, but if you keep in mind that an alias is nothing more than a different name for something you're used to handling, there should be no problems with understanding.

[^1]: Cantù, Marco, *Object Pascal Handbook—Berlin Edition*, Embarcadero Technologies, July, 2015, (PDF)