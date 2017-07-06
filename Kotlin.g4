grammar Kotlin;

/*@lexer::members {
    int nesting = 0;
}*/
/*------PARSER------*/
//--file structure
kotlinFile
    : preamble topLevelObject*
    ;

preamble
    : fileAnnotations? packageHeader? importStatement*
    ;

fileAnnotations
    : '@' 'file' ':' ( '[' unescapedAnnotation+ ']' | unescapedAnnotation)
    ;

packageHeader
    : 'package' Identifier ('.' Identifier)* SEMI?
    ;

importStatement
    : 'import' Identifier ('.' Identifier)* ('.' '*' | 'as' Identifier)? SEMI?
    ;

topLevelObject
    : class
    | object
    | function
    | property
    | typeAlias
    ;

typeAlias
    : modifiers 'typealias' Identifier typeParametrs? '=' type
    ;

//--classes
class
    : modifiers ('class' | 'interface') Identifier typeParametrs? primartConstructor?
        (':' annotations delegationSpecifier (',' delegationSpecifier))?
        typeContraints (classBody? | enumClassBody)
    ;

primaryConstructor
    : (modifiers 'constructor')? ( '(' functionParametr (',' functionParametr)* ')')
    ;

classBody
    : '{' members '}'
    ;

members
    : memberDeclaration*
    ;

delegationSpecifier
    : constructorInvocation
    | userType
    | explicitDelegation
    ;

explicitDelegation
    : userType 'by' expression
    ;

typeParameters
    : '<' typeParameter (',' typeParameter)* '>'
    ;

typeParameter
    : modifiers Identifier (':' userType)?
    ;

typeConstraints
    : ('where' typeConstraint (',' typeConstraint)*)?  //TODO
    ;

typeConstraint
    : annotations Identifier ':' type
    ;

memberDeclaration
    : companionObject
    | object
    | function
    | property
    | class
    | typeAlias
    | initializerBlock
    | secondaryConstructor
    ;

initializerBlock
    : 'init' block
    ;

companionObject
    : modifiers 'companion' 'object' Identifier? (':' delegationSpecifier (',' delegationSpecifier)*)? classBody?
    ;

function
    : modifiers 'fun' typeParameters? (type '.')? Identifier typeParameters?
        valueParameters (':' type)? typeConstraints functionBody
    ;

valueParameters
    : '(' (functionParameter (',' functionParameter)*)? ')'
    ;

functionParameter
    : modifiers ('val' | 'var')? parameter ('=' expression)?
    ;

functionBody
    : block
    | '=' expression
    ;

block
    : '{' statements '}'
    ;

property
    : modifiers ('val' | 'var') typeParameters? (type '.')?
        (multipleVariableDeclarations | variableDeclarationEntry) typeConstraints
        (('by' | '=') expression SEMI?)?    //TODO
        (getter? setter? | setter? getter?) SEMI?
    ;

variableDeclarationEntry
    : Identifier (':' type)?
    ;

multipleVariableDeclarations
    : '(' variableDeclarationEntry (',' variableDeclarationEntry)* ')'
    ;

getter
    : modifiers 'get'
    | modifiers 'get' '(' ')' (':' type)? functionBody
    ;

setter
    : modifiers 'set'
    | modifiers 'set' '(' modifiers (Identifier | parameter) ')' functionBody
    ;

parametr
    : Identifier ':' type
    ;

object
    : 'object' Identifier primaryConstructor? (':' delegationSpecifier (',' delegationSpecifier)*)? classBody?
    ;

secondaryConstructor
    : modifiers 'constructor' valueParameters (':' constructorDelegationCall)? block
    ;

constructorDelegationCall
    : 'this' valueArguments
    | 'super' valuueArguments
    ;


//--enum
enumClassBody
    : '{' enumEntries? (';' members)? '}'
    ;

enumEntries
    : enumEntry (',' enumEntry)* ','? ';'?
    ;

enumEntry
    : modifiers Identifier valueArguments? classBody?  //TODO
    ;

//--types
type
    : typeModifiers typeReference
    ;

typeReference
    : '(' typeReference ')'
    | functionType
    | userType
    | nullableType
    | 'dynamic'
    ;

nullableType
    : typeReference '?'
    ;

userType
    : simpleUserType ('.' simpleUserType)*
    ;

simpleUserType
    : Identifier ('<'(varianceAnnotation type | '*') (',' (varianceAnnotation type | '*'))* '>')?
    ;

functionType
    : (type '.')? '(' (parametr (',' parametr)*)? ')' '->' type?
    ;

//--control structures
if
    : 'if' '(' expression ')' controlStructureBody SEMI? ('else' controlStructureBody)?
    ;

