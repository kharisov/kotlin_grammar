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
    : AT FILE COLON ( LBRACK unescapedAnnotation+ RBRACK | unescapedAnnotation)
    ;

packageHeader
    : PACKAGE Identifier (DOT Identifier)* SEMI?
    ;

importStatement
    : IMPORT Identifier (DOT Identifier)* (DOT ASTERISK | AS Identifier)? SEMI?
    ;

declaration
    : r_class
    | object
    | function
    | property
    | typeAlias
    ;

typeAlias
    : accessModifier* TYPEALIAS Identifier typeParameters? ASSIGN type
    ;

//--Classes
r_class
    : (classModifier| accessModifier | annotations)* (CLASS | INTERFACE) Identifier typeParameters? primaryConstructor?
        (COLON annotations delegationSpecifier (COMMA delegationSpecifier))?
        typeConstraints? (classBody | enumClassBody)?
    ;

primaryConstructor
    : ((annotation | accessModifier)* CONSTRUCTOR)? LPAREN functionParameter (COMMA functionParameter)* RPAREN
    ;

classBody
    : LBRACE members RBRACE
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
    : userType BY expression
    ;

typeParameters
    : LT typeParameter (COMMA typeParameter)* GT
    ;

typeParameter
    : (typeParameterModifier | varianceAnnotation)* Identifier (COLON userType)?
    ;

typeConstraints
    : WHERE typeConstraint (COMMA typeConstraint)*
    ;

typeConstraint
    : annotations* Identifier COLON type
    ;

memberDeclaration
    : companionObject
    | object
    | function
    | property
    | r_class
    | typeAlias
    | initializerBlock
    | secondaryConstructor
    ;

initializerBlock
    : INIT block
    ;

companionObject
    : (annotations | accessModifier)* COMPANION OBJECT Identifier? (COLON delegationSpecifier (COMMA delegationSpecifier)*)? classBody?
    ;

function
    : (memberModifier | accessModifier | functionModifier | annotations)*
        FUN typeParameters? (type DOT)? Identifier typeParameters?
        valueParameters (COLON type)? typeConstraints? functionBody
    ;

valueParameters
    : LPAREN (functionParameter (COMMA functionParameter)*)? RPAREN
    ;

functionParameter
    : (annotations | parameterModifier)* parameter (ASSIGN expression)?
    ;

functionBody
    : block
    | ASSIGN expression
    ;

block
    : LBRACE SEMI* RBRACE
    | LBRACE statements RBRACE
    ;

property
    : (memberModifier | accessModifier | propertyModifier | annotations)*
        (VAL | VAR) typeParameters? (type DOT)?
        (multipleVariableDeclarations | variableDeclarationEntry) typeConstraints?
        ((BY | ASSIGN) expression SEMI?)?    //TODO
        (getter? setter? | setter? getter?) SEMI?
    ;

variableDeclarationEntry
    : Identifier (COLON type)?
    ;

multipleVariableDeclarations
    : LPAREN variableDeclarationEntry (COMMA variableDeclarationEntry)* RPAREN
    ;

getter
    : (accessModifier | functionModifier | annotations)* GET
    | (accessModifier | functionModifier | annotations)* GET LPAREN RPAREN (COLON type)? functionBody
    ;

setter
    : (accessModifier | functionModifier | annotations)* SET
    | (accessModifier | functionModifier | annotations)* SET
        LPAREN (annotations | parameterModifier)* (Identifier | parameter) RPAREN functionBody
    ;

parameter
    : Identifier COLON type
    ;

object
    : OBJECT Identifier primaryConstructor? (COLON delegationSpecifier (COMMA delegationSpecifier)*)? classBody?
    ;

secondaryConstructor
    : (accessModifier | annotations)* CONSTRUCTOR valueParameters (COLON constructorDelegationCall)? block
    ;

constructorDelegationCall
    : THIS valueArguments
    | SUPER valueArguments
    ;


