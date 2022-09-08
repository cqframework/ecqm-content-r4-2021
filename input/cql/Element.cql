library Element version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include Common version '0.0.1' called Common

codesystem "CaseFeatures": 'http://cds.com/diabetes/ada/fhir/CodeSystem/CaseFeatures'

code "MostRecentBMI": 'MostRecentBMI' from "CaseFeatures"

valueset "BMI": 'http://cds.com/diabetes/ada/fhir/ValueSet/BMI'
valueset "Height": 'http://cds.com/diabetes/ada/fhir/ValueSet/Height'
valueset "Weight": 'http://cds.com/diabetes/ada/fhir/ValueSet/Weight'

context Patient

define "BMI Observations":
    Common.QualifiedObservations([Observation: "BMI"])

define "Most Recent BMI Observations":
    Common.QualifiedCaseFeatureObservations([Observation: "MostRecentBMI"])

define "Weight Observations":
    Common.QualifiedObservations([Observation: "Weight"])
    
define "Height Observations":
    Common.QualifiedObservations([Observation: "Height"])