controlStructureBody
    : block
    | blockLevelExpresion
    ;

try
    : 'try' block catchBlock* finallyBlock?
    ;

catchBlock
    : 'catch' '(' annotations Identifier ':' userType ')' block
    ;

finallyBlock
    : 'finally' block
    ;

loop
    : for
    | while
    | doWhile
    ;

for
    : 'for' '(' annotations (multipleVariableDeclarations | variableDeclarationEntry) 'in' expression ')'
        controlStructureBody
    ;

while
    : 'while' '(' expression ')' controlStructureBody
    ;

doWhile
    : 'do' controlStructureBody 'while' '(' expression ')'
    ;

//--expressions
expression
    : disjunction (assignmentOperator disjunction)*
    ;

disjunction
    : conjunction ( '||' conjunction)*
    ;

conjunction
    : equalityComparison ('&&' equalityComparison)*
    ;

equalityComparison
    : comparison (equalityOperation comparison)
    ;

comparison
    : namedInfix (comparisonOperation namedInfix)*
    ;

namedInfix
    : elvisExpression (inOperation elvisExpression)*
    | elvisExpression (isOpreation type)?
    ;

elvisExpression
    : infixFunctionCall ('?:' infixFunctionCall)*
    ;

infixFunctionCall
    : rangeExpression (Identifier rangeExpression)*
    ;

rangeExpression
    : additiveExpression ('..' additiveExpression)*
    ;

additiveExpression
    : multiplicativeExpression (additiveOperation multiplicativeExpression)*
    ;

multiplicativeExpression
    : typeRHS (multiplicativeOperation typeRHS)*
    ;

typeRHS
    : prefixUnaryExpression (typeOperation prefixUnaryExpression)*
    ;

prefixUnaryExpression
    : prefixUnaryOperation* postfixUnaryExpression
    ;

postfixUnaryExpression
    : atomicExpression postfixUnaryOperation*
    | callableReference postfixUnaryOperation*
    ;

callableReference
    : (userType '?'*)? '::' Identifier typeArguments?
    ;

atomicExpression
    : '(' expresion ')'
    | literalConstant
    | functionLiteral
    | 'this' labelReference?
    | 'super' ('<' type '>')? labelReference?
    | if
    | when
    | try
    | objectLiteral
    | jump
    | loop
    | Identifier
    ;

labelReference
    : '@' Identifier
    ;

labelDefinition
    : Identifier '@'
    ;

literalConstant
    : BooleanLiteral
    | stringLiteral
    | IntegerLiteral
    | HexLiteral
    | FloatLiteral
    | CharLiteral
    | NullLiteral
    ;

stringLiteral
    : '"' stringElement* '"'
    ;

stringElement
    : RegularStringPart
    | ShortTemplateEntry (Identifier | 'this')
    | EscapeSequence
    | longTemplate
    ;

longTemplate
    : '${' expression '}'
    ;

declaration
    : function
    | property
    | class
    | typeAlias
    | object
    ;

statement
    : declaration
    | blockLevelExpression
    ;

blockLevelExpression
    : annotations '\n'+ expression
    ;

multiplicativeOperation
    : '*' | '/' | '%'
    ;

additiveOperation
    : '+' | '='
    ;

inOperation
    : 'in' | '!in'
    ;

typeOperation
    : 'as' | 'as?' | ':'
    ;

isOperation
    : 'is' | '!is'
    ;

comparisonOperation
    : '<' | '>' | '>=' | '<='
    ;

equalityOperation
    : '!=' | '==' | '===' | '!=='
    ;

assignmentOperation
    : '=' | '+=' | '-=' | '*=' | '/=' | '%='
    ;

prefixUnaryOperation
    : '-' | '+' | '++' | '--' | '!'
    | annotations
    | labelDefinition
    ;

postfixUnaryOperation
    : '++' | '--' | '!!'
    | callSuffix
    | arrayAccess
    | memberAccessOperation postfixUnaryExpression
    ;



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
    : EscapedStringLiteral
    | RawStringLiteral
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
    : '"""' .*? '"""' //match anything in """..."""
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
LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
LBRACK : '[';
RBRACK : ']';
SEMICOLON : ';';
COMMA : ',';
Dot : '.';

//--Operators
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
TYPE_RHS        : ':' | 'as' | 'as?';
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
    | '`' JavaIdentifier '`'
    ;

fragment
JavaIdentifier
    : JavaLetter JavaLetterOrDigit
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

COMMENT
    : '/*' .*? COMMENT .*? '*/'
//    | '/*' .*? '*/' -> channel(HIDDEN)
    ;

LINE_COMMENT
    :   '//' ~[\r\n]* -> channel(HIDDEN)
    ;