//--Enum
enumClassBody
    : LBRACE enumEntries? (SEMICOLON members)? RBRACE
    ;

enumEntries
    : enumEntry (COMMA enumEntry)* COMMA? SEMICOLON?
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
    : LPAREN typeReference RPAREN
    | functionalType
    | userType
    | typeReference QUESTION
    | DYNAMIC
    ;

userType
    : simpleUserType (DOT simpleUserType)*
    ;

simpleUserType
    : Identifier (LT(varianceAnnotation type | ASTERISK) (COMMA (varianceAnnotation type | ASTERISK))* GT)?
    ;

functionalType
    : (type DOT)? LPAREN (parameter (COMMA parameter)*)? RPAREN IMPLICATION type
    ;
*/

type
    : (suspendModifier | annotations)* (typeReference | functionalTypeReference)
    ;

typeReference
    : LPAREN typeReference RPAREN
    | userType
    | typeReference QUESTION
    | DYNAMIC
    ;

userType
    : simpleUserType (DOT simpleUserType)*
    ;

simpleUserType
    : Identifier (LT(varianceAnnotation type | ASTERISK) (COMMA (varianceAnnotation type | ASTERISK))* GT)?
    ;

functionalTypeReference
    : (typeReference DOT)? LPAREN (parameter (COMMA parameter)*)? RPAREN IMPLICATION type (DOT functionalTypeReference)? //TODO (type?, modifiers before typeReference
    ;

//--Control Structures
r_if
    : IF LPAREN expression RPAREN controlStructureBody SEMI? (ELSE controlStructureBody)?
    ;

controlStructureBody
    : block
    | blockLevelExpression
    ;

r_try
    : TRY block catchBlock* finallyBlock?
    ;

catchBlock
    : CATCH LPAREN annotations Identifier COLON userType RPAREN block
    ;

finallyBlock
    : FINALLY block
    ;

loop
    : r_for
    | r_while
    | doWhile
    ;

r_for
    : FOR LPAREN annotations (multipleVariableDeclarations | variableDeclarationEntry) 'in' expression RPAREN
        controlStructureBody
    ;

r_while
    : WHILE LPAREN expression RPAREN controlStructureBody
    ;

doWhile
    : DO controlStructureBody WHILE LPAREN expression RPAREN
    ;

//--Expressions
expression
    : disjunction (assignmentOperation disjunction)*
    ;

disjunction
    : conjunction ( OR conjunction)*
    ;

conjunction
    : equalityComparison (AND equalityComparison)*
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
    : infixFunctionCall (ELVIS infixFunctionCall)*
    ;

infixFunctionCall
    : rangeExpression (Identifier rangeExpression)*
    ;

rangeExpression
    : additiveExpression (RANGE additiveExpression)*
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
    : (userType QUESTION*)? DOUBLE_COLON Identifier typeArguments?
    ;

atomicExpression
    : LPAREN expression RPAREN
    | literalConstant
    | functionalLiteral
    | THIS labelReference?
    | SUPER (LT type GT)? labelReference?
    | r_if
    | when
    | r_try
    | objectLiteral
    | jump
    | loop
    | Identifier
    ;

labelReference
    : AT Identifier
    ;

labelDefinition
    : Identifier AT
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
    | ShortTemplateEntry (Identifier | THIS)
    | EscapeSequence
    | longTemplate
    ;

longTemplate
    : '${' expression RBRACE
    ;
*/

statement
    : blockLevelExpression
    | declaration
    ;

blockLevelExpression
    : annotations* NL* expression
    ;

multiplicativeOperation
    : ASTERISK | DIV | MOD
    ;

additiveOperation
    : ADD | ASSIGN
    ;

inOperation
    : IN | BANG_IN
    ;

typeOperation
    : CAST | SAFE_CAST | COLON
    ;

isOperation
    : IS | BANG_IS
    ;

comparisonOperation
    : LT | GT | GE | LE
    ;

equalityOperation
    : EQUAL | NOTEQUAL
    ;

