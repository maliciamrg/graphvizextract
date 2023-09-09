@echo off
set /p Input=Enter node name:

SET /A rndNum=000
FOR %%Y IN ("%rndNum%_*.*") DO DEL /Q /F "tmp/%%~Y"

echo "--making loop--"
CALL gvpr -f subGraph.gvpr BigFullGlobalpicture.dot -a %Input% > tmp/%rndNum%_subgraph_%Input%.dot

echo "--create png--"
dot -Tpng tmp/%rndNum%_subgraph_%Input%.dot > impactOutput_%Input%.png

echo "--open png--"
start impactOutput_%Input%%.png

pause
//tvs-tva-data-model-jaxb,tvs-anpr-plugins