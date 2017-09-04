parser grammar KotlinParser;
//import KotlinLexerNL;

options { tokenVocab = KotlinLexer; }

/*------PARSER------*/
//--File Structure
//Starting rule
kotlinFile
    : NL* preamble (topLevel semi*)* EOF
    ;

preamble
    : (fileAnnotations NL*)* (packageHeader semi*)? (importStatement semi*)*
    ;

fileAnnotations
    : FileAnnotation NL* COLON NL* ( LBRACK NL* unescapedAnnotation (NL* unescapedAnnotation)* NL* RBRACK | unescapedAnnotation)
    ;

packageHeader
    : PACKAGE simpleName (NL* DOT simpleName)* semi?
    ;

importStatement
    : IMPORT simpleName (NL* DOT simpleName)* (NL* DOT ASTERISK | NL* AS simpleName)? semi?
    ;

//-Top level objects - those, which might be declared in global scope
topLevel
    : r_class
    | r_enum
    | object
    | function
    | memberOrTopLevelProperty
    | typeAlias
    ;

typeAlias
    : (modifier NL*)? TYPEALIAS NL* simpleName NL* typeParameters? NL* ASSIGN NL* type semi?
    ;

//-Class
/*Three rules for class are needed because of delegationSpecifiers and typeConstraints.
 Type constraints are not allowed, when there are no typeParameters. Also, if the delegationSpecifier
 is the one ending with expression, type constraints must start with new line, because parser can't make difference
 between 'where' as keyword and as infix call*/
r_class //TODO mb devide interface, class, enum class and abstract class
    : (modifier NL*)* (CLASS | INTERFACE) NL* simpleName (NL* primaryConstructor)?
        (NL* COLON NL* annotations* NL* (delegationSpecifier NL* COMMA NL*)* delegationSpecifier)?
        (NL* classBody)? semi?
    | (modifier NL*)* (CLASS | INTERFACE) NL* simpleName NL* typeParameters (NL* primaryConstructor)?
        (NL* COLON NL* annotations* NL* (delegationSpecifier NL* COMMA NL*)* (constructorInvocation | userType))?
        (NL* typeConstraints)? (NL* classBody)? semi?
    | (modifier NL*)* (CLASS | INTERFACE) NL* simpleName NL* typeParameters (NL* primaryConstructor)?
        (NL* COLON NL* annotations* NL* (delegationSpecifier NL* COMMA NL*)* explicitDelegation)?
        (NL+ typeConstraints)? (NL* classBody)? semi?
    ;

primaryConstructor
    : ((modifier NL*)* CONSTRUCTOR NL*)? constructorValueParameters
    ;

constructorValueParameters
    : LPAREN NL* (constructorParameter (NL* COMMA NL* constructorParameter)* NL*)? RPAREN
    ;

constructorParameter
    : (modifier NL*)* (VAL | VAR)? parameter NL* (ASSIGN NL* nestedExpression NL*)?
    ;

classBody
    : LBRACE NL* members? RBRACE
    ;

members
    : (memberDeclaration NL*)+
    ;

delegationSpecifier
    : constructorInvocation
    | userType
    | explicitDelegation
    ;

explicitDelegation
    : userType NL* BY NL* delegationExpression
    ;

typeParameters
    : LT NL* typeParameter (NL* COMMA typeParameter)* NL* GT
    ;

typeParameter
    : (modifier NL*)* simpleName (NL* COLON NL* userType)?
    ;

typeConstraints
    : WHERE NL* typeConstraint (NL* COMMA typeConstraint)*
    ;

typeConstraint
    : (annotations NL*)* simpleName NL* COLON NL* type
    ;

//-Member Declaration
memberDeclaration
    : companionObject
    | object
    | function
    | memberOrTopLevelProperty
    | r_class
    | r_enum
    | typeAlias
    | initializerBlock
    | secondaryConstructor
    | SEMICOLON
    ;

initializerBlock
    : INIT NL* block semi?
    ;

companionObject
    : (modifier NL*)* COMPANION NL* (modifier NL*)*
        OBJECT NL* simpleName? (NL* COLON NL* delegationSpecifier (NL* COMMA delegationSpecifier)*)? NL* classBody? semi?
    ;

function
    : (modifier NL*)* FUN NL* (typeParameters NL*)? (type NL* (DOT | QUESTION_DOT) NL*)? simpleName NL*
        valueParameters NL* (COLON NL* type NL*)? NL* (typeConstraints NL*)? functionBody? semi?
    ;

