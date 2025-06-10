[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%HOMEDRIVE%%HOMEPATH%\.config", "User")
[Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "%HOMEDRIVE%%HOMEPATH%\.cache", "User")
[Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "%HOMEDRIVE%%HOMEPATH%\.local\share", "User")
[Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "%HOMEDRIVE%%HOMEPATH%\.local\state", "User")
