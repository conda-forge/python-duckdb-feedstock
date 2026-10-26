@echo on

set "CL=%CL% /bigobj"

%PYTHON% -m pip install --no-deps --no-build-isolation -vv .
if %ERRORLEVEL% neq 0 exit 1