valueParameters
    : LPAREN NL* (functionParameter (NL* COMMA NL* functionParameter)* NL*)? RPAREN
    ;

functionParameter
    : (modifier NL*)* parameter NL* (ASSIGN NL* nestedExpression NL*)?
    ;

functionBody
    : block
    | ASSIGN NL* expression
    ;

block
    : LBRACE semi* RBRACE
    | LBRACE semi* statements semi* RBRACE
    ;


/*Properties declarations in global scope and in class body differ from local properties, so this rules are devided.
 Also rules have several variants, because some forms are not ccompatible with others*/
memberOrTopLevelProperty //TODO var<T> l : Int is valid, but book says it's not allowed to declare generic non-extension type
    : (modifier NL*)* VAR NL* typeParameters NL* (type NL* (DOT | QUESTION_DOT) NL*)? variableDeclarationEntry NL*
        typeConstraints? (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    | (modifier NL*)* VAL NL* typeParameters NL* (type NL* (DOT | QUESTION_DOT) NL*)? variableDeclarationEntry NL*
        typeConstraints? (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    | (modifier NL*)* VAR NL* (type NL* (DOT | QUESTION_DOT) NL*)? variableDeclarationEntry
        (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    | (modifier NL*)* VAL NL* (type NL* (DOT | QUESTION_DOT) NL*)? variableDeclarationEntry
        (NL* (BY | ASSIGN) NL* expression)? (SEMICOLON | NL+)?
        (getter? NL* (SEMICOLON NL*)? setter? | setter? NL* (SEMICOLON NL*)? getter?)
    ;

localProperty
    : (annotations NL*)* (VAL | VAR) NL* typeParameters NL* variableDeclarationEntry NL* //(type NL* (DOT | QUESTION_DOT) NL*)?
        typeConstraints? (NL* (BY | ASSIGN) NL* expression)?
    | (annotations NL*)* (VAL | VAR) NL* variableDeclarationEntry //(type NL* (DOT | QUESTION_DOT) NL*)?
        (NL* (BY | ASSIGN) NL* expression)?
    | (VAL | VAR) NL* typeParameters NL* multipleVariableDeclarations NL*
        typeConstraints? (NL* (BY | ASSIGN) NL* expression)?
    | (VAL | VAR) NL* multipleVariableDeclarations
        (NL* (BY | ASSIGN) NL* expression)?
    ;

variableDeclarationEntry
    : simpleName (NL* COLON NL* type)?
    ;

multipleVariableDeclarations
    : LPAREN NL* (annotations NL*)* variableDeclarationEntry (NL* COMMA NL* (annotations NL*)* variableDeclarationEntry)* NL* RPAREN
    ;

getter
    : (modifier NL*)* GET
    | (modifier NL*)* GET NL* LPAREN NL* RPAREN (NL* COLON NL* type)? NL* functionBody
    ;

setter
    : (modifier NL*)* SET
    | (modifier NL*)* SET NL* LPAREN NL* (modifier NL*)* (simpleName | parameter) NL* RPAREN NL* functionBody
    ;

parameter
    : simpleName NL* COLON NL* type
    ;

object
    : (modifier NL*)* OBJECT NL* simpleName
        (NL* COLON NL* delegationSpecifier (NL* COMMA NL* delegationSpecifier)*)? NL* classBody? semi?
    ;

secondaryConstructor
    : (modifier NL*)* CONSTRUCTOR NL* valueParameters (NL* COLON NL* constructorDelegationCall)? (NL* block)?
    ;

constructorDelegationCall
    : THIS NL* valueArguments
    | SUPER NL*  valueArguments
    ;


//--Enum
r_enum
    : (modifier NL*)* ENUM NL* (modifier NL*)* CLASS NL* simpleName (NL* primaryConstructor)?
        (NL* COLON NL* annotations* NL* (delegationSpecifier NL* COMMA NL*)* delegationSpecifier)?
        (NL* enumClassBody)? semi?
    ;

enumClassBody
    : LBRACE NL* (enumEntries NL* (COMMA NL*)?)? (SEMICOLON | SEMICOLON NL* members)? NL* RBRACE
    ;

enumEntries
    : enumEntry (NL* COMMA NL* enumEntry)*
    ;

enumEntry
    : (modifier NL*)* simpleName NL* (valueArguments NL*)? classBody?
    ;

//-Types
/*Type rule has such a complex structure, to allow only one single modifier and annotations list in one level of
 nesting*/
type
    : typeReference
    | functionalTypeReference (NL* (DOT | QUESTION_DOT) NL* functionalTypeReference)?
    | type NL* QUESTION
    | LPAREN NL* type NL* RPAREN
    ;

typeReference
    : typeReference NL* QUESTION
    | LPAREN NL* typeReference NL* RPAREN
    | annotatedTypeReference
    | userType
    | DYNAMIC
    ;

annotatedTypeReference
    : (annotations NL*)+ notAnnotatedTypeReference
    ;

notAnnotatedTypeReference
    : notAnnotatedTypeReference NL* QUESTION
    | LPAREN NL* notAnnotatedTypeReference NL* RPAREN
    | userType
    ;

userType
    : simpleUserType (NL* DOT NL* simpleUserType)*
    ;

simpleUserType
    : simpleName (NL* LT NL*(varianceAnnotation? NL* type | ASTERISK) (NL* COMMA NL* (varianceAnnotation? NL* type | ASTERISK))* NL* GT)?
    ;

functionalTypeReference
    : functionalTypeReference NL* QUESTION
    | LPAREN NL* functionalTypeReference NL* RPAREN
    | annotatedFunctionalTypeReference
    | functionalUserType
    ;

annotatedFunctionalTypeReference
    : (suspendModifier NL*| annotations NL*)+ notAnnotatedFunctionalTypeReference
    ;

notAnnotatedFunctionalTypeReference
    : notAnnotatedFunctionalUserType
    | notAnnotatedFunctionalTypeReference NL* QUESTION
    | LPAREN NL* notAnnotatedFunctionalTypeReference NL* RPAREN
    ;

functionalTypeParameter
    : parameter
    | type
    ;

functionalUserType
    : (typeReference NL* (DOT | QUESTION_DOT) NL*)? LPAREN (NL* functionalTypeParameter (NL* COMMA NL* functionalTypeParameter)*)? NL* RPAREN
        NL* IMPLICATION NL* type
    ;

notAnnotatedFunctionalUserType
    : (notAnnotatedTypeReference NL* (DOT | QUESTION_DOT) NL*)? LPAREN (NL* functionalTypeParameter (NL* COMMA NL* functionalTypeParameter)*)? NL* RPAREN
        NL* IMPLICATION NL* type
    ;

//--Control Structures
r_if //1 semicolon is allowed between if body and else body
    : IF NL* condition NL* controlStructureBody (NL* (SEMICOLON NL*)? ELSE NL* (controlStructureBody | SEMICOLON))?
    | IF NL* condition NL* (SEMICOLON NL*)? ELSE NL* (controlStructureBody | SEMICOLON)?
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
    : CATCH NL* LPAREN NL* (annotations NL*)* simpleName NL* COLON NL* userType NL* RPAREN NL* block
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
        IN NL* nestedExpression NL* RPAREN NL* (controlStructureBody | SEMICOLON)
    ;

r_while
    : WHILE NL* LPAREN NL* nestedExpression NL* RPAREN NL* NL* (controlStructureBody | SEMICOLON)
    ;

doWhile
    : DO ((controlStructureBody | SEMICOLON) NL*)? WHILE NL* LPAREN NL* nestedExpression NL* RPAREN
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
    | prefixUnaryExpression (NL* typeOperation NL* type)?
    ;

prefixUnaryExpression
    : (prefixUnaryOperation NL*)* postfixUnaryExpression
    ;

//doubleColonSuffix is made in this way to prohibit syntax, reserved for future - 'asd::asd()'
postfixUnaryExpression //userType.. QUESTION* reserved syntax for future use
    : atomicExpression postfixUnaryOperation* doubleColonSuffix?
    | doubleColon NL* simpleName doubleColonSuffix
    | doubleColon NL* simpleName (postfixUnaryOperationWithoutCallSuffix postfixUnaryOperation* doubleColonSuffix?)?
    | userTypeWithoutNL doubleColonSuffix
    ;

doubleColonSuffix
    : doubleColon NL* (simpleName | CLASS) doubleColonSuffix
    | doubleColon NL* (simpleName | CLASS) (postfixUnaryOperationWithoutCallSuffix postfixUnaryOperation* doubleColonSuffix?)?
    ;

doubleColon
    : DOUBLE_COLON | QuestionDoubleColon | QUESTION+ DOUBLE_COLON
    ;

userTypeWithoutNL
    : simpleUserTypeWithoutNL (NL* DOT NL* simpleUserTypeWithoutNL)*
    ;

simpleUserTypeWithoutNL
    : simpleName (LT NL*(varianceAnnotation? NL* type | ASTERISK) (NL* COMMA NL* (varianceAnnotation? NL* type | ASTERISK))* NL* GT)?
    ;


multiplicativeOperation
    : ASTERISK | DIV | MOD
    ;

additiveOperation
    : ADD | SUB
    ;

inOperation
    : IN | BANG IN
    ;

typeOperation
    : AS | SAFE_CAST
    ;

isOperation
    : IS | BANG IS
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
    : SUB | ADD | INC | DEC | BANG | DOUBLE_BANG
    | annotations
    | Label
    ;

postfixUnaryOperation
    : callSuffix
    | postfixUnaryOperationWithoutCallSuffix
    ;

postfixUnaryOperationWithoutCallSuffix
    : INC | DEC | DOUBLE_BANG
    | arrayAccess
    | NL* memberAccessOperation NL* postfixUnaryExpression
    ;

callSuffix //TODO proibit several lambdas in one suffix (appear in posfixOperation*)
    : (typeArguments NL*)? valueArguments (NL* annotatedLambda)?
    | (typeArguments NL*)? annotatedLambda
    ;

annotatedLambda
    : (annotations NL*)* (Label NL*)? functionalLiteral
    ;

memberAccessOperation
    : DOT | QUESTION_DOT | QUESTION
    ;

atomicExpression //TODO different for nested?
    : literalConstant
    | LPAREN NL* nestedExpression NL* RPAREN
    | functionalLiteral
    | THIS AT_ID?
    | SUPER (LT type GT)? AT_ID?
    | r_if
    | when
    | r_try
    | objectLiteral
    | anonymousFunction
    | jump
    | loop
    | simpleName
    ;

anonymousFunction
    : (annotations NL*)* FUN NL* (type NL* (DOT | QUESTION_DOT) NL*)? valueParameters NL* (COLON NL* type NL*)? functionBody
    ;

//Nested expressions are used inside () or {} or []
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

nestedPostfixUnaryExpression //userType QUESTION* reserved syntax for future use
    : atomicExpression (NL* postfixUnaryOperation)* (NL* nestedDoubleColonSuffix)?
    | doubleColon NL* simpleName NL* nestedDoubleColonSuffix
    | doubleColon NL* simpleName (NL* nestedPostfixUnaryOperationWithoutCallSuffix
        (NL* nestedPostfixUnaryOperation)* (NL* nestedDoubleColonSuffix)?)?
    | userType NL* nestedDoubleColonSuffix
    ;

nestedDoubleColonSuffix
    : doubleColon NL* (simpleName | CLASS) NL* nestedDoubleColonSuffix
    | doubleColon NL* (simpleName | CLASS) (NL* postfixUnaryOperationWithoutCallSuffix
        (NL* postfixUnaryOperation)* (NL* nestedDoubleColonSuffix)?)?
    ;

nestedPostfixUnaryOperation
    : callSuffix
    | nestedPostfixUnaryOperationWithoutCallSuffix
    ;

nestedPostfixUnaryOperationWithoutCallSuffix
    : INC | DEC | DOUBLE_BANG
    | arrayAccess
    | NL* memberAccessOperation NL* postfixUnaryExpression
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
    | Label* declaration
    ;

declaration //Local
    : r_class
    | object
    | function
    | localProperty
    ;

blockLevelExpression
    : (annotations NL*)* expression
    ;

typeArguments
    : LT NL* (type | ASTERISK) (NL* COMMA NL* (type | ASTERISK))* NL* GT
    ;

valueArguments
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
    | LabeledBreak
    ;

functionalLiteral
    : LBRACE semi* RBRACE
    | LBRACE semi* statements semi* RBRACE
    | LBRACE NL* (lambdaParameter (NL* COMMA NL* lambdaParameter)* NL*)? IMPLICATION semi* (statements semi*)? RBRACE
    ;

lambdaParameter
    : variableDeclarationEntry
    | multipleVariableDeclarations (NL* COLON NL* type)?
    ;

statements
    : statement (semi+ statement)* semi?
    ;

constructorInvocation
    : userType NL* (typeArguments NL*)? valueArguments
    ;

arrayAccess
    : LBRACK NL* nestedExpression (NL* COMMA NL* nestedExpression)* NL* RBRACK
    ;

objectLiteral
    : OBJECT (NL* COLON NL* delegationSpecifier (NL* COMMA NL* delegationSpecifier)*)? NL* classBody?
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
    : nestedExpression
    | (IN | BANG IN) NL* nestedExpression
    | (IS | BANG IS) NL* type
    ;

//--Modifiers
modifier
    : classModifier
    | memberModifier
    | varianceAnnotation
    | parameterModifier
    | typeParameterModifier
    | functionModifier
    | propertyModifier
    | suspendModifier
    | annotations
    ;

classModifier
    : ABSTRACT
    | FINAL
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
    | CROSSINLINE
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
    : AnnotationListStart NL* simpleName (NL* DOT simpleName)*  NL* typeArguments? NL* valueArguments?
        (NL* simpleName NL* (NL* DOT NL* simpleName)* NL* typeArguments? NL* valueArguments?)* NL* RBRACK
    | AnnotationTarget NL* COLON NL* LBRACK NL* simpleName (NL* DOT NL* simpleName)* NL* typeArguments? NL* valueArguments?
        (NL* simpleName (NL* DOT NL* simpleName)* NL* typeArguments? NL* valueArguments?)* NL* RBRACK
    ;

unescapedAnnotation
    : simpleName (DOT simpleName)* typeArguments? valueArguments?
    ;

simpleName
    : Identifier
    | softKeyword
    ;

softKeyword
    : DYNAMIC | FILE | IMPORT | CONSTRUCTOR | BY | WHERE | INIT | COMPANION | CATCH | FINALLY | ABSTRACT | FINAL
        | ENUM | OPEN | ANNOTATION | SEALED | DATA | OVERRIDE | LATEINIT | PRIVATE | PROTECTED | PUBLIC | INTERNAL
        | OUT | NOINLINE | CROSSINLINE | VARARG | REIFIED | TAILREC | OPERATOR | INFIX | INLINE | EXTERNAL | CONST
        | SUSPEND | GET | SET | FIELD | PROPERTY | RECIEVER | PARAM | SETPARAM | DELEGATE | INNER | HEADER | IMPL
    ;

semi
    : NL
    | SEMICOLON
    ;

//Delegation expression is used in delegationSpecifier in class declaration. It has a bit different postfix operations
delegationExpression
    : delegationConjunction (NL* OR NL* delegationConjunction)*
    ;

delegationConjunction
    : delegationEqualityComparison (NL* AND NL* delegationEqualityComparison)*
    ;

delegationEqualityComparison
    : delegationComparison (equalityOperation NL* delegationComparison)*
    ;

delegationComparison
    : delegationNamedInfix (comparisonOperation NL* delegationNamedInfix)*
    ;

delegationNamedInfix
    : delegationElvisExpression (inOperation NL* delegationElvisExpression)*
    | delegationElvisExpression (isOperation NL* type)?
    ;

delegationElvisExpression
    : delegationInfixFunctionCall (NL* ELVIS NL* delegationInfixFunctionCall)*
    ;

delegationInfixFunctionCall
    : delegationRangeExpression (simpleName NL* delegationRangeExpression)*
    ;

delegationRangeExpression
    : delegationAdditiveExpression (RANGE NL* delegationAdditiveExpression)*
    ;

delegationAdditiveExpression
    : delegationMultiplicativeExpression (additiveOperation NL* delegationMultiplicativeExpression)*
    ;

delegationMultiplicativeExpression
    : delegationTypeRHS (multiplicativeOperation NL* delegationTypeRHS)*
    ;

delegationTypeRHS
    : delegationPrefixUnaryExpression (NL* typeOperation NL* delegationPrefixUnaryExpression)*
    | delegationPrefixUnaryExpression (NL* typeOperation NL* type)?
    ;

delegationPrefixUnaryExpression
    : (prefixUnaryOperation NL*)* delegationPostfixUnaryExpression
    ;

delegationPostfixUnaryExpression //userType.. QUESTION* reserved syntax for future use
    : atomicExpression delegationPostfixUnaryOperation* delegationDoubleColonSuffix?
    | doubleColon NL* simpleName delegationDoubleColonSuffix
    | doubleColon NL* simpleName (postfixUnaryOperationWithoutCallSuffix delegationPostfixUnaryOperation* delegationDoubleColonSuffix?)?
    | userTypeWithoutNL delegationDoubleColonSuffix
    ;

delegationDoubleColonSuffix
    : doubleColon NL* (simpleName | CLASS) doubleColonSuffix
    | doubleColon NL* (simpleName | CLASS) (postfixUnaryOperationWithoutCallSuffix delegationPostfixUnaryOperation* doubleColonSuffix?)?
    ;

delegationPostfixUnaryOperation
    : delegationCallSuffix
    | postfixUnaryOperationWithoutCallSuffix
    ;

delegationCallSuffix
    : (typeArguments NL*)? valueArguments
    ;