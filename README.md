# ecqm-content-r4-2021
eCQM Draft Measure Content (2021 AU Content, using FHIR R4 v4.0.1)

This repository contains the draft measure artifacts for FHIR based eCQMs. These specifications are based on the 2021 AU versions of CMS program measures.

Commits to this repository will automatically trigger a build of the continuous integration build, available here:

https://build.fhir.org/ig/cqframework/ecqm-content-r4-2021

## Content Index

The following table provides an index to the currently available library content in this implementation guide:

### Shared Libraries

|Library|Version|Status|
|----|----|----|
|[AdultOutpatientEncountersFHIR4](input/cql/AdultOutpatientEncountersFHIR4.cql)|2.2.000|Active|
|[AdvancedIllnessandFrailtyExclusionECQMFHIR4](input/cql/AdvancedIllnessandFrailtyExclusionECQMFHIR4.cql)|5.17.000|Active|
|[CumulativeMedicationDurationFHIR4](input/cql/CumulativeMedicationDurationFHIR4.cql)|1.0.000|Active|
|[FHIRHelpers](input/cql/FHIRHelpers.cql)|4.0.001|Active|
|[HospiceFHIR4](input/cql/HospiceFHIR4.cql)|2.3.000|Active|
|[MATGlobalCommonFunctionsFHIR4](input/cql/MATGlobalCommonFunctionsFHIR4.cql)|6.1.000|Active|
|[PalliativeCareFHIR](input/cql/PalliativeCareFHIR.cql)|0.6.000|Active|
|[SupplementalDataElementsFHIR4](input/cql/SupplementalDataElementsFHIR4.cql)|2.0.000|Active|
|[TJCOverallFHIR](input/cql/TJCOverallFHIR.cql)|1.8.000|Active|
|[VTEFHIR4](input/cql/VTEFHIR4.cql)|4.8.000|Active|

### Measure Libraries

|Library|Version|Status|
|----|----|----|
|[BCSEHEDISMY2022](input/cql/BCSEHEDISMY2022)|1.0.0|Draft|
|[BreastCancerScreeningsFHIR](input/cql/BreastCancerScreeningsFHIR.cql)|0.0.009|Draft|
|[CervicalCancerScreeningFHIR](input/cql/CervicalCancerScreeningFHIR.cql)|0.0.005|Draft|
|[ColorectalCancerScreeningsFHIR](input/cql/ColorectalCancerScreeningsFHIR.cql)|0.0.003|Draft|
|[DiabetesHemoglobinA1cHbA1cPoorControl9FHIR](input/cql/DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.cql)|0.0.015|Draft|
|[DischargedonAntithromboticTherapyFHIR](input/cql/DischargedonAntithromboticTherapyFHIR.cql)|0.0.010|Draft|
|[FHIR347](input/cql/FHIR347.cql)|0.1.021|Draft|
|[HospitalHarmHyperglycemiainHospitalizedPatientsFHIR](input/cql/HospitalHarmHyperglycemiainHospitalizedPatientsFHIR.cql)|0.0.006|Draft|
|[HospitalHarmSevereHypoglycemiaFHIR](input/cql/HospitalHarmSevereHypoglycemiaFHIR.cql)|0.0.012|Draft|
|[HybridHWMFHIR](input/cql/HybridHWMFHIR.cql)|0.102.005|Draft|
|[HybridHWRFHIR](input/cql/HybridHWRFHIR.cql)|1.3.005|Draft|
|IntensiveCareUnitVenousThromboembolismProphylaxisFHIR|(input/cql/IntensiveCareUnitVenousThromboembolismProphylaxisFHIR.cql)|0.0.012|Draft|
|[PrimaryCariesPreventionasOfferedbyPCPsincludingDentistsFHIR](input/cql/PrimaryCariesPreventionasOfferedbyPCPsincludingDentistsFHIR.cql)|0.0.008|Draft|
|[SafeUseofOpioidsConcurrentPrescribingFHIR](input/cql/SafeUseofOpioidsConcurrentPrescribingFHIR.cql)|0.0.012|Draft|

### Measures

