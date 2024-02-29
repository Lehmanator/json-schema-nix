## Nix Option Types

### Classes

- noun
- composite
- conjunction

### Types

- raw
- anything
- unspecified
- bool
- boolByOr
- int
- ints
- port
- float
- number
- numbers
- numbers.between
- numbers.nonnegative
- numbers.positive
- str
- nonEmptyStr
- singleLineStr
- strMatching
- separatedString
- lines
- commas
- envVar
- passwdEntry
- attrs
- package
- shellPackage
- pkgs
- path
- pathInStore
- listOf
- nonEmptyListOf
- attrsOf
- lazyAttrsOf
- loaOf
- uniq
- unique
- nullOr
- functionTo
- submodule
- submoduleWith
- deferredModule
- deferredModuleWith
- optionType

#### Conjunction Types
- enum
- either
- oneOf
- coercedTo

```(nix)
lib.types.__attrsFailEvaluation
lib.types.ints
lib.types.pathInStore
lib.types.addCheck
lib.types.isOptionType
lib.types.pkgs
lib.types.anything
lib.types.isType
lib.types.port
lib.types.attrs
lib.types.lazyAttrsOf
lib.types.raw
lib.types.attrsOf
lib.types.lines
lib.types.separatedString
lib.types.bool
lib.types.listOf
lib.types.setType
lib.types.boolByOr
lib.types.loaOf
lib.types.shellPackage
lib.types.coercedTo
lib.types.mkOptionType
lib.types.singleLineStr
lib.types.commas
lib.types.nonEmptyListOf
lib.types.str
lib.types.defaultFunctor
lib.types.nonEmptyStr
lib.types.strMatching
lib.types.defaultTypeMerge
lib.types.nullOr
lib.types.string
lib.types.deferredModule
lib.types.number
lib.types.submodule
lib.types.deferredModuleWith
lib.types.numbers
lib.types.submoduleWith
lib.types.either
lib.types.oneOf
lib.types.types
lib.types.enum
lib.types.optionDescriptionPhrase
lib.types.uniq
lib.types.envVar
lib.types.optionType
lib.types.unique
lib.types.float
lib.types.package
lib.types.unspecified
lib.types.functionTo
lib.types.passwdEntry
lib.types.int
lib.types.path
```


