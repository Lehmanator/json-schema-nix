# JSON-Schema

Schema definition format based on JSON & described using JSON.

[Awesome List](https://github.com/sourcemeta/awesome-jsonschema)

## Documentation

[json-schema.org](https://json-schema.org)
[json-schema.org - Glossary](https://json-schema.org/learn/glossary)
[json-schema - Dialect Docs](https://www.learnjsonschema.com/2020-12/)
[docs.json-everything.net](https://docs.json-everything.net)

## Registries

- [SchemaStore](https://www.schemastore.org)
- [Sourcemeta Schemas](https://schemas.sourcemeta.com)

### Features

- Types
- Regular expressions
- String length
- String format
- Numeric types multiples and range
- Constant and enumerated values
- Required properties
- Pattern properties
- Default values
- Array minItems, maxItems, uniqueItems, items, prefixItems, additionalItems, and contains
- Combining schema with oneOf, allOf, anyOf, and not
- Examples
- Conditional subschemas
- Property names and size
- Property dependencies
- Media

## Types

### JSON Data Types

- object -> lib.types.attrs
- array -> lib.types.listOf
- number -> lib.types.number
- string -> lib.types.str
- boolean -> lib.types.bool
- null -> lib.types.nullOr

## Keywords
### Generic

Comments:
- $comment - string

Enumerated Values:
- enum - array (with at least one element)

Constant Values:
- const - any - `==` TODO: Nix equality testing lib to recurse?

#### Annotations

Describes parts of a schema. Not mandatory, but encouraged for good practice. Good for "self-documenting".

- title - string
- description - string
- default - any (must match type)
- examples - any (must match type)
- readOnly - boolean
- writeOnly - boolean
- deprecated - boolean

### Type-Specific
##### Strings
- minLength
- maxLength
- pattern - (regex syntax in Javascript ECMA 262 w/ unicode support)
- format
  - date-time
  - date
  - time
  - duration
  - email
  - idn-email
  - hostname
  - idn-hostname
  - ipv4
  - ipv6
  - uuid
  - uri
  - uri-reference
  - iri
  - iri-reference
  - uri-template
  - json-pointer
  - relative-json-pointer
  - regex

#### Numbers
- integer - lib.types.int
- number - lib.types.number
- multipleOf -
- minimum -
- maximum -
- exclusiveMinimum -
- exclusiveMaximum -

#### Objects
- properties -
- patternProperties -
- additionalProperties -
- unevaluatedProperties -
- required - lib.types.listOf lib.types.str
- propertyNames -
- minProperties -
- maxProperties -

#### Arrays
- items (for arrays; same type) -
- prefixItems (for tuples; mixed types) -
- additionalItems -
- unevaluatedItems -
- contains -
- minContains -
- maxContains -
- minItems -
- maxItems -
- uniqueItems -

#### Media

See: [IANA: Media Type Assignments](http://www.iana.org/assignments/media-types/media-types.xhtml)

- contentMediaType (MIME type as in RFC 2046) -
- contentEncoding (encoding as in RFC 2054.6.1 & 4648) (oneOf null|quoted-printable|base16|base32|base64) -
- contentSchema -

#### Composition
- allOf -
- anyOf -
- oneOf -
- not -

#### Conditional Subschemas

Note: Since `if-then-else` pattern is not very intuitive, it's recommended to put your conditionals in `$defs` with a descriptive name and `$ref` it into your schema with:
`"allOf": [{ "$ref": "#/$defs/sit-down-restaurant-implies-tip-is-required" }]`.

- dependentRequired -
- dependentSchemas -
- if -
- then -
- else -


## Vocabularies

A tightly related collection of keywords, grouped to facilitate re-use.

A vocabulary is specified by a prose document or specification which explains the semantics of its keywords in a way suitable for implementers and users of the vocabulary. It often also includes a meta-schema (or multiple metaschemas) which define the syntax of its keywords.

Anyone can create and publish a vocabulary, and implementations generally will include facilities for extending themselves with support for additional vocabularies and their keywords. The JSON Schema specification includes a number of vocabularies which cover each of the keywords it defines.

In some dialects of JSON Schema, the $vocabulary keyword can be used to include the keywords defined by a vocabulary into the dialect, as well as to indicate whether implementations must specifically recognize the vocabulary in order to be able to process schemas written in the dialect or not.


### Core

Defines keywords that are either required in order to process any schema or meta-schema, including those split across multiple documents, or exist to reserve keywords for purposes that require guaranteed interoperability.
[Read more](https://www.learnjsonschema.com/2020-12/core/)

Kind: `Identifier` | `Applicator` | `ReservedLocation`
Instance: `Any`

- $schema - Identifier
- $id - Identifier
- $ref - Applicator
- $defs - ReservedLocation
- $comment - ReservedLocation
- $dynamicAnchor - Identifier
- $dynamicRef - Applicator
- $anchor - Identifier
- $vocabulary - Identifier

### Applicators

Defines applicator keywords that are recommended for use as the basis of other vocabularies.
[Read more](https://www.learnjsonschema.com/2020-12/applicator/)

Kind: `Applicator` | (`Applicator` & `Annotation`)
Instance: `Any` | `Object` | `Array`

- oneOf
- allOf
- anyOf
- if
- then
- else
- not
- properties
- patternProperties
- additionalProperties
- dependentSchemas
- propertyNames
- prefixItems
- contains
- items

### Validation

Defines keywords that impose requirements for successful validation of an instance.
[Read more](https://www.learnjsonschema.com/2020-12/validation/).

Kind: `Assertion`

- type
- enum - lib.types.enum
- const
- minLength
- maxLength
- pattern
- maximum
- exclusiveMinimum
- multipleOf
- exclusiveMaximum
- minimum
- dependentRequired
- minProperties
- maxProperties
- required
- minItems
- maxItems
- minContains
- maxContains
- uniqueItems - lib.type.unique

### Meta Data

Defines general-purpose annotation keywords that provide commonly used information for documentation and user interface display purposes.
[Read More](https://www.learnjsonschema.com/2020-12/meta-data/)

Kind: `Annotation`
Instance: `Any`

- title
- description
- default
- deprecated
- examples
- readOnly
- writeOnly


### Format Annotation

Defines semantic information about string-encoded values.
[Read more](https://www.learnjsonschema.com/2020-12/format-annotation/)

Kind: `Annotation`
Instance: `String`

- `format` - Define semantic information about a string instance.


### Unevaluated

Defines keywords that apply subschemas to array items or object properties that have not been successfully evaluated against any dynamic-scope subschema of any adjacent keywords.
[Read more](https://www.learnjsonschema.com/2020-12/unevaluated/)

Kind: `Applicator` & `Annotation`

- unevaluatedItems - Array
- unevaluatedProperties - Object

### Content

Defines keywords for annotating instances that contain non-JSON data encoded in JSON strings.
[Read more](https://www.learnjsonschema.com/2020-12/content/)

Kind: `Annotation`
Instance: `String`

- contentEncoding
- contentMediaType
- contentSchema

### Format Assertion

Defines and asserts semantic information about string-encoded values.
[Read more](https://www.learnjsonschema.com/2020-12/format-assertion/)

Kind: `Annotation`, `Assertion`
Instance: `String`

- `format` - Define and assert semantic information about a string instance.


### Extra 3rd-Party Vocabularies

[Index Repo](https://github.com/json-schema-org/json-schema-vocabularies)
  - [Accessing Instance & External Data](https://docs.json-everything.net/schema/vocabs/data-2023)
  - [Extended Array Validation](https://docs.json-everything.net/schema/vocabs/array-ext)
  - [OpenAPI](https://spec.openapis.org/oas/3.1/vocab/base)


