// Generated from KotlinParser.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link KotlinParser}.
 */
public interface KotlinParserListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link KotlinParser#kotlinFile}.
	 * @param ctx the parse tree
	 */
	void enterKotlinFile(KotlinParser.KotlinFileContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#kotlinFile}.
	 * @param ctx the parse tree
	 */
	void exitKotlinFile(KotlinParser.KotlinFileContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#preamble}.
	 * @param ctx the parse tree
	 */
	void enterPreamble(KotlinParser.PreambleContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#preamble}.
	 * @param ctx the parse tree
	 */
	void exitPreamble(KotlinParser.PreambleContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#fileAnnotations}.
	 * @param ctx the parse tree
	 */
	void enterFileAnnotations(KotlinParser.FileAnnotationsContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#fileAnnotations}.
	 * @param ctx the parse tree
	 */
	void exitFileAnnotations(KotlinParser.FileAnnotationsContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#packageHeader}.
	 * @param ctx the parse tree
	 */
	void enterPackageHeader(KotlinParser.PackageHeaderContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#packageHeader}.
	 * @param ctx the parse tree
	 */
	void exitPackageHeader(KotlinParser.PackageHeaderContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#importStatement}.
	 * @param ctx the parse tree
	 */
	void enterImportStatement(KotlinParser.ImportStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#importStatement}.
	 * @param ctx the parse tree
	 */
	void exitImportStatement(KotlinParser.ImportStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#topLevel}.
	 * @param ctx the parse tree
	 */
	void enterTopLevel(KotlinParser.TopLevelContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#topLevel}.
	 * @param ctx the parse tree
	 */
	void exitTopLevel(KotlinParser.TopLevelContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeAlias}.
	 * @param ctx the parse tree
	 */
	void enterTypeAlias(KotlinParser.TypeAliasContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeAlias}.
	 * @param ctx the parse tree
	 */
	void exitTypeAlias(KotlinParser.TypeAliasContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#r_class}.
	 * @param ctx the parse tree
	 */
	void enterR_class(KotlinParser.R_classContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#r_class}.
	 * @param ctx the parse tree
	 */
	void exitR_class(KotlinParser.R_classContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#r_enum}.
	 * @param ctx the parse tree
	 */
	void enterR_enum(KotlinParser.R_enumContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#r_enum}.
	 * @param ctx the parse tree
	 */
	void exitR_enum(KotlinParser.R_enumContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#primaryConstructor}.
	 * @param ctx the parse tree
	 */
	void enterPrimaryConstructor(KotlinParser.PrimaryConstructorContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#primaryConstructor}.
	 * @param ctx the parse tree
	 */
	void exitPrimaryConstructor(KotlinParser.PrimaryConstructorContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#constructorValueParameters}.
	 * @param ctx the parse tree
	 */
	void enterConstructorValueParameters(KotlinParser.ConstructorValueParametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#constructorValueParameters}.
	 * @param ctx the parse tree
	 */
	void exitConstructorValueParameters(KotlinParser.ConstructorValueParametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#constructorParameter}.
	 * @param ctx the parse tree
	 */
	void enterConstructorParameter(KotlinParser.ConstructorParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#constructorParameter}.
	 * @param ctx the parse tree
	 */
	void exitConstructorParameter(KotlinParser.ConstructorParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#classBody}.
	 * @param ctx the parse tree
	 */
	void enterClassBody(KotlinParser.ClassBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#classBody}.
	 * @param ctx the parse tree
	 */
	void exitClassBody(KotlinParser.ClassBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#members}.
	 * @param ctx the parse tree
	 */
	void enterMembers(KotlinParser.MembersContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#members}.
	 * @param ctx the parse tree
	 */
	void exitMembers(KotlinParser.MembersContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationSpecifier}.
	 * @param ctx the parse tree
	 */
	void enterDelegationSpecifier(KotlinParser.DelegationSpecifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationSpecifier}.
	 * @param ctx the parse tree
	 */
	void exitDelegationSpecifier(KotlinParser.DelegationSpecifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#explicitDelegation}.
	 * @param ctx the parse tree
	 */
	void enterExplicitDelegation(KotlinParser.ExplicitDelegationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#explicitDelegation}.
	 * @param ctx the parse tree
	 */
	void exitExplicitDelegation(KotlinParser.ExplicitDelegationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeParameters}.
	 * @param ctx the parse tree
	 */
	void enterTypeParameters(KotlinParser.TypeParametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeParameters}.
	 * @param ctx the parse tree
	 */
	void exitTypeParameters(KotlinParser.TypeParametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeParameter}.
	 * @param ctx the parse tree
	 */
	void enterTypeParameter(KotlinParser.TypeParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeParameter}.
	 * @param ctx the parse tree
	 */
	void exitTypeParameter(KotlinParser.TypeParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeConstraints}.
	 * @param ctx the parse tree
	 */
	void enterTypeConstraints(KotlinParser.TypeConstraintsContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeConstraints}.
	 * @param ctx the parse tree
	 */
	void exitTypeConstraints(KotlinParser.TypeConstraintsContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeConstraint}.
	 * @param ctx the parse tree
	 */
	void enterTypeConstraint(KotlinParser.TypeConstraintContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeConstraint}.
	 * @param ctx the parse tree
	 */
	void exitTypeConstraint(KotlinParser.TypeConstraintContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#memberDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterMemberDeclaration(KotlinParser.MemberDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#memberDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitMemberDeclaration(KotlinParser.MemberDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#initializerBlock}.
	 * @param ctx the parse tree
	 */
	void enterInitializerBlock(KotlinParser.InitializerBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#initializerBlock}.
	 * @param ctx the parse tree
	 */
	void exitInitializerBlock(KotlinParser.InitializerBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#companionObject}.
	 * @param ctx the parse tree
	 */
	void enterCompanionObject(KotlinParser.CompanionObjectContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#companionObject}.
	 * @param ctx the parse tree
	 */
	void exitCompanionObject(KotlinParser.CompanionObjectContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#function}.
	 * @param ctx the parse tree
	 */
	void enterFunction(KotlinParser.FunctionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#function}.
	 * @param ctx the parse tree
	 */
	void exitFunction(KotlinParser.FunctionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#valueParameters}.
	 * @param ctx the parse tree
	 */
	void enterValueParameters(KotlinParser.ValueParametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#valueParameters}.
	 * @param ctx the parse tree
	 */
	void exitValueParameters(KotlinParser.ValueParametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#functionParameter}.
	 * @param ctx the parse tree
	 */
	void enterFunctionParameter(KotlinParser.FunctionParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#functionParameter}.
	 * @param ctx the parse tree
	 */
	void exitFunctionParameter(KotlinParser.FunctionParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#functionBody}.
	 * @param ctx the parse tree
	 */
	void enterFunctionBody(KotlinParser.FunctionBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#functionBody}.
	 * @param ctx the parse tree
	 */
	void exitFunctionBody(KotlinParser.FunctionBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(KotlinParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(KotlinParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#memberOrTopLevelProperty}.
	 * @param ctx the parse tree
	 */
	void enterMemberOrTopLevelProperty(KotlinParser.MemberOrTopLevelPropertyContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#memberOrTopLevelProperty}.
	 * @param ctx the parse tree
	 */
	void exitMemberOrTopLevelProperty(KotlinParser.MemberOrTopLevelPropertyContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#localProperty}.
	 * @param ctx the parse tree
	 */
	void enterLocalProperty(KotlinParser.LocalPropertyContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#localProperty}.
	 * @param ctx the parse tree
	 */
	void exitLocalProperty(KotlinParser.LocalPropertyContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#variableDeclarationEntry}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarationEntry(KotlinParser.VariableDeclarationEntryContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#variableDeclarationEntry}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarationEntry(KotlinParser.VariableDeclarationEntryContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#multipleVariableDeclarations}.
	 * @param ctx the parse tree
	 */
	void enterMultipleVariableDeclarations(KotlinParser.MultipleVariableDeclarationsContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#multipleVariableDeclarations}.
	 * @param ctx the parse tree
	 */
	void exitMultipleVariableDeclarations(KotlinParser.MultipleVariableDeclarationsContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#getter}.
	 * @param ctx the parse tree
	 */
	void enterGetter(KotlinParser.GetterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#getter}.
	 * @param ctx the parse tree
	 */
	void exitGetter(KotlinParser.GetterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#setter}.
	 * @param ctx the parse tree
	 */
	void enterSetter(KotlinParser.SetterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#setter}.
	 * @param ctx the parse tree
	 */
	void exitSetter(KotlinParser.SetterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(KotlinParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(KotlinParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#object}.
	 * @param ctx the parse tree
	 */
	void enterObject(KotlinParser.ObjectContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#object}.
	 * @param ctx the parse tree
	 */
	void exitObject(KotlinParser.ObjectContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#secondaryConstructor}.
	 * @param ctx the parse tree
	 */
	void enterSecondaryConstructor(KotlinParser.SecondaryConstructorContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#secondaryConstructor}.
	 * @param ctx the parse tree
	 */
	void exitSecondaryConstructor(KotlinParser.SecondaryConstructorContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#constructorDelegationCall}.
	 * @param ctx the parse tree
	 */
	void enterConstructorDelegationCall(KotlinParser.ConstructorDelegationCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#constructorDelegationCall}.
	 * @param ctx the parse tree
	 */
	void exitConstructorDelegationCall(KotlinParser.ConstructorDelegationCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#enumClassBody}.
	 * @param ctx the parse tree
	 */
	void enterEnumClassBody(KotlinParser.EnumClassBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#enumClassBody}.
	 * @param ctx the parse tree
	 */
	void exitEnumClassBody(KotlinParser.EnumClassBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#enumEntries}.
	 * @param ctx the parse tree
	 */
	void enterEnumEntries(KotlinParser.EnumEntriesContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#enumEntries}.
	 * @param ctx the parse tree
	 */
	void exitEnumEntries(KotlinParser.EnumEntriesContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#enumEntry}.
	 * @param ctx the parse tree
	 */
	void enterEnumEntry(KotlinParser.EnumEntryContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#enumEntry}.
	 * @param ctx the parse tree
	 */
	void exitEnumEntry(KotlinParser.EnumEntryContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(KotlinParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(KotlinParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeReference}.
	 * @param ctx the parse tree
	 */
	void enterTypeReference(KotlinParser.TypeReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeReference}.
	 * @param ctx the parse tree
	 */
	void exitTypeReference(KotlinParser.TypeReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#annotatedTypeReference}.
	 * @param ctx the parse tree
	 */
	void enterAnnotatedTypeReference(KotlinParser.AnnotatedTypeReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#annotatedTypeReference}.
	 * @param ctx the parse tree
	 */
	void exitAnnotatedTypeReference(KotlinParser.AnnotatedTypeReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#notAnnotatedTypeReference}.
	 * @param ctx the parse tree
	 */
	void enterNotAnnotatedTypeReference(KotlinParser.NotAnnotatedTypeReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#notAnnotatedTypeReference}.
	 * @param ctx the parse tree
	 */
	void exitNotAnnotatedTypeReference(KotlinParser.NotAnnotatedTypeReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#userType}.
	 * @param ctx the parse tree
	 */
	void enterUserType(KotlinParser.UserTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#userType}.
	 * @param ctx the parse tree
	 */
	void exitUserType(KotlinParser.UserTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#simpleUserType}.
	 * @param ctx the parse tree
	 */
	void enterSimpleUserType(KotlinParser.SimpleUserTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#simpleUserType}.
	 * @param ctx the parse tree
	 */
	void exitSimpleUserType(KotlinParser.SimpleUserTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#functionalTypeReference}.
	 * @param ctx the parse tree
	 */
	void enterFunctionalTypeReference(KotlinParser.FunctionalTypeReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#functionalTypeReference}.
	 * @param ctx the parse tree
	 */
	void exitFunctionalTypeReference(KotlinParser.FunctionalTypeReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#annotatedFunctionalTypeReference}.
	 * @param ctx the parse tree
	 */
	void enterAnnotatedFunctionalTypeReference(KotlinParser.AnnotatedFunctionalTypeReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#annotatedFunctionalTypeReference}.
	 * @param ctx the parse tree
	 */
	void exitAnnotatedFunctionalTypeReference(KotlinParser.AnnotatedFunctionalTypeReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#notAnnotatedFunctionalTypeReference}.
	 * @param ctx the parse tree
	 */
	void enterNotAnnotatedFunctionalTypeReference(KotlinParser.NotAnnotatedFunctionalTypeReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#notAnnotatedFunctionalTypeReference}.
	 * @param ctx the parse tree
	 */
	void exitNotAnnotatedFunctionalTypeReference(KotlinParser.NotAnnotatedFunctionalTypeReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#functionalTypeParameter}.
	 * @param ctx the parse tree
	 */
	void enterFunctionalTypeParameter(KotlinParser.FunctionalTypeParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#functionalTypeParameter}.
	 * @param ctx the parse tree
	 */
	void exitFunctionalTypeParameter(KotlinParser.FunctionalTypeParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#functionalUserType}.
	 * @param ctx the parse tree
	 */
	void enterFunctionalUserType(KotlinParser.FunctionalUserTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#functionalUserType}.
	 * @param ctx the parse tree
	 */
	void exitFunctionalUserType(KotlinParser.FunctionalUserTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#notAnnotatedFunctionalUserType}.
	 * @param ctx the parse tree
	 */
	void enterNotAnnotatedFunctionalUserType(KotlinParser.NotAnnotatedFunctionalUserTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#notAnnotatedFunctionalUserType}.
	 * @param ctx the parse tree
	 */
	void exitNotAnnotatedFunctionalUserType(KotlinParser.NotAnnotatedFunctionalUserTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#r_if}.
	 * @param ctx the parse tree
	 */
	void enterR_if(KotlinParser.R_ifContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#r_if}.
	 * @param ctx the parse tree
	 */
	void exitR_if(KotlinParser.R_ifContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#condition}.
	 * @param ctx the parse tree
	 */
	void enterCondition(KotlinParser.ConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#condition}.
	 * @param ctx the parse tree
	 */
	void exitCondition(KotlinParser.ConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#controlStructureBody}.
	 * @param ctx the parse tree
	 */
	void enterControlStructureBody(KotlinParser.ControlStructureBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#controlStructureBody}.
	 * @param ctx the parse tree
	 */
	void exitControlStructureBody(KotlinParser.ControlStructureBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#r_try}.
	 * @param ctx the parse tree
	 */
	void enterR_try(KotlinParser.R_tryContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#r_try}.
	 * @param ctx the parse tree
	 */
	void exitR_try(KotlinParser.R_tryContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#catchBlock}.
	 * @param ctx the parse tree
	 */
	void enterCatchBlock(KotlinParser.CatchBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#catchBlock}.
	 * @param ctx the parse tree
	 */
	void exitCatchBlock(KotlinParser.CatchBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#finallyBlock}.
	 * @param ctx the parse tree
	 */
	void enterFinallyBlock(KotlinParser.FinallyBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#finallyBlock}.
	 * @param ctx the parse tree
	 */
	void exitFinallyBlock(KotlinParser.FinallyBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#loop}.
	 * @param ctx the parse tree
	 */
	void enterLoop(KotlinParser.LoopContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#loop}.
	 * @param ctx the parse tree
	 */
	void exitLoop(KotlinParser.LoopContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#r_for}.
	 * @param ctx the parse tree
	 */
	void enterR_for(KotlinParser.R_forContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#r_for}.
	 * @param ctx the parse tree
	 */
	void exitR_for(KotlinParser.R_forContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#r_while}.
	 * @param ctx the parse tree
	 */
	void enterR_while(KotlinParser.R_whileContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#r_while}.
	 * @param ctx the parse tree
	 */
	void exitR_while(KotlinParser.R_whileContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#doWhile}.
	 * @param ctx the parse tree
	 */
	void enterDoWhile(KotlinParser.DoWhileContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#doWhile}.
	 * @param ctx the parse tree
	 */
	void exitDoWhile(KotlinParser.DoWhileContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(KotlinParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(KotlinParser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(KotlinParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(KotlinParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#conjunction}.
	 * @param ctx the parse tree
	 */
	void enterConjunction(KotlinParser.ConjunctionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#conjunction}.
	 * @param ctx the parse tree
	 */
	void exitConjunction(KotlinParser.ConjunctionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#equalityComparison}.
	 * @param ctx the parse tree
	 */
	void enterEqualityComparison(KotlinParser.EqualityComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#equalityComparison}.
	 * @param ctx the parse tree
	 */
	void exitEqualityComparison(KotlinParser.EqualityComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#comparison}.
	 * @param ctx the parse tree
	 */
	void enterComparison(KotlinParser.ComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#comparison}.
	 * @param ctx the parse tree
	 */
	void exitComparison(KotlinParser.ComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#namedInfix}.
	 * @param ctx the parse tree
	 */
	void enterNamedInfix(KotlinParser.NamedInfixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#namedInfix}.
	 * @param ctx the parse tree
	 */
	void exitNamedInfix(KotlinParser.NamedInfixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#elvisExpression}.
	 * @param ctx the parse tree
	 */
	void enterElvisExpression(KotlinParser.ElvisExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#elvisExpression}.
	 * @param ctx the parse tree
	 */
	void exitElvisExpression(KotlinParser.ElvisExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#infixFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterInfixFunctionCall(KotlinParser.InfixFunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#infixFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitInfixFunctionCall(KotlinParser.InfixFunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#rangeExpression}.
	 * @param ctx the parse tree
	 */
	void enterRangeExpression(KotlinParser.RangeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#rangeExpression}.
	 * @param ctx the parse tree
	 */
	void exitRangeExpression(KotlinParser.RangeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#additiveExpression}.
	 * @param ctx the parse tree
	 */
	void enterAdditiveExpression(KotlinParser.AdditiveExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#additiveExpression}.
	 * @param ctx the parse tree
	 */
	void exitAdditiveExpression(KotlinParser.AdditiveExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void enterMultiplicativeExpression(KotlinParser.MultiplicativeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#multiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void exitMultiplicativeExpression(KotlinParser.MultiplicativeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeRHS}.
	 * @param ctx the parse tree
	 */
	void enterTypeRHS(KotlinParser.TypeRHSContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeRHS}.
	 * @param ctx the parse tree
	 */
	void exitTypeRHS(KotlinParser.TypeRHSContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#prefixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterPrefixUnaryExpression(KotlinParser.PrefixUnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#prefixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitPrefixUnaryExpression(KotlinParser.PrefixUnaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#postfixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterPostfixUnaryExpression(KotlinParser.PostfixUnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#postfixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitPostfixUnaryExpression(KotlinParser.PostfixUnaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#doubleColonSuffix}.
	 * @param ctx the parse tree
	 */
	void enterDoubleColonSuffix(KotlinParser.DoubleColonSuffixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#doubleColonSuffix}.
	 * @param ctx the parse tree
	 */
	void exitDoubleColonSuffix(KotlinParser.DoubleColonSuffixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#doubleColon}.
	 * @param ctx the parse tree
	 */
	void enterDoubleColon(KotlinParser.DoubleColonContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#doubleColon}.
	 * @param ctx the parse tree
	 */
	void exitDoubleColon(KotlinParser.DoubleColonContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#userTypeWithoutNL}.
	 * @param ctx the parse tree
	 */
	void enterUserTypeWithoutNL(KotlinParser.UserTypeWithoutNLContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#userTypeWithoutNL}.
	 * @param ctx the parse tree
	 */
	void exitUserTypeWithoutNL(KotlinParser.UserTypeWithoutNLContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#simpleUserTypeWithoutNL}.
	 * @param ctx the parse tree
	 */
	void enterSimpleUserTypeWithoutNL(KotlinParser.SimpleUserTypeWithoutNLContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#simpleUserTypeWithoutNL}.
	 * @param ctx the parse tree
	 */
	void exitSimpleUserTypeWithoutNL(KotlinParser.SimpleUserTypeWithoutNLContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#multiplicativeOperation}.
	 * @param ctx the parse tree
	 */
	void enterMultiplicativeOperation(KotlinParser.MultiplicativeOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#multiplicativeOperation}.
	 * @param ctx the parse tree
	 */
	void exitMultiplicativeOperation(KotlinParser.MultiplicativeOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#additiveOperation}.
	 * @param ctx the parse tree
	 */
	void enterAdditiveOperation(KotlinParser.AdditiveOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#additiveOperation}.
	 * @param ctx the parse tree
	 */
	void exitAdditiveOperation(KotlinParser.AdditiveOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#inOperation}.
	 * @param ctx the parse tree
	 */
	void enterInOperation(KotlinParser.InOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#inOperation}.
	 * @param ctx the parse tree
	 */
	void exitInOperation(KotlinParser.InOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeOperation}.
	 * @param ctx the parse tree
	 */
	void enterTypeOperation(KotlinParser.TypeOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeOperation}.
	 * @param ctx the parse tree
	 */
	void exitTypeOperation(KotlinParser.TypeOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#isOperation}.
	 * @param ctx the parse tree
	 */
	void enterIsOperation(KotlinParser.IsOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#isOperation}.
	 * @param ctx the parse tree
	 */
	void exitIsOperation(KotlinParser.IsOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#comparisonOperation}.
	 * @param ctx the parse tree
	 */
	void enterComparisonOperation(KotlinParser.ComparisonOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#comparisonOperation}.
	 * @param ctx the parse tree
	 */
	void exitComparisonOperation(KotlinParser.ComparisonOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#equalityOperation}.
	 * @param ctx the parse tree
	 */
	void enterEqualityOperation(KotlinParser.EqualityOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#equalityOperation}.
	 * @param ctx the parse tree
	 */
	void exitEqualityOperation(KotlinParser.EqualityOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#assignmentOperation}.
	 * @param ctx the parse tree
	 */
	void enterAssignmentOperation(KotlinParser.AssignmentOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#assignmentOperation}.
	 * @param ctx the parse tree
	 */
	void exitAssignmentOperation(KotlinParser.AssignmentOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#prefixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void enterPrefixUnaryOperation(KotlinParser.PrefixUnaryOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#prefixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void exitPrefixUnaryOperation(KotlinParser.PrefixUnaryOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#postfixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void enterPostfixUnaryOperation(KotlinParser.PostfixUnaryOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#postfixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void exitPostfixUnaryOperation(KotlinParser.PostfixUnaryOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#postfixUnaryOperationWithoutCallSuffix}.
	 * @param ctx the parse tree
	 */
	void enterPostfixUnaryOperationWithoutCallSuffix(KotlinParser.PostfixUnaryOperationWithoutCallSuffixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#postfixUnaryOperationWithoutCallSuffix}.
	 * @param ctx the parse tree
	 */
	void exitPostfixUnaryOperationWithoutCallSuffix(KotlinParser.PostfixUnaryOperationWithoutCallSuffixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#callSuffix}.
	 * @param ctx the parse tree
	 */
	void enterCallSuffix(KotlinParser.CallSuffixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#callSuffix}.
	 * @param ctx the parse tree
	 */
	void exitCallSuffix(KotlinParser.CallSuffixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#annotatedLambda}.
	 * @param ctx the parse tree
	 */
	void enterAnnotatedLambda(KotlinParser.AnnotatedLambdaContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#annotatedLambda}.
	 * @param ctx the parse tree
	 */
	void exitAnnotatedLambda(KotlinParser.AnnotatedLambdaContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#memberAccessOperation}.
	 * @param ctx the parse tree
	 */
	void enterMemberAccessOperation(KotlinParser.MemberAccessOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#memberAccessOperation}.
	 * @param ctx the parse tree
	 */
	void exitMemberAccessOperation(KotlinParser.MemberAccessOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#atomicExpression}.
	 * @param ctx the parse tree
	 */
	void enterAtomicExpression(KotlinParser.AtomicExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#atomicExpression}.
	 * @param ctx the parse tree
	 */
	void exitAtomicExpression(KotlinParser.AtomicExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#anonymousFunction}.
	 * @param ctx the parse tree
	 */
	void enterAnonymousFunction(KotlinParser.AnonymousFunctionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#anonymousFunction}.
	 * @param ctx the parse tree
	 */
	void exitAnonymousFunction(KotlinParser.AnonymousFunctionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedExpression}.
	 * @param ctx the parse tree
	 */
	void enterNestedExpression(KotlinParser.NestedExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedExpression}.
	 * @param ctx the parse tree
	 */
	void exitNestedExpression(KotlinParser.NestedExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedConjunction}.
	 * @param ctx the parse tree
	 */
	void enterNestedConjunction(KotlinParser.NestedConjunctionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedConjunction}.
	 * @param ctx the parse tree
	 */
	void exitNestedConjunction(KotlinParser.NestedConjunctionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedEqualityComparison}.
	 * @param ctx the parse tree
	 */
	void enterNestedEqualityComparison(KotlinParser.NestedEqualityComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedEqualityComparison}.
	 * @param ctx the parse tree
	 */
	void exitNestedEqualityComparison(KotlinParser.NestedEqualityComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedComparison}.
	 * @param ctx the parse tree
	 */
	void enterNestedComparison(KotlinParser.NestedComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedComparison}.
	 * @param ctx the parse tree
	 */
	void exitNestedComparison(KotlinParser.NestedComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedNamedInfix}.
	 * @param ctx the parse tree
	 */
	void enterNestedNamedInfix(KotlinParser.NestedNamedInfixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedNamedInfix}.
	 * @param ctx the parse tree
	 */
	void exitNestedNamedInfix(KotlinParser.NestedNamedInfixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedElvisExpression}.
	 * @param ctx the parse tree
	 */
	void enterNestedElvisExpression(KotlinParser.NestedElvisExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedElvisExpression}.
	 * @param ctx the parse tree
	 */
	void exitNestedElvisExpression(KotlinParser.NestedElvisExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedInfixFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterNestedInfixFunctionCall(KotlinParser.NestedInfixFunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedInfixFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitNestedInfixFunctionCall(KotlinParser.NestedInfixFunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedRangeExpression}.
	 * @param ctx the parse tree
	 */
	void enterNestedRangeExpression(KotlinParser.NestedRangeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedRangeExpression}.
	 * @param ctx the parse tree
	 */
	void exitNestedRangeExpression(KotlinParser.NestedRangeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedAdditiveExpression}.
	 * @param ctx the parse tree
	 */
	void enterNestedAdditiveExpression(KotlinParser.NestedAdditiveExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedAdditiveExpression}.
	 * @param ctx the parse tree
	 */
	void exitNestedAdditiveExpression(KotlinParser.NestedAdditiveExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedMultiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void enterNestedMultiplicativeExpression(KotlinParser.NestedMultiplicativeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedMultiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void exitNestedMultiplicativeExpression(KotlinParser.NestedMultiplicativeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedTypeRHS}.
	 * @param ctx the parse tree
	 */
	void enterNestedTypeRHS(KotlinParser.NestedTypeRHSContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedTypeRHS}.
	 * @param ctx the parse tree
	 */
	void exitNestedTypeRHS(KotlinParser.NestedTypeRHSContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedPrefixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterNestedPrefixUnaryExpression(KotlinParser.NestedPrefixUnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedPrefixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitNestedPrefixUnaryExpression(KotlinParser.NestedPrefixUnaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedPostfixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterNestedPostfixUnaryExpression(KotlinParser.NestedPostfixUnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedPostfixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitNestedPostfixUnaryExpression(KotlinParser.NestedPostfixUnaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedDoubleColonSuffix}.
	 * @param ctx the parse tree
	 */
	void enterNestedDoubleColonSuffix(KotlinParser.NestedDoubleColonSuffixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedDoubleColonSuffix}.
	 * @param ctx the parse tree
	 */
	void exitNestedDoubleColonSuffix(KotlinParser.NestedDoubleColonSuffixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedPostfixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void enterNestedPostfixUnaryOperation(KotlinParser.NestedPostfixUnaryOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedPostfixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void exitNestedPostfixUnaryOperation(KotlinParser.NestedPostfixUnaryOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#nestedPostfixUnaryOperationWithoutCallSuffix}.
	 * @param ctx the parse tree
	 */
	void enterNestedPostfixUnaryOperationWithoutCallSuffix(KotlinParser.NestedPostfixUnaryOperationWithoutCallSuffixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#nestedPostfixUnaryOperationWithoutCallSuffix}.
	 * @param ctx the parse tree
	 */
	void exitNestedPostfixUnaryOperationWithoutCallSuffix(KotlinParser.NestedPostfixUnaryOperationWithoutCallSuffixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#literalConstant}.
	 * @param ctx the parse tree
	 */
	void enterLiteralConstant(KotlinParser.LiteralConstantContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#literalConstant}.
	 * @param ctx the parse tree
	 */
	void exitLiteralConstant(KotlinParser.LiteralConstantContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#escapedString}.
	 * @param ctx the parse tree
	 */
	void enterEscapedString(KotlinParser.EscapedStringContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#escapedString}.
	 * @param ctx the parse tree
	 */
	void exitEscapedString(KotlinParser.EscapedStringContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#escapedStringElement}.
	 * @param ctx the parse tree
	 */
	void enterEscapedStringElement(KotlinParser.EscapedStringElementContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#escapedStringElement}.
	 * @param ctx the parse tree
	 */
	void exitEscapedStringElement(KotlinParser.EscapedStringElementContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#longTemplate}.
	 * @param ctx the parse tree
	 */
	void enterLongTemplate(KotlinParser.LongTemplateContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#longTemplate}.
	 * @param ctx the parse tree
	 */
	void exitLongTemplate(KotlinParser.LongTemplateContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#rawString}.
	 * @param ctx the parse tree
	 */
	void enterRawString(KotlinParser.RawStringContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#rawString}.
	 * @param ctx the parse tree
	 */
	void exitRawString(KotlinParser.RawStringContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#rawStringElement}.
	 * @param ctx the parse tree
	 */
	void enterRawStringElement(KotlinParser.RawStringElementContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#rawStringElement}.
	 * @param ctx the parse tree
	 */
	void exitRawStringElement(KotlinParser.RawStringElementContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#rawLongTemplate}.
	 * @param ctx the parse tree
	 */
	void enterRawLongTemplate(KotlinParser.RawLongTemplateContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#rawLongTemplate}.
	 * @param ctx the parse tree
	 */
	void exitRawLongTemplate(KotlinParser.RawLongTemplateContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(KotlinParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(KotlinParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#declaration}.
	 * @param ctx the parse tree
	 */
	void enterDeclaration(KotlinParser.DeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#declaration}.
	 * @param ctx the parse tree
	 */
	void exitDeclaration(KotlinParser.DeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#blockLevelExpression}.
	 * @param ctx the parse tree
	 */
	void enterBlockLevelExpression(KotlinParser.BlockLevelExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#blockLevelExpression}.
	 * @param ctx the parse tree
	 */
	void exitBlockLevelExpression(KotlinParser.BlockLevelExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeArguments}.
	 * @param ctx the parse tree
	 */
	void enterTypeArguments(KotlinParser.TypeArgumentsContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeArguments}.
	 * @param ctx the parse tree
	 */
	void exitTypeArguments(KotlinParser.TypeArgumentsContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#valueArguments}.
	 * @param ctx the parse tree
	 */
	void enterValueArguments(KotlinParser.ValueArgumentsContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#valueArguments}.
	 * @param ctx the parse tree
	 */
	void exitValueArguments(KotlinParser.ValueArgumentsContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#jump}.
	 * @param ctx the parse tree
	 */
	void enterJump(KotlinParser.JumpContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#jump}.
	 * @param ctx the parse tree
	 */
	void exitJump(KotlinParser.JumpContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#functionalLiteral}.
	 * @param ctx the parse tree
	 */
	void enterFunctionalLiteral(KotlinParser.FunctionalLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#functionalLiteral}.
	 * @param ctx the parse tree
	 */
	void exitFunctionalLiteral(KotlinParser.FunctionalLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#lambdaParameter}.
	 * @param ctx the parse tree
	 */
	void enterLambdaParameter(KotlinParser.LambdaParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#lambdaParameter}.
	 * @param ctx the parse tree
	 */
	void exitLambdaParameter(KotlinParser.LambdaParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#statements}.
	 * @param ctx the parse tree
	 */
	void enterStatements(KotlinParser.StatementsContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#statements}.
	 * @param ctx the parse tree
	 */
	void exitStatements(KotlinParser.StatementsContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#constructorInvocation}.
	 * @param ctx the parse tree
	 */
	void enterConstructorInvocation(KotlinParser.ConstructorInvocationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#constructorInvocation}.
	 * @param ctx the parse tree
	 */
	void exitConstructorInvocation(KotlinParser.ConstructorInvocationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#arrayAccess}.
	 * @param ctx the parse tree
	 */
	void enterArrayAccess(KotlinParser.ArrayAccessContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#arrayAccess}.
	 * @param ctx the parse tree
	 */
	void exitArrayAccess(KotlinParser.ArrayAccessContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#objectLiteral}.
	 * @param ctx the parse tree
	 */
	void enterObjectLiteral(KotlinParser.ObjectLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#objectLiteral}.
	 * @param ctx the parse tree
	 */
	void exitObjectLiteral(KotlinParser.ObjectLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#when}.
	 * @param ctx the parse tree
	 */
	void enterWhen(KotlinParser.WhenContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#when}.
	 * @param ctx the parse tree
	 */
	void exitWhen(KotlinParser.WhenContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#whenEntry}.
	 * @param ctx the parse tree
	 */
	void enterWhenEntry(KotlinParser.WhenEntryContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#whenEntry}.
	 * @param ctx the parse tree
	 */
	void exitWhenEntry(KotlinParser.WhenEntryContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#whenCondition}.
	 * @param ctx the parse tree
	 */
	void enterWhenCondition(KotlinParser.WhenConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#whenCondition}.
	 * @param ctx the parse tree
	 */
	void exitWhenCondition(KotlinParser.WhenConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#classModifier}.
	 * @param ctx the parse tree
	 */
	void enterClassModifier(KotlinParser.ClassModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#classModifier}.
	 * @param ctx the parse tree
	 */
	void exitClassModifier(KotlinParser.ClassModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#memberModifier}.
	 * @param ctx the parse tree
	 */
	void enterMemberModifier(KotlinParser.MemberModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#memberModifier}.
	 * @param ctx the parse tree
	 */
	void exitMemberModifier(KotlinParser.MemberModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#accessModifier}.
	 * @param ctx the parse tree
	 */
	void enterAccessModifier(KotlinParser.AccessModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#accessModifier}.
	 * @param ctx the parse tree
	 */
	void exitAccessModifier(KotlinParser.AccessModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#varianceAnnotation}.
	 * @param ctx the parse tree
	 */
	void enterVarianceAnnotation(KotlinParser.VarianceAnnotationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#varianceAnnotation}.
	 * @param ctx the parse tree
	 */
	void exitVarianceAnnotation(KotlinParser.VarianceAnnotationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#parameterModifier}.
	 * @param ctx the parse tree
	 */
	void enterParameterModifier(KotlinParser.ParameterModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#parameterModifier}.
	 * @param ctx the parse tree
	 */
	void exitParameterModifier(KotlinParser.ParameterModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#typeParameterModifier}.
	 * @param ctx the parse tree
	 */
	void enterTypeParameterModifier(KotlinParser.TypeParameterModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#typeParameterModifier}.
	 * @param ctx the parse tree
	 */
	void exitTypeParameterModifier(KotlinParser.TypeParameterModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#functionModifier}.
	 * @param ctx the parse tree
	 */
	void enterFunctionModifier(KotlinParser.FunctionModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#functionModifier}.
	 * @param ctx the parse tree
	 */
	void exitFunctionModifier(KotlinParser.FunctionModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#propertyModifier}.
	 * @param ctx the parse tree
	 */
	void enterPropertyModifier(KotlinParser.PropertyModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#propertyModifier}.
	 * @param ctx the parse tree
	 */
	void exitPropertyModifier(KotlinParser.PropertyModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#suspendModifier}.
	 * @param ctx the parse tree
	 */
	void enterSuspendModifier(KotlinParser.SuspendModifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#suspendModifier}.
	 * @param ctx the parse tree
	 */
	void exitSuspendModifier(KotlinParser.SuspendModifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#annotations}.
	 * @param ctx the parse tree
	 */
	void enterAnnotations(KotlinParser.AnnotationsContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#annotations}.
	 * @param ctx the parse tree
	 */
	void exitAnnotations(KotlinParser.AnnotationsContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#annotation}.
	 * @param ctx the parse tree
	 */
	void enterAnnotation(KotlinParser.AnnotationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#annotation}.
	 * @param ctx the parse tree
	 */
	void exitAnnotation(KotlinParser.AnnotationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#annotationList}.
	 * @param ctx the parse tree
	 */
	void enterAnnotationList(KotlinParser.AnnotationListContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#annotationList}.
	 * @param ctx the parse tree
	 */
	void exitAnnotationList(KotlinParser.AnnotationListContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#unescapedAnnotation}.
	 * @param ctx the parse tree
	 */
	void enterUnescapedAnnotation(KotlinParser.UnescapedAnnotationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#unescapedAnnotation}.
	 * @param ctx the parse tree
	 */
	void exitUnescapedAnnotation(KotlinParser.UnescapedAnnotationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#simpleName}.
	 * @param ctx the parse tree
	 */
	void enterSimpleName(KotlinParser.SimpleNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#simpleName}.
	 * @param ctx the parse tree
	 */
	void exitSimpleName(KotlinParser.SimpleNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#softKeyword}.
	 * @param ctx the parse tree
	 */
	void enterSoftKeyword(KotlinParser.SoftKeywordContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#softKeyword}.
	 * @param ctx the parse tree
	 */
	void exitSoftKeyword(KotlinParser.SoftKeywordContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#semi}.
	 * @param ctx the parse tree
	 */
	void enterSemi(KotlinParser.SemiContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#semi}.
	 * @param ctx the parse tree
	 */
	void exitSemi(KotlinParser.SemiContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationExpression}.
	 * @param ctx the parse tree
	 */
	void enterDelegationExpression(KotlinParser.DelegationExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationExpression}.
	 * @param ctx the parse tree
	 */
	void exitDelegationExpression(KotlinParser.DelegationExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationConjunction}.
	 * @param ctx the parse tree
	 */
	void enterDelegationConjunction(KotlinParser.DelegationConjunctionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationConjunction}.
	 * @param ctx the parse tree
	 */
	void exitDelegationConjunction(KotlinParser.DelegationConjunctionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationEqualityComparison}.
	 * @param ctx the parse tree
	 */
	void enterDelegationEqualityComparison(KotlinParser.DelegationEqualityComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationEqualityComparison}.
	 * @param ctx the parse tree
	 */
	void exitDelegationEqualityComparison(KotlinParser.DelegationEqualityComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationComparison}.
	 * @param ctx the parse tree
	 */
	void enterDelegationComparison(KotlinParser.DelegationComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationComparison}.
	 * @param ctx the parse tree
	 */
	void exitDelegationComparison(KotlinParser.DelegationComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationNamedInfix}.
	 * @param ctx the parse tree
	 */
	void enterDelegationNamedInfix(KotlinParser.DelegationNamedInfixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationNamedInfix}.
	 * @param ctx the parse tree
	 */
	void exitDelegationNamedInfix(KotlinParser.DelegationNamedInfixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationElvisExpression}.
	 * @param ctx the parse tree
	 */
	void enterDelegationElvisExpression(KotlinParser.DelegationElvisExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationElvisExpression}.
	 * @param ctx the parse tree
	 */
	void exitDelegationElvisExpression(KotlinParser.DelegationElvisExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationInfixFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterDelegationInfixFunctionCall(KotlinParser.DelegationInfixFunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationInfixFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitDelegationInfixFunctionCall(KotlinParser.DelegationInfixFunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationRangeExpression}.
	 * @param ctx the parse tree
	 */
	void enterDelegationRangeExpression(KotlinParser.DelegationRangeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationRangeExpression}.
	 * @param ctx the parse tree
	 */
	void exitDelegationRangeExpression(KotlinParser.DelegationRangeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationAdditiveExpression}.
	 * @param ctx the parse tree
	 */
	void enterDelegationAdditiveExpression(KotlinParser.DelegationAdditiveExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationAdditiveExpression}.
	 * @param ctx the parse tree
	 */
	void exitDelegationAdditiveExpression(KotlinParser.DelegationAdditiveExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationMultiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void enterDelegationMultiplicativeExpression(KotlinParser.DelegationMultiplicativeExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationMultiplicativeExpression}.
	 * @param ctx the parse tree
	 */
	void exitDelegationMultiplicativeExpression(KotlinParser.DelegationMultiplicativeExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationTypeRHS}.
	 * @param ctx the parse tree
	 */
	void enterDelegationTypeRHS(KotlinParser.DelegationTypeRHSContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationTypeRHS}.
	 * @param ctx the parse tree
	 */
	void exitDelegationTypeRHS(KotlinParser.DelegationTypeRHSContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationPrefixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterDelegationPrefixUnaryExpression(KotlinParser.DelegationPrefixUnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationPrefixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitDelegationPrefixUnaryExpression(KotlinParser.DelegationPrefixUnaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationPostfixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterDelegationPostfixUnaryExpression(KotlinParser.DelegationPostfixUnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationPostfixUnaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitDelegationPostfixUnaryExpression(KotlinParser.DelegationPostfixUnaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationDoubleColonSuffix}.
	 * @param ctx the parse tree
	 */
	void enterDelegationDoubleColonSuffix(KotlinParser.DelegationDoubleColonSuffixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationDoubleColonSuffix}.
	 * @param ctx the parse tree
	 */
	void exitDelegationDoubleColonSuffix(KotlinParser.DelegationDoubleColonSuffixContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationPostfixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void enterDelegationPostfixUnaryOperation(KotlinParser.DelegationPostfixUnaryOperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationPostfixUnaryOperation}.
	 * @param ctx the parse tree
	 */
	void exitDelegationPostfixUnaryOperation(KotlinParser.DelegationPostfixUnaryOperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link KotlinParser#delegationCallSuffix}.
	 * @param ctx the parse tree
	 */
	void enterDelegationCallSuffix(KotlinParser.DelegationCallSuffixContext ctx);
	/**
	 * Exit a parse tree produced by {@link KotlinParser#delegationCallSuffix}.
	 * @param ctx the parse tree
	 */
	void exitDelegationCallSuffix(KotlinParser.DelegationCallSuffixContext ctx);
}