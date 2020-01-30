# qt-static-msvc

Automatic travis-ci builds of minimal **static** version of Qt5 for Windows (for MSVC2017). This allows to build
statically-linked binaries which do not require Qt's (or anybody else's) DLLs.

## How to use it in Cmake-based Qt project for Windows static builds

1. The usual Qt stuff in your CMakeLists.txt: 
```CMake
find_package(Qt5 COMPONENTS Widgets Core REQUIRED)
target_link_libraries(**YOUR_TARGET_NAME_HERE** PRIVATE Qt5::Widgets)
```

2. "/MT" at the top of CMakeLists.txt

  To make your build static, add to the **top** of your CMakeLists.txt (before `add_executable()` or other targets):

```CMake
if (MSVC)
    # /MT means include msvcrt as static library in the .exe
    add_compile_options(/MT)
endif()
```

 In CMake version 3.15 or later you might consider [MSVC_RUNTIME_LIBRARY](https://cmake.org/cmake/help/latest/prop_tgt/MSVC_RUNTIME_LIBRARY.html#prop_tgt:MSVC_RUNTIME_LIBRARY) instead.

3. /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT for each target in CMakeLists.txt:

Add for each of your targets:

```CMake
if (MSVC)
	target_link_options(**YOUR_TARGET_NAME_HERE** PRIVATE /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT)
end()
```

4. (optional) to make sure that your program does not open a console window:

```CMake
set_target_properties(**YOUR_TARGET_NAME_HERE** PROPERTIES WIN32_EXECUTABLE YES)
```

5. Upack the archive downloaded from [releases](https://github.com/ashutosh108/qt-static-msvc/releases)

```
mkdir C:\Qt
cd /d C:\Qt
7z x qt5.14-static-msvc2017-minimal.zip
```

This should create `C:\Qt\5.14-static-msvc` directory

6. While running CMake, provide appropriate value for Qt5_DIR, e.g.

```
(in your source dir)
mkdir build
cd build
cmake .. -DQt5_DIR=C:\Qt\5.14-static-msvc\lib\cmake\Qt5
cmake --build .
```

There you have it: your program linked statically with Qt5.14, even when you use CMake, Windows and MSVC.

Anton Voloshin
