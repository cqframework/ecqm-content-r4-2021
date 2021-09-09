#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-1.3.1-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
mat_bundle=/Users/bryantaustin/Projects/ecqm-content-r4-2021/bundles/mat/CMS125FHIR-v0-0-009-FHIR-4-0-1/CMS125FHIR-v0-0-009-FHIR-4-0-1.json

set -e

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	echo Extracting bundle $mat_bundle
	java -jar $tooling -ExtractMatBundle $mat_bundle

else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling -ExtractMatBundle $mat_bundle
	else
		echo cqf Tooling jar NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
