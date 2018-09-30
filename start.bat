@echo off

cd ./Web

if not "%~1"=="-v" (
  del build.js >nul 2>&1
  call build.bat >nul 2>&1
) ELSE (
  del build.js
  call build.bat
)

if EXIST "build.js" (
  call :Color A "Build Successful!"
) ELSE (
  call :Color C "Build Failed!"
  Exit /B
)

cd ../
node ./server/main.js
Exit /B

:Color
:: v20 deprecated.
:: Arguments: hexColor text [\n]
:: Supported in windows XP, 7, 8.
:: In XP extended ascii characters are printed as dots.
:: For print quotes, use empty text.
SetLocal EnableExtensions EnableDelayedExpansion
Set "Text=%~2"
If Not Defined Text (Set Text=^")
Subst `: "!Temp!" >Nul &`: &Cd \
If Not Exist `.7 (
Echo(|(Pause >Nul &Findstr "^" >`)
Set /P "=." >>` <Nul
For /F "delims=;" %%# In (
'"Prompt $H;&For %%_ In (_) Do Rem"') Do (
Set /P "=%%#%%#%%#" <Nul >`.3
Set /P "=%%#%%#%%#%%#%%#" <Nul >`.5
Set /P "=%%#%%#%%#%%#%%#%%#%%#" <Nul >`.7))
Set /P "LF=" <` &Set "LF=!LF:~0,1!"
For %%# in ("!LF!") Do For %%_ In (
\ / :) Do Set "Text=!Text:%%_=%%~#%%_%%~#!"
For /F delims^=^ eol^= %%# in ("!Text!") Do (
If #==#! SetLocal DisableDelayedExpansion
If \==%%# (Findstr /A:%~1 . \` Nul
Type `.3) Else If /==%%# (Findstr /A:%~1 . /.\` Nul
Type `.5) Else (Echo %%#\..\`>`.dat
Findstr /F:`.dat /A:%~1 .
Type `.7))
If "\n"=="%~3" (Echo()
Goto :Eof