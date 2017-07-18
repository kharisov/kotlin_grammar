grammar KotlinParserNL;
import KotlinLexerNL;

/*------PARSER------*/
//--File Structure

kotlinFile  //TODO (add soft keywords as possible names for rules using Identifier)
    : preamble declaration* EOF
    ;

preamble
    : fileAnnotations? packageHeader? importStatement*
    ;

fileAnnotations
    : FileAnnotation NL* COLON NL* ( LBRACK NL* unescapedAnnotation (NL* unescapedAnnotation)* NL* RBRACK NL* | unescapedAnnotation NL*)
    ;

packageHeader
    : PACKAGE Identifier (NL* DOT Identifier)* semi*
    ;

importStatement
    : IMPORT Identifier (NL* DOT Identifier)* (NL* DOT ASTERISK | NL* AS Identifier)? semi*
    ;

declaration
    : r_class
    | object
    | function
    | property
    | typeAlias
    ;

typeAlias
    : accessModifier? NL* TYPEALIAS NL* Identifier NL* typeParameters? NL* ASSIGN NL* type semi*
    ;

//--Classes
r_class //TODO typeConstraints only when there are defined type parameters
    : (classModifier NL*| accessModifier NL*| annotations NL*)* (CLASS | INTERFACE) NL* Identifier NL* (typeParameters NL*)?
        (primaryConstructor NL*)? (COLON NL* annotations* NL* delegationSpecifier NL* (COMMA NL* delegationSpecifier NL*)*)?
        (typeConstraints NL*)? (classBody | enumClassBody)? semi*
    ;

primaryConstructor
    : ((annotations NL*| accessModifier NL*)* CONSTRUCTOR NL*)? constructorValueParameters
    ;

constructorValueParameters
    : LPAREN NL* (constructorParameter (NL* COMMA constructorParameter)*)? NL* RPAREN
    ;

constructorParameter
    : (annotations NL*| parameterModifier NL*)* (VAL | VAR)? parameter NL* (ASSIGN NL* expression NL*)?
    ;

classBody
    : LBRACE NL* members RBRACE
    ;

members
    : (memberDeclaration NL*)*
    ;

delegationSpecifier
    : constructorInvocation
    | userType
    | explicitDelegation
    ;

explicitDelegation
    : userType NL* BY NL* expression
    ;

typeParameters
    : LT NL* typeParameter (NL* COMMA typeParameter)* NL* GT
    ;

typeParameter
    : (typeParameterModifier NL*| varianceAnnotation NL*)* Identifier NL* (COLON NL* userType)?
    ;

typeConstraints
    : WHERE NL* typeConstraint (NL* COMMA typeConstraint)*
    ;

typeConstraint
    : (annotations NL*)* Identifier NL* COLON NL* type
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
    | SEMICOLON
    ;

initializerBlock
    : INIT NL* block semi?
    ;

companionObject
    : (annotations NL*| accessModifier NL*| FINAL NL*)* COMPANION NL* OBJECT NL* Identifier?
        (NL* COLON NL* delegationSpecifier (NL* COMMA delegationSpecifier)*)? NL* classBody? semi?
    ;

function
    : (memberModifier NL*| accessModifier NL*| functionModifier NL*| annotations NL*)*
        FUN NL* (typeParameters NL*)? (type NL* DOT NL*)? Identifier NL*
        valueParameters NL* (COLON NL* type NL*)? NL* (typeConstraints NL*)? functionBody semi?
    ;

valueParameters
    : LPAREN NL* (functionParameter (NL* COMMA functionParameter)*)? NL* RPAREN
    ;

functionParameter
    : (annotations NL*| parameterModifier NL*)* parameter NL* (ASSIGN NL* expression NL*)?
    ;

functionBody
    : block
    | ASSIGN NL* expression
    ;

block
    : LBRACE semi* RBRACE
    | LBRACE semi* statements semi* RBRACE
    ;

