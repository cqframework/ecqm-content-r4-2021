library CaseFeatureInference version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001' called FHIRHelpers
include Common version '0.0.1' called Common
include CaseFeatureCoding version '0.0.1' called Coding
include Asserted version '0.0.1' called Asserted

context Patient

define "Most Recent Weight":
    convert(
        Common.MostRecent(Asserted."Weight Observations").value as Quantity
    ) to 'kg'

define "Most Recent Height":
    convert(
        Common.MostRecent(Asserted."Height Observations").value as Quantity
    ) to 'm2'

define "Calculated BMI Value":
    "Most Recent Weight" / "Most Recent Height"

//Is there a better way to set the profile?
define "Most Recent BMI":
    Common.CaseFeatureObservation(
        Coding."BMI Inference", 
        "Calculated BMI Value",
        Now(),
        'http://canonical-base/StructureDefinition/MostRecentBMI'
    )
