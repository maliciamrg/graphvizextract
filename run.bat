@echo on
set /p Input=Enter nodes names separate by  , :

SET /A rndNum=%RANDOM% * 100 / 32768 + 1
FOR %%Y IN ("%rndNum%_*.*") DO DEL /Q /F "tmp/%%~Y"

echo "--making loop--"
for %%x in (%Input%) do (
	echo %%x
	CALL gvpr -f subGraph.gvpr BigFullGlobalpicture.dot -a %%x > tmp/%rndNum%_subgraph_%%x.dot
)

echo "--merging dot--"
cd tmp
echo digraph gvpr_result { > "%rndNum%_impactOutput.dot"
type "%rndNum%_subgraph_*.dot" | findstr /v \/\/ | findstr /v "}" | findstr /v "{" >> "%rndNum%_impactOutput.dot"
echo } >> "%rndNum%_impactOutput.dot"
cd ..

echo "--create png--"
dot -Tpng tmp/%rndNum%_impactOutput.dot > impactOutput_%Input:,=_%.png

echo "--open png--"
start impactOutput_%Input:,=_%.png

pause
//tvs-tva-data-model-jaxb,tvs-anpr-plugins,tvs-data-model-jaxb