property //TODO (lazy), typeConstraints only..., devide local and global properties
    : (memberModifier NL*| accessModifier NL*| propertyModifier NL*| annotations NL*)*
        (VAL | VAR) NL* typeParameters? NL* (type NL* DOT NL*)?
        (multipleVariableDeclarations | variableDeclarationEntry) NL* (typeConstraints NL*)?
        ((BY | ASSIGN) NL* expression)? //TODO 1 SEMICOLON or 0-... NL
        (getter? NL* SEMICOLON? NL* setter? | setter? NL* SEMICOLON? NL* getter?) semi?
    ;

variableDeclarationEntry
    : Identifier (NL* COLON NL* type)?
    ;

multipleVariableDeclarations
    : LPAREN NL* variableDeclarationEntry (NL* COMMA NL* variableDeclarationEntry)* NL* RPAREN
    ;

getter
    : (accessModifier NL*| functionModifier NL*| annotations NL*)* GET
    | (accessModifier NL*| functionModifier NL*| annotations NL*)* GET NL* LPAREN NL* RPAREN
        (NL* COLON NL* type)? NL* functionBody
    ;

setter
    : (accessModifier NL*| functionModifier NL*| annotations NL*)* SET
    | (accessModifier NL*| functionModifier NL*| annotations NL*)* SET NL*
        LPAREN NL* (annotations NL*| parameterModifier NL*)* (Identifier | parameter) NL* RPAREN NL* functionBody
    ;

parameter
    : Identifier NL* COLON NL* type
    ;

object
    : (annotations NL*| accessModifier NL*| FINAL NL*)* OBJECT NL* Identifier NL* (primaryConstructor NL*)?
        (COLON NL* delegationSpecifier (NL* COMMA NL* delegationSpecifier)*)? NL* classBody? semi?
    ;

secondaryConstructor
    : (accessModifier NL*| annotations NL*)* CONSTRUCTOR NL* valueParameters
        (NL* COLON NL* constructorDelegationCall)? NL* block
    ;

constructorDelegationCall
    : THIS NL* valueArguments
    | SUPER NL*  valueArguments
    ;


//--Enum
enumClassBody
    : LBRACE NL* (enumEntries NL* (COMMA NL*)?)? (SEMICOLON | SEMICOLON NL* members)? NL* RBRACE
    ;

enumEntries
    : enumEntry (NL* COMMA NL* enumEntry)*
    ;

enumEntry
    : (annotations NL*)* Identifier NL* (valueArguments NL*)? classBody?  //TODO
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
    : (suspendModifier NL*| annotations NL*)* (functionalTypeReference| typeReference)
    ;

functionalTypeReference
    : (typeReference NL* DOT NL*)? LPAREN (NL* functionalTypeParameter (NL* COMMA NL* functionalTypeParameter)*)? NL* RPAREN
        NL* IMPLICATION NL* type (NL* DOT NL* functionalTypeReference)? //TODO (type?, suspend might only apply to func type
    ;

functionalTypeParameter
    : parameter
    | type
    ;

typeReference
    : LPAREN NL* typeReference NL* RPAREN
    | userType
    | typeReference NL* QUESTION
    | DYNAMIC
    ;

userType
    : simpleUserType (NL* DOT NL* simpleUserType)*
    ;

simpleUserType
    : Identifier NL* (LT NL*(varianceAnnotation? NL* type | ASTERISK) (NL* COMMA NL* (varianceAnnotation? NL* type | ASTERISK))* NL* GT)?
    ;

//--Control Structures
r_if
    : IF LPAREN expression RPAREN controlStructureBody semi? (ELSE controlStructureBody)?
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
    : FOR LPAREN annotations (multipleVariableDeclarations | variableDeclarationEntry) IN expression RPAREN
    | FOR LPAREN annotations (multipleVariableDeclarations | variableDeclarationEntry) IN expression RPAREN
        controlStructureBody
    ;

r_while
    : WHILE LPAREN expression RPAREN controlStructureBody
    ;

doWhile
    : DO controlStructureBody WHILE LPAREN expression RPAREN
    ;

//--Expressions
assignment
    : expression (assignmentOperation NL* expression)*
    ;

expression
    : conjunction (NL* OR NL* conjunction)*
    ;

conjunction
    : equalityComparison (NL* AND NL* equalityComparison)*
    ;

