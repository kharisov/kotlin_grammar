lexer grammar Kotlin_Lexer;
@lexer::members {
    int commentsOpened = 0;
    int commentsClosed = 0;
}
/*------LEXER------*/
//--Keywords
//-Hard keywords

PACKAGE : 'package';
AS : 'as';
TYPEALIAS : 'typealias';
CLASS : 'class';
THIS : 'this';
SUPER : 'super';
VAL : 'val';
VAR : 'var';
FUN : 'fun';
FOR : 'for';
NULL : 'null';
TRUE : 'true';
FALSE : 'false';
IS : 'is';
IN : 'in';
THROW : 'throw';
RETURN : 'return';
BREAK : 'break';
CONTINUE : 'continue';
OBJECT : 'object';
IF : 'if';
TRY : 'try';
ELSE : 'else';
WHILE : 'while';
DO : 'do';
WHEN : 'when';
INTERFACE : 'interface';
TYPEOF : 'typeof';
//-Soft keywords
DYNAMIC : 'dynamic';
FILE : 'file';
IMPORT : 'import';
CONSTRUCTOR : 'constructor';
BY : 'by';
WHERE : 'where';
INIT : 'init';
COMPANION : 'companion';
CATCH : 'catch';
FINALLY : 'finally';
ABSTRACT : 'abstract';
FINAL : 'final';
ENUM : 'enum';
OPEN : 'open';
ANNOTATION : 'annotation';
SEALED : 'sealed';
DATA : 'data';
OVERRIDE : 'override';
LATEINIT : 'lateinit';
PRIVATE : 'private';
PROTECTED : 'protected';
PUBLIC : 'public';
INTERNAL : 'internal';
OUT : 'out';
NOINLINE : 'noinline';
CROSSLINE : 'crossline';
VARARG : 'vararg';
REIFIED : 'reified';
TAILREC : 'tailrec';
OPERATOR : 'operator';
INFIX : 'infix';
INLINE : 'inline';
EXTERNAL : 'external';
CONST : 'const';
SUSPEND : 'suspend';

//--Literals
//-Integer Literals
IntegerLiteral
    : DecimalIntegerLiteral
    | HexIntegerLiteral
    | BinaryIntegerLiteral
    ;

fragment
DecimalIntegerLiteral
    : DecimalNumber IntegerTypeSuffix?
    ;

fragment
HexIntegerLiteral
    : HexNumber IntegerTypeSuffix?
    ;

fragment
BinaryIntegerLiteral
    : BinaryNumber IntegerTypeSuffix?
    ;


fragment
IntegerTypeSuffix
    : 'L'
    ;

fragment
DecimalNumber
    : '0'
    | NonZeroDigit (Digits? | Underscores Digits)
    ;

fragment
Digits
    : Digit (DigitOrUnderscore* Digit)?
    ;

fragment
Digit
    : [0-9]
    ;

fragment
NonZeroDigit
    : [1-9]
    ;

fragment
DigitOrUnderscore
    : Digit
    | '_'
    ;

fragment
Underscores
    : '_'+
    ;

fragment
HexNumber
    : '0' [xX] HexDigits
    ;

fragment
HexDigits
    : HexDigit (HexDigitOrUnderscore* HexDigit)?
    ;

fragment
HexDigit
    : [0-9a-fA-F]
    ;

fragment
HexDigitOrUnderscore
    : HexDigit
    | '_'
    ;

fragment
BinaryNumber
    : '0' [bB] BinaryDigits
    ;

fragment
BinaryDigits
    : BinaryDigit (BinaryDgitOrUnderscore* BinaryDigit)?
    ;

fragment
BinaryDigit
    : [01]
    ;

fragment
BinaryDgitOrUnderscore
   : BinaryDigit
   | '_'
   ;

//-Floating-Point Literals
FloatingPointLiteral
    : Digits '.' Digits? ExponentPart? FloatTypeSuffix?
    | '.' Digits ExponentPart? FloatTypeSuffix?
    | Digits ExponentPart FloatTypeSuffix?
    | Digits FloatTypeSuffix
    ;

fragment
ExponentPart
    : ExponentIndicator SignedInteger
    ;

