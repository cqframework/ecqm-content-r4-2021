library CaseFeatureAssertion version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include Common version '0.0.1' called Common
include Concept version '0.0.1' called Concept
include Element version '0.0.1' called Element

context Patient

define "Most Recent Asserted BMI":
    Common.MostRecent(
        Element."BMI Observations"
            union Element."Most Recent BMI Observations"
    )

//Is there a better way to set the profile?
define "Most Recent BMI":
    Common.CaseFeatureObservation(
        Concept."BMI Assertion", 
        convert("Most Recent Asserted BMI".value as Quantity) to 'kg/m2',
        "Most Recent Asserted BMI".effective as dateTime, 
        'http://canonical-base/StructureDefinition/MostRecentBMI'
    )
