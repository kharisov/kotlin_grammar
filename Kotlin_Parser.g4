grammar Kotlin_Parser;
import Kotlin_Lexer;

/*------PARSER------*/
//--File Structure

kotlinFile
    : preamble declaration* EOF
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

declaration
    : r_class
    //| object
    | function
    | property
    | typeAlias
    ;

typeAlias
    : accessModifier* 'typealias' Identifier typeParameters? '=' type
    ;

//--Classes
r_class
    : (classModifier| accessModifier | annotations)* ('class' | 'interface') Identifier typeParameters? primaryConstructor?
        (':' annotations delegationSpecifier (',' delegationSpecifier))?
        typeConstraints? (classBody | enumClassBody)?
    ;

primaryConstructor
    : ((annotation | accessModifier)* 'constructor')? '(' functionParameter (',' functionParameter)* ')'
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
    : (typeParameterModifier | varianceAnnotation)* Identifier (':' userType)?
    ;

typeConstraints
    : 'where' typeConstraint (',' typeConstraint)*
    ;

typeConstraint
    : annotations* Identifier ':' type
    ;

memberDeclaration
    : companionObject
    //| object
    | function
    | property
    | r_class
    | typeAlias
    | initializerBlock
    | secondaryConstructor
    ;

initializerBlock
    : 'init' block
    ;

companionObject
    : (annotations | accessModifier)* 'companion' 'object' Identifier? (':' delegationSpecifier (',' delegationSpecifier)*)? classBody?
    ;

function
    : (memberModifier | accessModifier | functionModifier | annotations)*
        'fun' typeParameters? (type '.')? Identifier typeParameters?
        valueParameters (':' type)? typeConstraints? functionBody
    ;

valueParameters
    : '(' (functionParameter (',' functionParameter)*)? ')'
    ;

functionParameter
    : (annotations | parameterModifier)* parameter ('=' expression)?
    ;

functionBody
    : block
    | '=' expression
    ;

block
    : '{' statements '}'
    ;

property
    : (memberModifier | accessModifier | propertyModifier | annotations)*
        ('val' | 'var') typeParameters? (type '.')?
        (multipleVariableDeclarations | variableDeclarationEntry) typeConstraints?
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
    : (accessModifier | functionModifier | annotations)* 'get'
    | (accessModifier | functionModifier | annotations)* 'get' '(' ')' (':' type)? functionBody
    ;

setter
    : (accessModifier | functionModifier | annotations)* 'set'
    | (accessModifier | functionModifier | annotations)* 'set'
        '(' (annotations | parameterModifier)* (Identifier | parameter) ')' functionBody
    ;

parameter
    : Identifier ':' type
    ;

/*object
    : 'object' Identifier primaryConstructor? (':' delegationSpecifier (',' delegationSpecifier)*)? classBody?
    ;*/

secondaryConstructor
    : (accessModifier | annotations)* 'constructor' valueParameters (':' constructorDelegationCall)? block
    ;

constructorDelegationCall
    : 'this' valueArguments
    | 'super' valueArguments
    ;


//--Enum
enumClassBody
    : '{' enumEntries? (';' members)? '}'
    ;

enumEntries
    : enumEntry (',' enumEntry)* ','? ';'?
    ;

enumEntry
    : annotations* Identifier valueArguments? classBody?  //TODO
    ;

//--Types
/*
type
    : (suspendModifier | annotations)* typeReference
    ;

typeReference
    : '(' typeReference ')'
    | functionalType
    | userType
    | typeReference '?'
    | 'dynamic'
    ;

userType
    : simpleUserType ('.' simpleUserType)*
    ;

simpleUserType
    : Identifier ('<'(varianceAnnotation type | '*') (',' (varianceAnnotation type | '*'))* '>')?
    ;

functionalType
    : (type '.')? '(' (parameter (',' parameter)*)? ')' '->' type
    ;
*/

type
    : (suspendModifier | annotations)* (typeReference | functionalTypeReference)
    ;

typeReference
    : '(' typeReference ')'
    | userType
    | typeReference '?'
    | 'dynamic'
    ;