assignmentOperation
    : ASSIGN | ADD_ASSIGN | SUB_ASSIGN | MUL_ASSIGN | DIV_ASSIGN | MOD_ASSIGN
    ;

prefixUnaryOperation
    : SUB | ADD | INC | DEC | BANG
    | annotations
    | labelDefinition
    ;

postfixUnaryOperation
    : INC | DEC | DOUBLE_BANG
    | callSuffix
    | arrayAccess
    | memberAccessOperation postfixUnaryExpression
    ;

callSuffix  //TODO smthwrong (mb fixed)
    : typeArguments? valueArguments annotatedLambda?
    | typeArguments? annotatedLambda
    ;

annotatedLambda
    : (AT unescapedAnnotation)* labelDefinition? functionalLiteral
    ;

memberAccessOperation
    : DOT | QUESTION_DOT | QUESTION
    ;

typeArguments
    : LT type (COMMA type)* GT
    ;

valueArguments
    : LPAREN Identifier ASSIGN ASTERISK? expression (COMMA Identifier ASSIGN ASTERISK? expression)* RPAREN
    | LPAREN ASTERISK? expression (COMMA ASTERISK? expression)* RPAREN
    | LPAREN RPAREN
    ;

jump
    : THROW expression
    | RETURN labelReference? expression?
    | CONTINUE labelReference?
    | BREAK labelReference?
    ;

functionalLiteral
    : LBRACE statements RBRACE  //TODO (statements?)
    | LBRACE lambdaParameter (COMMA lambdaParameter)* IMPLICATION statements RBRACE
    ;

lambdaParameter
    : variableDeclarationEntry
    | multipleVariableDeclarations (COLON type)?
    ;

statements
    : SEMI* statement (SEMI+ statement)* SEMI*
    ;

constructorInvocation
    : userType callSuffix
    ;

arrayAccess
    : LBRACK expression (COMMA expression)* RBRACK
    ;

objectLiteral
    : OBJECT (COLON delegationSpecifier (COMMA delegationSpecifier)*)? classBody
    ;

//--When
when
    : WHEN ( LPAREN expression RPAREN )? LBRACE whenEntry* RBRACE
    ;

whenEntry
    : whenCondition (COMMA whenCondition)* IMPLICATION controlStructureBody SEMI
    | ELSE  IMPLICATION controlStructureBody SEMI
    ;

whenCondition
    : expression
    | (IN | BANG_IN) expression
    | (IS | BANG_IS) type
    ;

//--Modifiers
classModifier
    : ABSTRACT
    | FINAL
    | ENUM
    | OPEN
    | ANNOTATION
    | SEALED
    | DATA
    ;

memberModifier
    : OVERRIDE
    | OPEN
    | FINAL
    | ABSTRACT
    | LATEINIT
    ;

accessModifier
    : PRIVATE
    | PROTECTED
    | PUBLIC
    | INTERNAL
    ;

varianceAnnotation
    : IN
    | OUT
    ;

parameterModifier
    : NOINLINE
    | CROSSLINE
    | VARARG
    ;

typeParameterModifier
    : REIFIED
    ;

functionModifier
    : TAILREC
    | OPERATOR
    | INFIX
    | INLINE
    | EXTERNAL
    | suspendModifier
    ;

propertyModifier
    : CONST
    ;

suspendModifier
    : SUSPEND
    ;

//--Annotations
annotations
    : (annotation | annotationList)+
    ;

annotation
    : AT (annotationUseSiteTarget COLON)? unescapedAnnotation
    ;

annotationList
    : AT (annotationUseSiteTarget COLON)? LBRACK unescapedAnnotation+ RBRACK
    ;

annotationUseSiteTarget
    : FIELD
    | FILE
    | PROPERTY
    | GET
    | SET
    | RECIEVER
    | PARAM
    | SETPARAM
    | DELEGATE
    ;

unescapedAnnotation
    : Identifier (DOT Identifier)* typeArguments? valueArguments?
    ;
