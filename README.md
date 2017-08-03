# Project
Target language independent ANTLR4 grammar for Kotlin.

## Known bugs and erroneous behavior
1. 'dynamic' type is allowed as reciever:
```
val dynamic.s : Int = 1 //is parsed as valid declaration
```

2. Several annotated lambdas are allowed in call suffix:
```
foo(){}{}{} //is parsed as valid function call with 3 call suffixes
```

3. Classes and interfaces are parsed in the same way with the only difference in keyword. This leads to correct parsing of incorrect structures. For example interfaces with constructors:
```
interface A constructor(val b: Int) //is parsed as valid interface declaration
```
There is the same problem with abstract functions which are parsed as normal functions and therefore allowed to have bodies:
```
abstract fun foo() { print("I have body") } //is parsed as valid function declaration
```

4. Also, though parser tries to match only those modifiers, that are applicable in current case, sometimes it might
match incorrect modifier as correct.
For example 'lateinit' is not applicable to function declaration. But this modifier is considered as 'member' modifier and function declaration is a 'member' so following code is correctly parsed:
```
class A {
  lateinit fun foo() = 2 //is parsed as valid member declaration
}
```