userType
    : simpleUserType ('.' simpleUserType)*
    ;

simpleUserType
    : Identifier ('<'(varianceAnnotation type | '*') (',' (varianceAnnotation type | '*'))* '>')?
    ;

functionalTypeReference
    : (typeReference '.')? '(' (parameter (',' parameter)*)? ')' '->' type ('.' functionalTypeReference)? //TODO (type?, modifiers before typeReference
    ;

//--Control Structures
r_if
    : 'if' '(' expression ')' controlStructureBody SEMI? ('else' controlStructureBody)?
    ;

controlStructureBody
    : block
    | blockLevelExpression
    ;

r_try
    : 'try' block catchBlock* finallyBlock?
    ;

catchBlock
    : 'catch' '(' annotations Identifier ':' userType ')' block
    ;

finallyBlock
    : 'finally' block
    ;

loop
    : r_for
    | r_while
    | doWhile
    ;

r_for
    : 'for' '(' annotations (multipleVariableDeclarations | variableDeclarationEntry) 'in' expression ')'
        controlStructureBody
    ;

r_while
    : 'while' '(' expression ')' controlStructureBody
    ;

doWhile
    : 'do' controlStructureBody 'while' '(' expression ')'
    ;

//--Expressions
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
    : comparison (equalityOperation comparison)*
    ;

comparison
    : namedInfix (comparisonOperation namedInfix)*
    ;

namedInfix
    : elvisExpression (inOperation elvisExpression)*
    | elvisExpression (isOperation type)?
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
    | functionalLiteral
    | 'this' labelReference?
    | 'super' ('<' type '>')? labelReference?
    | r_if
    | when
    | r_try
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
    //| stringLiteral //TODO string
    | IntegerLiteral
    | FloatingPointLiteral
    | CharLiteral
    | NullLiteral
    ;
/*
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
*/

statement
    : blockLevelExpression
    | declaration
    ;

blockLevelExpression
    : annotations* '\n'* expression
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

callSuffix  //TODO smthwrong (mb fixed)
    : typeArguments? valueArguments annotatedLambda?
    | typeArguments? annotatedLambda
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
    | '(' ')'
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

//--When
when
    : 'when' ( '(' expression ')' )? '{' whenEntry* '}'
    ;

whenEntry
    : whenCondition (',' whenCondition)* '->' controlStructureBody SEMI
    | 'else'  '->' controlStructureBody SEMI
    ;

whenCondition
    : expression
    | ('in' | '!in') expression
    | ('is' | '!is') type
    ;

//--Modifiers
classModifier
    : 'abstract'
    | 'final'
    | 'enum'
    | 'open'
    | 'annotation'
    | 'sealed'
    | 'data'
    ;

memberModifier
    : 'override'
    | 'open'
    | 'final'
    | 'abstract'
    | 'lateinit'
    ;

accessModifier
    : 'private'
    | 'protected'
    | 'public'
    | 'internal'
    ;

varianceAnnotation
    : 'in'
    | 'out'
    ;

parameterModifier
    : 'noinline'
    | 'crossinline'
    | 'vararg'
    ;

typeParameterModifier
    : 'reified'
    ;

functionModifier
    : 'tailrec'
    | 'operator'
    | 'infix'
    | 'inline'
    | 'external'
    | suspendModifier
    ;

propertyModifier
    : 'const'
    ;

suspendModifier
    : 'suspend'
    ;

//--Annotations
annotations
    : (annotation | annotationList)+
    ;

annotation
    : '@' (annotationUseSiteTarget ':')? unescapedAnnotation
    ;

annotationList
    : '@' (annotationUseSiteTarget ':')? '[' unescapedAnnotation+ ']'
    ;

annotationUseSiteTarget
    : 'field'
    | 'file'
    | 'property'
    | 'get'
    | 'set'
    | 'receiver'
    | 'param'
    | 'setparam'
    | 'delegate'
    ;

unescapedAnnotation
    : Identifier ('.' Identifier)* typeArguments? valueArguments?
    ;
