library CaseFeature version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include Common version '0.0.1' called Common
include CaseFeatureAssertion version '0.0.1' called Assertion
include CaseFeatureInference version '0.0.1' called Inference

context Patient

define "Most Recent BMI":
    Coalesce(Assertion."Most Recent BMI", Inference."Most Recent BMI")
