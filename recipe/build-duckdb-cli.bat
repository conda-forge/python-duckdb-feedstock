@echo on

python scripts/windows_ci.py


del /s /q build
mkdir build
cd build
mkdir release
cd release
cmake %CMAKE_ARGS% -DCMAKE_BUILD_TYPE=Release ^
    -G Ninja ^
    -DENABLE_EXTENSION_AUTOLOADING=1 ^
    -DENABLE_EXTENSION_AUTOINSTALL=1 ^
    -DBUILD_SHELL=1 ^
    -DBUILD_EXTENSIONS="httpfs;json;icu;autocomplete" ^
    -DDUCKDB_EXTENSION_CONFIGS="./.github/config/bundled_extensions.cmake" ^
    -DBUILD_UNITTESTS=0 ^
    -DCMAKE_OBJECT_PATH_MAX=500 ^
    ../..
if %ERRORLEVEL% neq 0 exit 1


cmake --build . --config Release --parallel
if %ERRORLEVEL% neq 0 exit 1


copy .\duckdb.exe %PREFIX%\Library\bin
if errorlevel 1 exit 1

@REM copy .\src\duckdb.dll %PREFIX%\Library\bin
@REM if errorlevel 1 exit 1
