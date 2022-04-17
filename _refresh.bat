@ECHO OFF
IF "%1%"=="-h" GOTO printUsage
GOTO refresh

:printUsage
ECHO Refreshes FHIR documents in place. Optionally loads resources to a FHIR server.
ECHO   -d  Use default Alphora FHIR sandbox
ECHO   -h  Print this help
ECHO   -s  Use specificed fhir base url like http://localhost:8080/fhir/
GOTO exit0

:refresh
SET tooling_jar=tooling-1.4.1-SNAPSHOT-jar-with-dependencies.jar
SET input_cache_path=%~dp0input-cache
SET ig_resource_path=%~dp0input\ecqm-content-r4.xml

ECHO Checking internet connection...
PING tx.fhir.org -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET fsoption=
GOTO igpublish

:isonline
IF "%1%"=="-d" (
	SET fsoption=-fs=https://cloud.alphora.com/sandbox/r4/cqm/fhir/
	GOTO igpublish
)
IF "%1%"=="-s" (
	SET fsoption=-fs=%2%
	GOTO igpublish
)

SET fsoption=
GOTO igpublish

:igpublish
SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%tooling_jar%" (
	ECHO running: JAVA -jar "%input_cache_path%\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -t -d -p %fsoption% -rp input\cql
	JAVA -jar "%input_cache_path%\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -t -d -p %fsoption% -rp input\cql
) ELSE IF EXIST "..\%tooling_jar%" (
	ECHO running: JAVA -jar "..\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -t -d -p %fsoption%
	JAVA -jar "..\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -t -d -p %fsoption%
) ELSE (
	ECHO IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
)

PAUSE

:exit0
EXIT /b 0