equalityComparison
    : comparison (equalityOperation NL* comparison)*
    ;

comparison
    : namedInfix (comparisonOperation NL* namedInfix)*
    ;

namedInfix
    : elvisExpression (inOperation NL* elvisExpression)*
    | elvisExpression (isOperation NL* type)?
    ;

elvisExpression
    : infixFunctionCall (NL* ELVIS NL* infixFunctionCall)*
    ;

infixFunctionCall
    : rangeExpression (Identifier NL* rangeExpression)*
    ;

rangeExpression
    : additiveExpression (RANGE NL* additiveExpression)*
    ;

additiveExpression
    : multiplicativeExpression (additiveOperation NL* multiplicativeExpression)*
    ;

multiplicativeExpression
    : typeRHS (multiplicativeOperation NL* typeRHS)*
    ;

typeRHS
    : prefixUnaryExpression (NL* typeOperation NL* prefixUnaryExpression)*
    ;

prefixUnaryExpression
    : (prefixUnaryOperation NL*)* postfixUnaryExpression
    ;

postfixUnaryExpression //TODO not every postfix ops can combine (a++++ not possible)
    : atomicExpression postfixUnaryOperation*
    //| callableReference postfixUnaryOperation*
    ;

/*callableReference
    : (userType QUESTION*)? DOUBLE_COLON Identifier typeArguments?
    ;
*/
atomicExpression
    : literalConstant
    | LPAREN NL* nestedExpression NL* RPAREN
    | functionalLiteral
    | THIS AT_ID?
    | SUPER (LT type GT)? AT_ID?
    | r_if
    | when
    | r_try
    | objectLiteral
    | jump
    | loop
    | Identifier
    ;

nestedExpression
    : nestedConjunction (NL* OR NL* nestedConjunction)*
    ;

nestedConjunction
    : nestedEqualityComparison (NL* AND NL* nestedEqualityComparison)*
    ;

nestedEqualityComparison
    : nestedComparison (NL* equalityOperation NL* nestedComparison)*
    ;

nestedComparison
    : nestedNamedInfix (NL* comparisonOperation NL* nestedNamedInfix)*
    ;

nestedNamedInfix
    : nestedElvisExpression (NL* inOperation NL* nestedElvisExpression)*
    | nestedElvisExpression (NL* isOperation NL* type)?
    ;

nestedElvisExpression
    : nestedInfixFunctionCall (NL* ELVIS NL* nestedInfixFunctionCall)*
    ;

nestedInfixFunctionCall
    : nestedRangeExpression (NL* Identifier NL* nestedRangeExpression)*
    ;

nestedRangeExpression
    : nestedAdditiveExpression (NL* RANGE NL* nestedAdditiveExpression)*
    ;

nestedAdditiveExpression
    : nestedMultiplicativeExpression (NL* additiveOperation NL* nestedMultiplicativeExpression )*
    ;

nestedMultiplicativeExpression
    : nestedTypeRHS (NL* multiplicativeOperation NL* nestedTypeRHS )*
    ;

nestedTypeRHS
    : nestedPrefixUnaryExpression (NL* typeOperation NL* nestedPrefixUnaryExpression )*
    ;

nestedPrefixUnaryExpression
    : (prefixUnaryOperation NL*)* nestedPostfixUnaryExpression
    ;

nestedPostfixUnaryExpression //TODO not every postfix ops can combine (a++++ not possible)
    : atomicExpression (NL* nestedPostfixUnaryOperation)*
    //| callableReference postfixUnaryOperation*
    ;

nestedPostfixUnaryOperation //TODO repeat of postfixUnaryOperation
    : INC | DEC | DOUBLE_BANG
    | callSuffix
    | arrayAccess
    | memberAccessOperation NL* postfixUnaryExpression
    ;
/*
labelReference
    : AT Identifier
    ;

labelDefinition
    : Identifier AT
    ;
*/

literalConstant
    : (TRUE | FALSE)
    | StringLiteral //TODO string
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
    | assignment
    | declaration
    ;

blockLevelExpression
    : annotations* NL* expression
    ;

multiplicativeOperation
    : ASTERISK | DIV | MOD
    ;

