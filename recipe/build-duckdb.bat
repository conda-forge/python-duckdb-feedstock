@echo on

set OVERRIDE_GIT_DESCRIBE=v%PKG_VERSION%-0-g2063dda

%PYTHON% -m pip install tools/pythonpkg -vv
if %ERRORLEVEL% neq 0 exit 1
