library CaseFeatureInference version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include Common version '0.0.1' called Common
include Concept version '0.0.1' called Concept
include Element version '0.0.1' called Element

context Patient

define "Most Recent Weight":
    convert(
        Common.MostRecent(Element."Weight Observations").value as Quantity
    ) to 'kg'

define "Most Recent Height":
    convert(
        Common.MostRecent(Element."Height Observations").value as Quantity
    ) to 'm2'

define "Calculated BMI Value":
    "Most Recent Weight" / "Most Recent Height"

//Is there a better way to set the profile?
define "Most Recent BMI":
    Common.CaseFeatureObservation(
        Concept."BMI Inference", 
        "Calculated BMI Value",
        Now(),
        'http://canonical-base/StructureDefinition/MostRecentBMI'
    )
//SDE
define "Most Recent BMI":
    Observation {
        meta: 
            Meta {
                profile: {
                    canonical { value: 'http://canonical-base/StructureDefinition/MostRecentBMI' }
                }
            },
        code: CodeableConcept {
            coding: {
                Coding {
                    system: uri { value: 'http://cds.com/diabetes/ada/fhir/CodeSystem/CaseFeatures' },
                    code: code { value: 'CalculatedBMI' },
                    display: string { value: 'The BMI calculated from weight and height asserted data' }
                },
                Coding {
                    system: uri { value: 'http://loinc.org' },
                    code: code { value: '39156-5' },
                    display: string { value: 'Body mass index (BMI) [Ratio]' }
                }
            }
        },
        issued: instant { value: Now() },
        subject: ReferenceTo(Patient),
        status: ObservationStatus { value: 'preliminary' },
        value: 
            Quantity {
                value: decimal { value: "Calculated BMI Value".value },
                unit: string { value: "Calculated BMI Value".unit },
                system: uri { value: 'http://unitsofmeasure.org' },
                code: code { value: "Calculated BMI Value".unit }
            }
    }