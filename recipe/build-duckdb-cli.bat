@echo on

cmake %CMAKE_ARGS% -DCMAKE_BUILD_TYPE=Release ^
    -DENABLE_EXTENSION_AUTOLOADING=1 ^
    -DENABLE_EXTENSION_AUTOINSTALL=1 ^
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --config Release --parallel
if %ERRORLEVEL% neq 0 exit 1


copy Release\duckdb.exe %PREFIX%\Library\bin
if errorlevel 1 exit 1

copy src\Release\duckdb.dll %PREFIX%\Library\bin
if errorlevel 1 exit 1