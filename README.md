## Project
Target language independent ANTLR4 grammar for Kotlin.

# Known bugs and erroneous behavior
1. 'dynamic' type is allowed as reciever.
2. Several annotated lambdas are allowed in call suffix.

Also, though parser tries to match only those modifiers, that are applicable in current case, sometimes it might
match incorrect modifier as correct.