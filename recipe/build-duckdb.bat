@echo on

%PYTHON% -m pip install tools/pythonpkg -vv
if %ERRORLEVEL% neq 0 exit 1
