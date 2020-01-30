git clone --branch 5.14 git://code.qt.io/qt/qt5.git
cd qt5
perl init-repository --module-subset=default,-qtwebengine --branch
mkdir ..\qt5-build-msvc2017-x86-static
cd ..\qt5-build-msvc2017-x86-static
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"
call ..\qt5\configure.bat -static -static-runtime -release -opensource -confirm-license -platform win32-msvc -mp -prefix C:\Qt\5.14-static-msvc\ -make libs -qt-freetype -no-sql-sqlite -qt-zlib -qt-libpng -qt-libjpeg -no-opengl -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcanvas3d -skip qtcharts -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc -skip qtgamepad -skip qtgraphicaleffects -skip qtimageformats -skip qtlocation -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth -skip qtpurchasing -skip qtquickcontrols -skip qtquickcontrols2 -skip qtremoteobjects -skip qtscript -skip qtscxml -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtsvg -skip qtspeech -skip qttools -skip qtvirtualkeyboard -skip qtwayland -skip qtwebchannel -skip qtwebsockets -skip qtwebview -skip qtwinextras -skip qtx11extras -skip qtxmlpatterns -skip qtwebengine -no-feature-concurrent -no-feature-xml -no-feature-testlib -no-feature-network -no-feature-sql -no-feature-dbus -no-feature-itemmodeltester -no-feature-sqlmodel -no-feature-sessionmanager -qpa windows
nmake
nmake install
cd ..
7z a qt5.14-static-msvc2017-minimal.zip C:/Qt/5.14*
