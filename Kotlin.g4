grammar Kotlin;

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
    : modifiers Identifier ('(' valueArguments ')')? classBody?  //TODO
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
    : elvisExpression (isOpreation type)?
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






/*------LEXER------*/

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
    :   [a-zA-Z_] // these are the "java letters" below 0x7F
    |   // covers all characters above 0x7F which are not a surrogate
        ~[\u0000-\u007F\uD800-\uDBFF]
    |   // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
        [\uD800-\uDBFF] [\uDC00-\uDFFF]
    ;

fragment
JavaLetterOrDigit
    :   [a-zA-Z0-9_] // these are the "java letters or digits" below 0x7F
    |   // covers all characters above 0x7F which are not a surrogate
        ~[\u0000-\u007F\uD800-\uDBFF]
    |   // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
        [\uD800-\uDBFF] [\uDC00-\uDFFF]
    ;