fragment
ExponentIndicator
    : [eE]
    ;

fragment
SignedInteger
    : Sign? Digits
    ;

fragment
Sign
    : [+-]
    ;

fragment
FloatTypeSuffix
    : [fF]
    ;

//-Boolean Literals
BooelanLiteral
    : 'true'
    | 'false'
    ;

//-Char Literals
CharLiteral
    : '\'' SingleCharacter '\''
    | '\'' EscapeSequence '\''
    ;

fragment
SingleCharacter
    : ~['\\]
    ;

//-String Literals
StringLiteral
    : RawStringLiteral
    | EscapedStringLiteral
    ;

fragment
EscapedStringLiteral
    : '"' EscapedStringCharacters? '"'
    ;

fragment
EscapedStringCharacters
    : EscapedStringCharacter+
    ;

fragment
EscapedStringCharacter
    : ~["\\\n]
    | EscapeSequence
    ;

fragment
RawStringLiteral
    : '"""' RawStringCharacters? '"""' //match anything in """..."""
    ;

fragment
RawStringCharacters
    : .+
    ;

//-Escape Sequence for Char and String Literals
fragment
EscapeSequence
    : '\\' [btnr$"'\\]
    | UnicodeEscape
    ;

fragment
UnicodeEscape
    : '\\u' HexDigit HexDigit HexDigit HexDigit
    ;

//-Null Literal
NullLiteral
    : 'null'
    ;

//--Separators
LCOMMENT : '/*';
RCOMMENT : '*/';
LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
LBRACK : '[';
RBRACK : ']';
COLON : ':';
SEMICOLON : ';';
COMMA : ',';
Dot : '.';

//--Operators
IMPLICATION     : '->';
ASSIGN          : '=';
ADD_ASSIGN      : '+=';
SUB_ASSIGN      : '-=';
MUL_ASSIGN      : '*=';
DIV_ASSIGN      : '/=';
MOD_ASSIGN      : '%=';
OR              : '||';
AND             : '&&';
EQUAL           : '==' | '===';
NOTEQUAL        : '!=' | '!==';
GT              : '>';
LT              : '<';
LE              : '<=';
GE              : '>=';
NAME_CHECK      : 'in' | '!in' | 'is' | '!is';
ELVIS           : '?;';
RANGE           : '..';
ADD             : '+';
SUB             : '-';
MUL             : '*';
DIV             : '/';
MOD             : '%';
TYPE_RHS        : 'as' | 'as?';
INC             : '++';
DEC             : '--';
BANG            : '!';
QUESTION        : '?';
QUESTION_DOT    : '?.';

AT : '@';

SEMI
    : '\r'? '\n'
    | ';'
    ;

Identifier
    : JavaIdentifier
    | BacktickedIdentifier
    ;

fragment
BacktickedIdentifier
    : '`' BacktickedIdentifierCharacters '`'
    ;

fragment
BacktickedIdentifierCharacters
    : ~[`\n]+
    ;


fragment
JavaIdentifier
    : JavaLetter JavaLetterOrDigit*
    ;

fragment
JavaLetter //
    :   [a-zA-Z_$] // these are the "java letters" below 0x7F
    |   // covers all characters above 0x7F which are not a surrogate
        ~[\u0000-\u007F\uD800-\uDBFF]
    |   // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
        [\uD800-\uDBFF] [\uDC00-\uDFFF]
    ;

fragment
JavaLetterOrDigit
    :   [a-zA-Z0-9_$] // these are the "java letters or digits" below 0x7F
    |   // covers all characters above 0x7F which are not a surrogate
        ~[\u0000-\u007F\uD800-\uDBFF]
    |   // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
        [\uD800-\uDBFF] [\uDC00-\uDFFF]
    ;

WS  :  [ \t\u000C]+ -> skip
    ;

LineComment
    :   '//' ~[\r\n]* -> channel(HIDDEN)
    ;


Comment
    : LCOMMENT CommentParts? RCOMMENT
    ;

fragment
CommentParts
    : CommentPart+
    ;

fragment
CommentPart
    : Comment
    | ~[*/]
    | '*'+ ~[*/]
    | '/'+ ~[*]
    ;

