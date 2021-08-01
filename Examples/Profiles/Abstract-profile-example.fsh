// @Name: Abstract Profile Example
// @Description: Abstract profiles can be used to define common constraints used by multiple child profiles. The term "abstract" means that implementers would not create resources conforming to the abstract profile -- instead, they would target conforming to one of non-abstract child profiles. See "Abstract Profile with RuleSets Example" for an alternate approach to this.

Profile:     ExampleAbstractPatientProfile
Id:          example-abstract-patient-profile
Parent:      Patient
Title:       "Example Abstract Patient Profile"
Description: "Example of an abstract profile of Patient"

// For more information see http://www.hl7.org/fhir/structuredefinition-definitions.html#StructureDefinition.abstract
* ^abstract = true

// Require at least one value inside the `name` element
* name 1..*

// Mark elements as MustSupport
* name and name.given and name.family MS

* deceased[x] 1..1



// The profiles below will inherit the constraints from the above parent abstract profile

Profile:     ExampleLivingPatientProfile
Id:          example-living-patient-profile
Parent:      ExampleAbstractPatientProfile
Title:       "Example Living Patient Patient Profile"
Description: "Example of a profile for living patients inheriting from ExampleAbstractPatientProfile"

* deceased[x] only boolean
* deceasedBoolean = false



Profile:     ExampleDeceasedPatientProfile
Id:          example-deceased-patient-profile
Parent:      ExampleAbstractPatientProfile
Title:       "Example Deceased Patient Patient Profile"
Description: "Example of a profile for deceased patients inheriting from ExampleAbstractPatientProfile"

* deceased[x] only dateTime