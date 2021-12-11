# Clean Architecture

How to begin with "Clean Architecture". 

# Getting started

## Architectural Concepts

* [Use Case](docs/use_case.md)
* [Domain](docs/domain.md)
* [Gateway](docs/gateway.md)

### Basics

* The Mindset
* Start with Acceptance Testing
* Writing Fake Gateways
* Use Cases organise your code
* Constructors are for collaborators
* Don't leak your internals!
* TDD everything
* Build in a reliable dependency upgrade path
* Your first Real Gateway
* Your first Delivery Mechanism

### Intermediate

* Presenters are more flexible
* Keep your wiring DRY
* Extend Use Case behaviour with Domain objects
* Extracting a Use Case from a Use Case
* Authentication
* Authorisation

### Advanced

* Consider the Actors
* Substitutable Use Cases
* Feature Toggles
* Keep your Domain object construction DRY

## Examples in Languages

* Delphi
* Kotlin
* TypeScript 
* JS
* Jaca
* C#

# Further Reading

[Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html) by Robert C. Martin is extremely similar in nature to 

* BCE by Ivar Jacobson and,
* Hexagonal Architecture (also known as **Ports & Adapters**) by Alistair Cockburn.

The Made Tech flavour is slightly different still to exactly what is described in Robert C. Martin's book about Clean Architecture, the choice to rename certain basic concept is deliberate to aid:

- Learning as a Junior 
  - Relating Interactors (Robert's name for UseCase objects) to Use Case Analysis sessions
  - Retaining an eye on Domain-Driven-Design i.e. What are Domain objects?
  - Avoiding overloading terminology e.g. Entity (Robert's name for Domain Objects) with EntityFramework Entities

Made Tech flavour Clean Architecture is more prescriptive than any of these other examples
