grammar Kotlin_Parser;
import Kotlin_Lexer;

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
    : modifiers 'typealias' Identifier typeParameters? '=' type
    ;

//--classes
class
    : modifiers ('class' | 'interface') Identifier typeParameters? primartConstructor?
        (':' annotations delegationSpecifier (',' delegationSpecifier))?
        typeContraints (classBody? | enumClassBody)
    ;

primaryConstructor
    : (modifiers 'constructor')? ( '(' functionParameter (',' functionParameter)* ')')
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
    : modifiers parameter ('=' expression)?
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

parameter
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
    : (type '.')? '(' (parameter (',' parameter)*)? ')' '->' type?
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
    : disjunction (assignmentOperation disjunction)*
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
    : '(' expression ')'
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

declaration //TODO синоним топлевелобджекта
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

callSuffix  //TODO smthwrong
    : typeArguments? valueArguments annotatedLambda
    | typeArguments annotatedLambda
    ;

annotatedLambda
    : ('@' unescapedAnnotation)* labelDefinition? functionalLiteral
    ;

memberAccessOperation
    : '.' | '?.' | '?'
    ;

typeArguments
    : '<' type (',' type)* '>'
    ;

valueArguments
    : '(' Identifier '=' '*'? expression (',' Identifier '=' '*'? expression)* ')'
    | '(' '*'? expression (',' '*'? expression)* ')'
    ;

jump
    : 'throw' expression
    | 'return' labelReference? expression?
    | 'continue' labelReference?
    | 'break' labelReference?
    ;

functionalLiteral
    : '{' statements '}'
    | '{' lambdaParameter (',' lambdaParameter)* '->' statements '}'
    ;

lambdaParameter
    : variableDeclarationEntry
    | multipleVariableDeclarations (':' type)?
    ;

statements
    : SEMI* statement (SEMI+ statement)* SEMI*
    ;

constructorInvocation
    : userType callSuffix
    ;

arrayAccess
    : '[' expression (',' expression)* ']'
    ;

objectLiteral
    : 'object' (':' delegationSpecifier (',' delegationSpecifier)*)? classBody
    ;

