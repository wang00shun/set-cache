set PACKAGE_FOLDER=D:\package

::nuget cache
set NUGET_FOLDER=%PACKAGE_FOLDER%\nuget
set NUGET_HTTP_CACHE_PATH=%NUGET_FOLDER%\http-cache
set NUGET_PACKAGES=%NUGET_FOLDER%\global-packages
set NUGET_PLUGINS_CACHE_PATH=%NUGET_FOLDER%\plugins-cache
md %NUGET_HTTP_CACHE_PATH%
md %NUGET_PACKAGES%
md %NUGET_PLUGINS_CACHE_PATH%
setx /m NUGET_HTTP_CACHE_PATH %NUGET_HTTP_CACHE_PATH%
setx /m NUGET_PACKAGES %NUGET_PACKAGES%
setx /m NUGET_PLUGINS_CACHE_PATH %NUGET_PLUGINS_CACHE_PATH%

::rust cache
set CARGO_HOME=%PACKAGE_FOLDER%\Rust\.cargo
set RUSTUP_HOME=%PACKAGE_FOLDER%\Rust\.rustup
set RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
set RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
md %CARGO_HOME%
md %RUSTUP_HOME%
setx /m CARGO_HOME %CARGO_HOME%
setx /m RUSTUP_HOME %RUSTUP_HOME%
setx /m RUSTUP_UPDATE_ROOT %RUSTUP_UPDATE_ROOT%
setx /m RUSTUP_DIST_SERVER %RUSTUP_DIST_SERVER%
setx /m PATH "%PATH%;%CARGO_HOME%\bin;"

::node cache
set NODE_GLOBAL=%PACKAGE_FOLDER%\node\node_global
set NODE_CACHE=%PACKAGE_FOLDER%\node\node_cache
set NODE_PATH=%NODE_GLOBAL%\node_modules
md %NODE_GLOBAL%
md %NODE_PATH%
md %NODE_CACHE%
call npm config set prefix %NODE_GLOBAL%
call npm config set cache %NODE_CACHE%
call npm config set registry https://registry.npm.taobao.org --global
call npm config set disturl Node.js Mirror --global
setx /m NODE_PATH %NODE_PATH%
setx /m PATH "%PATH%;%NODE_GLOBAL%;"

pause