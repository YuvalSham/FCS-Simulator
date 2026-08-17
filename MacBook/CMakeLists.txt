cmake_minimum_required(VERSION 3.16)
set(CMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH "NO")
project(MFDU VERSION 2.0 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Multimedia)
qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appMFDU
    main.cpp
    images.qrc
    Info.plist
)
qt_import_plugins(appMFDU EXCLUDE Qt6::QFFmpegMediaPlugin)

set_source_files_properties(SystemConfig.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appMFDU
    URI myGUI
    QML_FILES
        Main.qml
        SystemConfig.qml
        ObjButton.qml
        VColumns.qml
        VideoCamera.qml
        MainScreen.qml
        Reticle.qml
        BRow.qml
)

set_target_properties(appMFDU PROPERTIES
    OUTPUT_NAME "MFDU"
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/Info.plist
    MACOSX_BUNDLE_GUI_IDENTIFIER com.yuval.mfdu
    MACOSX_BUNDLE_BUNDLE_NAME "MFDU"
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

target_link_libraries(appMFDU
    PRIVATE
        Qt6::Quick
        Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appMFDU
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)