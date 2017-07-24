parser grammar KotlinParser;
//import KotlinLexerNL;

options { tokenVocab = KotlinLexer; }

/*------PARSER------*/
//--File Structure

kotlinFile
    : NL* preamble topLevel* EOF
    ;

preamble
    : fileAnnotations? packageHeader? importStatement*
    ;

fileAnnotations
    : FileAnnotation NL* COLON NL* ( LBRACK NL* unescapedAnnotation (NL* unescapedAnnotation)* NL* RBRACK NL* | unescapedAnnotation NL*)
    ;

packageHeader
    : PACKAGE simpleName (NL* DOT simpleName)* semi*
    ;

importStatement
    : IMPORT simpleName (NL* DOT simpleName)* (NL* DOT ASTERISK | NL* AS simpleName)? semi*
    ;

topLevel
    : r_class
    | object
    | function
    | memberOrTopLevelProperty
    | typeAlias
    ;

typeAlias
    : accessModifier? NL* TYPEALIAS NL* simpleName NL* typeParameters? NL* ASSIGN NL* type semi*
    ;

//--Classes
r_class
    : (classModifier NL*| accessModifier NL*| annotations NL*)* (CLASS | INTERFACE) NL* simpleName
        (NL* primaryConstructor)?
        (NL* COLON NL* annotations* NL* (delegationSpecifier NL* COMMA NL*)* delegationSpecifier)?
        (NL* classBody | NL* enumClassBody)? semi?
    | (classModifier NL*| accessModifier NL*| annotations NL*)* (CLASS | INTERFACE) NL* simpleName NL* typeParameters
        (NL* primaryConstructor)?
        (NL* COLON NL* annotations* NL* (delegationSpecifier NL* COMMA NL*)* (constructorInvocation | userType))?
        (NL* typeConstraints)? (NL* classBody | NL* enumClassBody)? semi?
    | (classModifier NL*| accessModifier NL*| annotations NL*)* (CLASS | INTERFACE) NL* simpleName NL* typeParameters
        (NL* primaryConstructor)?
        (NL* COLON NL* annotations* NL* (delegationSpecifier NL* COMMA NL*)* explicitDelegation)?
        (NL+ typeConstraints)? (NL* classBody | NL* enumClassBody)? semi?
    ;

primaryConstructor
    : ((annotations NL*| accessModifier NL*)* CONSTRUCTOR NL*)? constructorValueParameters
    ;

constructorValueParameters
    : LPAREN NL* (constructorParameter (NL* COMMA NL* constructorParameter)* NL*)? RPAREN
    ;

constructorParameter
    : (annotations NL*| parameterModifier NL*)* (VAL | VAR)? parameter NL* (ASSIGN NL* nestedExpression NL*)?
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
    : (typeParameterModifier NL*| varianceAnnotation NL*)* simpleName NL* (COLON NL* userType)?
    ;

typeConstraints
    : WHERE NL* typeConstraint (NL* COMMA typeConstraint)*
    ;

typeConstraint
    : (annotations NL*)* simpleName NL* COLON NL* type
    ;

memberDeclaration
    : companionObject
    | object
    | function
    | memberOrTopLevelProperty
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
    : (annotations NL*| accessModifier NL*| FINAL NL*)* COMPANION NL* OBJECT NL* simpleName?
        (NL* COLON NL* delegationSpecifier (NL* COMMA delegationSpecifier)*)? NL* classBody? semi?
    ;

function
    : (memberModifier NL*| accessModifier NL*| functionModifier NL*| annotations NL*)*
        FUN NL* (typeParameters NL*)? (type NL* DOT NL*)? simpleName NL*
        valueParameters NL* (COLON NL* type NL*)? NL* (typeConstraints NL*)? functionBody semi?
    ;

valueParameters
    : LPAREN NL* (functionParameter (NL* COMMA functionParameter)*)? NL* RPAREN
    ;

functionParameter
    : (annotations NL*| parameterModifier NL*)* parameter NL* (ASSIGN NL* nestedExpression NL*)?
    ;

functionBody
    : block
    | ASSIGN NL* expression
    ;

block
    : LBRACE semi* RBRACE
    | LBRACE semi* statements semi* RBRACE
    ;

