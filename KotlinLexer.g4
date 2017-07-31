lexer grammar KotlinLexer;
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
DYNAMIC     : 'dynamic'; //TODO not used in kotlin targeting JVM
FILE        : 'file';
IMPORT      : 'import';
CONSTRUCTOR : 'constructor';
BY          : 'by';
WHERE       : 'where';
INIT        : 'init';
COMPANION   : 'companion';
CATCH       : 'catch';
FINALLY     : 'finally';
ABSTRACT    : 'abstract';
FINAL       : 'final';
ENUM        : 'enum';
OPEN        : 'open';
ANNOTATION  : 'annotation';
SEALED      : 'sealed';
DATA        : 'data';
OVERRIDE    : 'override';
LATEINIT    : 'lateinit';
PRIVATE     : 'private';
PROTECTED   : 'protected';
PUBLIC      : 'public';
INTERNAL    : 'internal';
OUT         : 'out';
NOINLINE    : 'noinline';
CROSSINLINE : 'crossinline';
VARARG      : 'vararg';
REIFIED     : 'reified';
TAILREC     : 'tailrec';
OPERATOR    : 'operator';
INFIX       : 'infix';
INLINE      : 'inline';
EXTERNAL    : 'external';
CONST       : 'const';
SUSPEND     : 'suspend';
INNER       : 'inner';
GET         : 'get';
SET         : 'set';
FIELD       : 'field';
PROPERTY    : 'property';
RECIEVER    : 'receiver';
PARAM       : 'param';
SETPARAM    : 'setparam';
DELEGATE    : 'delegate';
HEADER      : 'header'; //TODO not yet used, but may be in future
IMPL        : 'impl'; //TODO not yet used, but may be in future

SoftKeyword
    : DYNAMIC | FILE | IMPORT | CONSTRUCTOR | BY | WHERE | INIT | COMPANION | CATCH | FINALLY | ABSTRACT | FINAL
        | ENUM | OPEN | ANNOTATION | SEALED | DATA | OVERRIDE | LATEINIT | PRIVATE | PROTECTED | PUBLIC | INTERNAL
        | OUT | NOINLINE | CROSSINLINE | VARARG | REIFIED | TAILREC | OPERATOR | INFIX | INLINE | EXTERNAL | CONST
        | SUSPEND | GET | SET | FIELD | PROPERTY | RECIEVER | PARAM | SETPARAM | DELEGATE | INNER | HEADER | IMPL
    ;

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
    : Digits DOT Digits ExponentPart? FloatTypeSuffix?
    | DOT Digits ExponentPart? FloatTypeSuffix?
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
BooleanLiteral //not used
    : TRUE
    | FALSE
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

//-Escape Sequence for Char and String Literals
EscapeSequence
    : '\\' [btnr$"'\\]
    | UnicodeEscape
    ;

fragment
UnicodeEscape
    : '\\u' HexDigit HexDigit HexDigit HexDigit
    ;

//-Null Literal
NullLiteral //Not used
    : 'null'
    ;

//--Separators
MultipleSemicolons //Two semicolns without whitespace between = error
    : SEMICOLON SEMICOLON
    ;

NL              : '\r'? '\n';
LCOMMENT        : '/*';
RCOMMENT        : '*/';
LPAREN          : '(';
RPAREN          : ')';
LBRACE          : '{' -> pushMode(DEFAULT_MODE);
RBRACE          : '}' -> popMode;
LBRACK          : '[';
RBRACK          : ']';
DOUBLE_COLON    : '::';
COLON           : ':';
SEMICOLON       : ';';
COMMA           : ',';
RAW_STRING_START: '"""' -> pushMode(IN_RAW_STRING);
STRING_START    : '"' -> pushMode(IN_ESCAPED_STRING);

//--Operators
BangInIsWithWS // !in and !is cannot be tokens, because lexer will not match !isTrue as BANG IDENTIFIER, so
                //! and in|is should be separate tokens, but than this rule is needed to match 3 ! in 1..2 as error
    : BANG [ \t]+ IN [ \t]+
    | BANG [ \t]+ IS [ \t]+
    ;

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
//BANG_IN         : '!in';
//BANG_IS         : '!is';
ELVIS           : '?:';
RANGE           : '..';
ADD             : '+';
SUB             : '-';
ASTERISK        : '*';
DIV             : '/';
MOD             : '%';
SAFE_CAST       : 'as?';
INC             : '++';
DEC             : '--';
DOUBLE_BANG     : '!!';
BANG            : '!';
DOT             : '.';
QUESTION        : '?';
QUESTION_DOT    : '?.';
AT              : '@';

QuestionDoubleColon
    : QUESTION+ DOUBLE_COLON
    ;

AnnotationListStart
    : AT LBRACK
    ;

FileAnnotation
    : AT FILE
    ;

AnnotationTarget
    : AT (FIELD
          | PROPERTY
          | GET
          | SET
          | RECIEVER
          | PARAM
          | SETPARAM
          | DELEGATE)
    | FileAnnotation
    ;

LabeledReturn
    : RETURN AT Identifier
    ;

LabeledContinue
    : CONTINUE AT Identifier
    ;

LabeledBreak
    : BREAK AT Identifier
    ;

AT_ID
    : AT Identifier
    ;

Label
    : Identifier AT
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
    :   [a-zA-Z_] // these are the "java letters" below 0x7F
    |   // covers all characters above 0x7F which are not a surrogate
        ~[\u0000-\u007F\uD800-\uDBFF\uFFFD]//\uFFFD = �
    |   // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
        [\uD800-\uDBFF] [\uDC00-\uDFFF]
    ;

fragment
JavaLetterOrDigit
    :   [a-zA-Z0-9_] // these are the "java letters or digits" below 0x7F
    |   // covers all characters above 0x7F which are not a surrogate
        ~[\u0000-\u007F\uD800-\uDBFF\uFFFD]
    |   // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
        [\uD800-\uDBFF] [\uDC00-\uDFFF]
    ;


LineComment
    :   '//' ~[\n]* -> channel(HIDDEN)
    ;


BlockComment
    : LCOMMENT CommentParts? RCOMMENT -> channel(HIDDEN)
    ;

fragment
CommentParts
    : CommentPart+
    ;

fragment
CommentPart
    : BlockComment
    | ~[*/]
    | '*'+ ~[*/]
    | '/'+ ~[*]
    ;

WS  :  [ \t\u000C]+ -> channel(HIDDEN)
    ;

mode IN_ESCAPED_STRING;

STRING_END
    : '"' -> popMode
    ;

LONE_DOLLAR
    : '$'
    ;

ShortTemplate
    : LONE_DOLLAR (Identifier | SoftKeyword | THIS)
    ;

LongTemplateStart
    : LONE_DOLLAR LBRACE -> pushMode(DEFAULT_MODE)
    ;

RegularStringPart
    : ~["\\\n$]+
    | EscapeSequence
    ;

mode IN_RAW_STRING;

RAW_STRING_END //may be improved with some code insertion
    : '"""' '"'* -> popMode
    ;

RAW_LONE_DOLLAR
    : '$'
    ;

RawShortTemplate
    : LONE_DOLLAR (Identifier | SoftKeyword | THIS)
    ;

RAW_LONG_TEMPLATE_START
    : RAW_LONE_DOLLAR LBRACE -> pushMode(DEFAULT_MODE)
    ;

RAW_STRING_QUOTES
    : '""' | '"'
    ;

RegularRawStringPart
    : ~["$]+
    ;