|Measure|Description|
|----|----|
|[BCS-E](input/resources/measure/BCSEHEDISMY2022.json)|Breast Cancer Screening (HEDIS BCS-E MY2022)|
|[CMS74FHIR](input/resources/measure/PrimaryCariesPreventionasOfferedbyPCPsincludingDentistsFHIR.json)|Primary Caries Prevention Intervention as Offered by Primary Care Providers, including Dentists (CMS74v11)|
|[CMS104FHIR](input/resources/measure/DischargedonAntithromboticTherapyFHIR.json)|Discharged on Antithrombotic Therapy (CMS104v10)
|[CMS108FHIR](input/resources/measure/IntensiveCareUnitVenousThromboembolismProphylaxisFHIR.json)|Intensive Care Unit Venous Thromboembolism Prophylaxis (CMS108v10)
|[CMS122FHIR](input/resources/measure/DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json)|Cervical Cancer Screening (CMS122v10)|
|[CMS124FHIR](input/resources/measure/CervicalCancerScreeningFHIR.json)|Cervical Cancer Screening (CMS124v10)|
|[CMS125FHIR](input/resources/measure/BreastCancerScreeningsFHIR.json)|Breast Cancer Screening (CMS125v10)|
|[CMS130FHIR](input/resources/measure/ColorectalCancerScreeningsFHIR.json)|Colorectal Cancer Screening (CMS130v10)|
|[CMS142FHIR](input/resources/measure/DRCommunicationWithPhysicianManagingDiabetesFHIR.json)|Diabetic Retinopathy: Communication with the Physician Managing Ongoing Diabetes Care (CMS142v10)|
|[CMS347FHIR](input/resources/measure/FHIR347.json)|Statin Therapy for the Prevention and Treatment of Cardiovascular Disease (CMS347v5)|
|[CMS506FHIR](input/resources/measure/SafeUseofOpioidsConcurrentPrescribingFHIR.json)|Safe Use of Opioids - Concurrent Prescribing (CMS506v4)|
|[CMS529FHIR](input/resources/measure/HybridHWRFHIR.json)|Admissions and Readmissions to Hospitals (CMS529v2)|
|[CMS816FHIR](input/resources/measure/HospitalHarmSevereHypoglycemiaFHIR.json)|Hospital Harm - Severe Hypoglycemia (CMS816v1)|
|[CMS844FHIR](input/resources/measure/HybridHWMFHIR.json)|Risk Adjusted Mortality (CMS844v2)|
|[CMS871FHIR](input/resources/measure/HospitalHarmHyperglycemiainHospitalizedPatientsFHIR.json)|Hospital Harm - Severe Hyperglycemia (CMS871v1)|

## Repository Structure
It is setup like any HL7 FHIR IG project but also includes the CQL files and test data which means the file structure will be as follows:

```
   |-- _genonce.bat
   |-- _genonce.sh
   |-- _refresh.bat
   |-- _refresh.sh
   |-- _updatePublisher.bat
   |-- _updatePublisher.sh
   |-- _updateCQFTooling.bat
   |-- _updateCQFTooling.sh
   |-- ig.ini
   |-- bundles
       |-- mat
           |--<mat export bundles>
       |-- measure
           |--EXM124
   |-- input
       |-- ecqm-content-r4-2021.xml
       |-- cql
           |-- EXM124.cql
       |-- resources
           |-- library
               |-- EXM124.json
           |-- measure
               |-- EXM124.json
       |-- tests
           |-- measure
               |-- EXM124
       |-- vocabulary
           |-- valueset
```

## Refresh IG Processing

The CQF Tooling provides support for refreshing measure and library resources based on
the content of the CQL libraries, as well as packaging the measures as artifacts that
include dependencies and test cases.

To run this tooling, make sure it is available locally using the _updateCQFTooling script,
then run the _refresh script. This script should be run whenever CQL content changes,
and prior to the publishing process.

## Extracting MAT Packages

The CQF Tooling provides support for extracting a MAT exported package into the
directories of this repository so that the measure is included in the published
implementation guide. To do this, place the MAT export files (unzipped) in a
directory in the `bundles\mat` directory, and then run the following tooling
command:

```
[tooling-jar] -ExtractMatBundle bundles\mat\[bundle-directory]\[bundle-file]
```

For example:

```
input-cache\tooling-1.3.1-SNAPSHOT-jar-with-dependencies.jar -ExtractMATBundle bundles\mat\CLONE124_v6_03-Artifacts\measure-json-bundle.json
```

Then run the `_refresh` command to refresh the implementation guide content with
the new content, and then run `_genonce` to publish the implementation guide.