additiveOperation
    : ADD | SUB
    ;

inOperation
    : IN | BANG_IN
    ;

typeOperation
    : AS | SAFE_CAST | COLON
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
    | Label
    ;

postfixUnaryOperation
    : INC | DEC | DOUBLE_BANG
    | callSuffix
    | arrayAccess
    | NL* memberAccessOperation NL* postfixUnaryExpression
    ;

callSuffix  //TODO smthwrong (mb fixed)
    : (typeArguments NL*)? valueArguments (NL* annotatedLambda)?
    | (typeArguments NL*)? annotatedLambda
    ;

annotatedLambda
    : (AT_ID (NL* DOT NL* Identifier)* NL* (typeArguments NL*)? (valueArguments NL*)?)* (Label NL*)? functionalLiteral
    ;

memberAccessOperation
    : DOT | QUESTION_DOT | QUESTION
    ;

typeArguments
    : LT NL* type (NL* COMMA NL* type)* NL* GT
    ;

valueArguments
    : LPAREN NL* Identifier NL* ASSIGN NL* (ASTERISK NL*)? expression
        (NL* COMMA NL* Identifier NL* ASSIGN NL* (ASTERISK NL*)? expression)* NL* RPAREN
    | LPAREN NL* (ASTERISK NL*)? expression (NL* COMMA NL* (ASTERISK NL*)? expression)* NL* RPAREN
    | LPAREN NL* RPAREN
    ;

jump
    : THROW NL* expression
    | RETURN expression?
    | LabeledReturn expression?
    | CONTINUE
    | LabeledContinue
    | BREAK
    | LabeledContinue
    ;

functionalLiteral
    : LBRACE NL* statements NL* RBRACE  //TODO (statements?)
    | LBRACE NL* lambdaParameter (NL* COMMA NL* lambdaParameter)* NL* IMPLICATION NL* statements NL* RBRACE
    ;

lambdaParameter
    : variableDeclarationEntry
    | multipleVariableDeclarations (NL* COLON NL* type)?
    ;

statements
    : statement (semi+ statement)* semi?
    ;

constructorInvocation
    : userType callSuffix
    ;

arrayAccess
    : LBRACK NL* expression (NL* COMMA NL* expression)* NL* RBRACK
    ;

objectLiteral
    : OBJECT (NL* COLON NL* delegationSpecifier (NL* COMMA NL* delegationSpecifier)*)? NL* classBody
    ;

//--When
when
    : WHEN ( LPAREN expression RPAREN )? LBRACE whenEntry* RBRACE
    ;

whenEntry
    : whenCondition (COMMA whenCondition)* IMPLICATION controlStructureBody semi
    | ELSE  IMPLICATION controlStructureBody semi
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
    : AT_ID (NL* DOT NL* Identifier)* NL* typeArguments? NL* valueArguments?
    | AnnotationTarget NL* COLON NL* Identifier (NL* DOT Identifier)* NL* typeArguments? NL* valueArguments? NL*
    ;

annotationList
    : AT_ID NL* LBRACK NL* Identifier (NL* DOT Identifier)*  NL* typeArguments? NL* valueArguments?
        (NL* Identifier NL* (NL* DOT NL* Identifier)* NL* typeArguments? NL* valueArguments?)* NL* RBRACK
    | AnnotationTarget NL* COLON NL* LBRACK NL* Identifier (NL* DOT NL* Identifier)* NL* typeArguments? NL* valueArguments?
        (NL* Identifier (NL* DOT NL* Identifier)* NL* typeArguments? NL* valueArguments?)* NL* RBRACK
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

semi
    : NL
    | SEMICOLON
    ;

/*
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
    //| callableReference postfixUnaryOperation*
    ;

/*callableReference
    : (userType QUESTION*)? DOUBLE_COLON Identifier typeArguments?
    ;

atomicExpression
    : parenthesesedExpression
    | literalConstant
    | functionalLiteral
    | THIS AT_ID?
    | SUPER (LT type GT)? AT_ID?
    | r_if
    | when
    | r_try
    | objectLiteral
    | jump
    | loop
    | Identifier
    ;*/