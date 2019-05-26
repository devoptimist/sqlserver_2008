$pkg_name="sqlserver_2008"
$pkg_origin="devoptimist"
$pkg_version="10.50.6000.34"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_license=@("SQL Server 2017 License")
$pkg_source="https://download.microsoft.com/download/c/2/8/c28cc7df-c9d2-453b-9292-ae7d242dfeca/SQLEXPR_x64_ENU.exe"
$pkg_shasum="f175ec1a1c7cc389b6c932c688104562d6b409b2fdf14a4d45080487b74201b6"
$pkg_bin_dirs=@("bin")
$pkg_deps=@("core/dotnet-35sp1-runtime", "core/dsc-core")
$pkg_exports=@{
  port="port"
  password="app_password"
  username="app_user"
  instance="instance"
}
$pkg_description = "Microsoft SQL Server"
$pkg_upstream_url="https://www.microsoft.com/en-us/sql-server/sql-server-editions-express"


function Invoke-Unpack {
  Start-Process "$HAB_CACHE_SRC_PATH/SQLEXPR_x64_ENU.exe" -Wait -ArgumentList "/extract: $HAB_CACHE_SRC_PATH/$pkg_dirname /quiet"
}

function Invoke-Install {
  Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_dirname/*" $pkg_prefix/bin -Recurse
}