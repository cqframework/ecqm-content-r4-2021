library PalliativeCareFHIR version '0.2.000'

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '5.0.000' called Global
include FHIRHelpers version '4.0.001' called FHIRHelpers

codesystem "LOINC": 'http://loinc.org' 

valueset "Palliative Care Assessment": 'https://www.ncqa.org/fhir/valueset/2.16.840.1.113883.3.464.1004.2225' 
valueset "Palliative Care Encounter": 'https://www.ncqa.org/fhir/valueset/2.16.840.1.113883.3.464.1004.1450' 
valueset "Palliative Care Intervention": 'https://www.ncqa.org/fhir/valueset/2.16.840.1.113883.3.464.1004.2224' 

code "Functional Assessment of Chronic Illness Therapy - Palliative Care Questionnaire (FACIT-Pal)": '71007-9' from "LOINC" display 'Functional Assessment of Chronic Illness Therapy - Palliative Care Questionnaire (FACIT-Pal)'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Palliative Care in the Measurement Period":
  exists ( [Observation: "Functional Assessment of Chronic Illness Therapy - Palliative Care Questionnaire (FACIT-Pal)"] PalliativeAssessment
            where PalliativeAssessment.status in {'final','amended','corrected'}
            and Global."Normalize Interval"(PalliativeAssessment.effective) during "Measurement Period"
        )
          or exists ( [Encounter: "Palliative Care Encounter"] PalliativeEncounter
              where PalliativeEncounter.status = 'finished'
              and PalliativeEncounter.period overlaps "Measurement Period"
          )
          or exists ( [Procedure: "Palliative Care Intervention"] PalliativeIntervention
              where PalliativeIntervention.status in {'completed','in-progress'}
              and Global."Normalize Interval"(PalliativeIntervention.performed) overlaps "Measurement Period"
                  )

