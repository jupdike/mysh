#!/bin/sh
for d in ./*/ ; do (cd "$d" && echo "$d" && cloc --vcs git); done > ~/cloctotals.txt
node ~/bin/collate-cloc.js ~/cloctotals.txt "C#" "Razor" "CSS" "TypeScript" "JavaScript" "XML" "HTML" "JSON" "Visual Studio Solution" "YAML" "XAML" "MSBuild script" "PowerShell" "SQL"
echo "Localization_en-US.txt"
cat ./TheBrainNetCore/TheBrainNetCore/Resources/Localization_Vulcan_en-US.txt ./TheBrainNetCore/TheBrainNetCore/Resources/Localization_Mobile_en-US.txt ./TheBrainNetCore/TheBrainNetCore/Resources/Localization_en-US.txt | wc -l
