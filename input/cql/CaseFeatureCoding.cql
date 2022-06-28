library CaseFeatureCoding version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001' called FHIRHelpers

define "BMI Assertion":
    CodeableConcept {
        coding: {
            Coding {
                system: uri { value: 'http://cds.com/diabetes/ada/fhir/CodeSystem/CaseFeatures' },
                code: code { value: 'MostRecentBMI' },
                display: string { value: 'The Most Recent BMI Case Feature' }
            },
            Coding {
                system: uri { value: 'http://loinc.org' },
                code: code { value: '39156-5' },
                display: string { value: 'Body mass index (BMI) [Ratio]' }
            }
        }
    }

define "BMI Inference":
    CodeableConcept {
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
    }
    