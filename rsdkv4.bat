winget install git.git
winget install cmake
if not exist vcpkg (
	git clone https://github.com/microsoft/vcpkg
	call .\vcpkg\bootstrap-vcpkg.bat
)
vcpkg\vcpkg.exe install glew sdl2 libogg glfw3 libtheora libvorbis --triplet=x64-windows-static
if exist RSDKv4-Decompilation (
	cd RSDKv4-Decompilation
	git submodule update --init --recursive
	cd ..\
) else (git clone --recursive https://github.com/RSDKModding/RSDKv4-Decompilation)
xcopy "%~dp0vcpkg" "%~dp0RSDKv4-Decompilation\vcpkg" /E /H /C /I
@echo off
echo.
echo Press any key to exit . . .
pause>nul
