library CaseFeatureAssertion version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001' called FHIRHelpers
include Common version '0.0.1' called Common
include CaseFeatureCoding version '0.0.1' called Coding
include Asserted version '0.0.1' called Asserted

context Patient

define "Most Recent Asserted BMI":
    Common.MostRecent(
        Asserted."BMI Observations"
            union Asserted."Most Recent BMI Observations"
    )

//Is there a better way to set the profile?
define "Most Recent BMI":
    Common.CaseFeatureObservation(
        Coding."BMI Assertion", 
        convert("Most Recent Asserted BMI".value as Quantity) to 'kg/m2',
        "Most Recent Asserted BMI".effective as dateTime, 
        'http://canonical-base/StructureDefinition/MostRecentBMI'
    )