memberOrTopLevelProperty //TODO check constraints conflicting with delegate expression one more time
    : (memberModifier NL*| accessModifier NL*| annotations NL*)*
        VAR NL* typeParameters NL* (type NL* DOT NL*)? variableDeclarationEntry NL* typeConstraints
        (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    | (memberModifier NL*| accessModifier NL*| propertyModifier NL*| annotations NL*)*
        VAL NL* typeParameters NL* (type NL* DOT NL*)? variableDeclarationEntry NL* typeConstraints
        (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    | (memberModifier NL*| accessModifier NL*| annotations NL*)*
        VAR NL* (type NL* DOT NL*)? variableDeclarationEntry
        (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    | (memberModifier NL*| accessModifier NL*| propertyModifier NL*| annotations NL*)*
        VAL NL* (type NL* DOT NL*)? variableDeclarationEntry
        (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    ;


localProperty
    : (annotations NL*)* (VAL | VAR) NL* typeParameters NL* (type NL* DOT NL*)? variableDeclarationEntry NL*
        typeConstraints? (NL* (BY | ASSIGN) NL* expression)?
    | (annotations NL*)* (VAL | VAR) NL* (type NL* DOT NL*)? variableDeclarationEntry
        (NL* (BY | ASSIGN) NL* expression)?
    | (annotations NL*)* (VAL | VAR) NL* typeParameters NL* multipleVariableDeclarations NL*
        typeConstraints? (NL* (BY | ASSIGN) NL* expression)?
    | (annotations NL*)* (VAL | VAR) NL* multipleVariableDeclarations
        (NL* (BY | ASSIGN) NL* expression)?
    ;

variableDeclarationEntry
    : simpleName (NL* COLON NL* type)?
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
        LPAREN NL* (annotations NL*| parameterModifier NL*)* (simpleName | parameter) NL* RPAREN NL* functionBody
    ;

parameter
    : simpleName NL* COLON NL* type
    ;

object
    : (annotations NL*| accessModifier NL*| FINAL NL*)* OBJECT NL* simpleName NL* (primaryConstructor NL*)?
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
    : (annotations NL*)* simpleName NL* (valueArguments NL*)? classBody?
    ;

type
    : (annotations NL*)* typeReference
    | (suspendModifier NL*| annotations NL*)* functionalTypeReference
    ;

functionalTypeReference
    : (typeReference NL* DOT NL*)? LPAREN (NL* functionalTypeParameter (NL* COMMA NL* functionalTypeParameter)*)? NL* RPAREN
        NL* IMPLICATION NL* type (NL* DOT NL* functionalTypeReference)?
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
    : simpleName (NL* LT NL*(varianceAnnotation? NL* type | ASTERISK) (NL* COMMA NL* (varianceAnnotation? NL* type | ASTERISK))* NL* GT)?
    ;

//--Control Structures
r_if
    : IF NL* condition NL* controlStructureBody (NL* (SEMICOLON NL*)? ELSE NL* controlStructureBody)? //TODO strange semicolon usage
    ;

condition
    : LPAREN NL* nestedExpression NL* RPAREN
    ;

controlStructureBody
    : block
    | blockLevelExpression
    | assignment
    ;

r_try
    : TRY NL* block (NL* catchBlock)* (NL* finallyBlock)?
    ;

catchBlock
    : CATCH NL* LPAREN NL* annotations NL* simpleName NL* COLON NL* userType NL* RPAREN NL* block
    ;

finallyBlock
    : FINALLY NL* block
    ;

loop
    : r_for
    | r_while
    | doWhile
    ;

r_for
    : FOR NL* LPAREN NL* (annotations NL*)* (multipleVariableDeclarations | variableDeclarationEntry) NL*
        IN NL* nestedExpression NL* RPAREN NL* controlStructureBody
    ;

r_while
    : WHILE NL* LPAREN NL* nestedExpression NL* RPAREN NL* controlStructureBody
    ;

doWhile
    : DO NL* controlStructureBody NL* WHILE NL* LPAREN NL* nestedExpression NL* RPAREN
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
    : rangeExpression (simpleName NL* rangeExpression)*
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
    | prefixUnaryExpression (NL* typeOperation NL* type)? //TODO is right?
    ;

prefixUnaryExpression
    : (prefixUnaryOperation NL*)* postfixUnaryExpression
    ;

postfixUnaryExpression //TODO reflection tests, (reflection)callSuffix, userType.. QUESTION*
    : atomicExpression postfixUnaryOperation*
    | DOUBLE_COLON NL* simpleName postfixUnaryOperation*
    | userTypeWithoutNL doubleColonSuffix postfixUnaryOperation*
    ;


doubleColonSuffix
    : DOUBLE_COLON NL* (simpleName | CLASS)
    ;

userTypeWithoutNL
    : simpleUserTypeWithoutNL (NL* DOT NL* simpleUserTypeWithoutNL)*
    ;

simpleUserTypeWithoutNL
    : simpleName (LT NL*(varianceAnnotation? NL* type | ASTERISK) (NL* COMMA NL* (varianceAnnotation? NL* type | ASTERISK))* NL* GT)?
    ;

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
    | simpleName
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
    : nestedRangeExpression (NL* simpleName NL* nestedRangeExpression)*
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
    | nestedPrefixUnaryExpression (NL* typeOperation NL* type)?
    ;

nestedPrefixUnaryExpression
    : (prefixUnaryOperation NL*)* nestedPostfixUnaryExpression
    ;

nestedPostfixUnaryExpression
    : atomicExpression (NL* postfixUnaryOperation)*
    | DOUBLE_COLON NL* simpleName (NL* postfixUnaryOperation)*
    | userType NL* doubleColonSuffix (NL* postfixUnaryOperation)* //TODO userType QUESTION*
    ;

literalConstant
    : TRUE
    | FALSE
    | escapedString
    | rawString
    | IntegerLiteral
    | FloatingPointLiteral
    | CharLiteral
    | NULL
    ;

escapedString
    : STRING_START escapedStringElement* STRING_END
    ;

escapedStringElement
    : RegularStringPart
    | LONE_DOLLAR
    | ShortTemplate
    | EscapeSequence
    | longTemplate
    ;

longTemplate
    : LongTemplateStart NL* nestedExpression NL* RBRACE
    ;

rawString
    : RAW_STRING_START rawStringElement* RAW_STRING_END
    ;

rawStringElement
    : RegularRawStringPart
    | RAW_LONE_DOLLAR
    | RAW_STRING_QUOTES
    | RawShortTemplate
    | rawLongTemplate
    ;

rawLongTemplate
    : RAW_LONG_TEMPLATE_START NL* nestedExpression NL* RBRACE
    ;

statement
    : blockLevelExpression
    | assignment
    | declaration
    ;

declaration
    : r_class
    | object
    | function
    | localProperty
    | typeAlias
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

typeOperation //TODO colon needed?
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
    | doubleColonSuffix
    ;


callSuffix
    : (typeArguments NL*)? valueArguments (NL* annotatedLambda)?
    | (typeArguments NL*)? annotatedLambda
    ;

annotatedLambda
    : (AT_ID (NL* DOT NL* simpleName)* NL* (typeArguments NL*)? (valueArguments NL*)?)* (Label NL*)? functionalLiteral
    ;

memberAccessOperation
    : DOT | QUESTION_DOT | QUESTION
    ;

typeArguments
    : LT NL* type (NL* COMMA NL* type)* NL* GT
    ;

valueArguments //TODO asterisk
    : LPAREN NL* (nestedExpression NL* COMMA NL*)* (simpleName NL* ASSIGN NL* (ASTERISK NL*)? nestedExpression NL* COMMA NL*)*
        simpleName NL* ASSIGN NL* (ASTERISK NL*)? nestedExpression NL* RPAREN
    | LPAREN NL* (ASTERISK NL*)? nestedExpression (NL* COMMA NL* (ASTERISK NL*)? nestedExpression)* NL* RPAREN
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
    : LBRACE semi* RBRACE
    | LBRACE semi* statements semi* RBRACE
    | LBRACE NL* lambdaParameter (NL* COMMA NL* lambdaParameter)* NL* IMPLICATION semi* statements semi* RBRACE
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
    : LBRACK NL* nestedExpression (NL* COMMA NL* nestedExpression)* NL* RBRACK
    ;

objectLiteral
    : OBJECT (NL* COLON NL* delegationSpecifier (NL* COMMA NL* delegationSpecifier)*)? NL* classBody
    ;

//--When
when
    : WHEN NL* (LPAREN NL* nestedExpression NL* RPAREN NL*)? LBRACE NL* (whenEntry NL*)* RBRACE
    ;

whenEntry
    : whenCondition NL* (COMMA NL* whenCondition NL*)* IMPLICATION NL* controlStructureBody semi?
    | ELSE NL* IMPLICATION NL* controlStructureBody semi?
    ;

whenCondition
    : expression
    | (IN | BANG_IN) NL* expression
    | (IS | BANG_IS) NL* type
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
    | INNER
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
    : AT_ID (NL* DOT NL* simpleName)* NL* typeArguments? NL* valueArguments?
    | AnnotationTarget NL* COLON NL* simpleName (NL* DOT simpleName)* NL* typeArguments? NL* valueArguments? NL*
    ;

annotationList
    : AT_ID NL* LBRACK NL* simpleName (NL* DOT simpleName)*  NL* typeArguments? NL* valueArguments?
        (NL* simpleName NL* (NL* DOT NL* simpleName)* NL* typeArguments? NL* valueArguments?)* NL* RBRACK
    | AnnotationTarget NL* COLON NL* LBRACK NL* simpleName (NL* DOT NL* simpleName)* NL* typeArguments? NL* valueArguments?
        (NL* simpleName (NL* DOT NL* simpleName)* NL* typeArguments? NL* valueArguments?)* NL* RBRACK
    ;

unescapedAnnotation
    : simpleName (DOT simpleName)* typeArguments? valueArguments?
    ;

simpleName
    : Identifier
    | SoftKeyword
    ;

semi
    : NL
    | SEMICOLON
    ;