cmake_minimum_required(VERSION 3.16)

project(MFDU VERSION 2.0 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Multimedia)
qt_standard_project_setup(REQUIRES 6.8)

# הגדרת קובץ האייקון עבור macOS
set(MACOSX_ICON ${CMAKE_CURRENT_SOURCE_DIR}/appIcon.icns)
set_source_files_properties(${MACOSX_ICON} PROPERTIES
    MACOSX_PACKAGE_LOCATION "Resources"
)

qt_add_executable(appMFDU
    main.cpp
    images.qrc
    Info.plist
    ${MACOSX_ICON}
)

set_source_files_properties(SystemConfig.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appMFDU
    URI myGUI
    QML_FILES
        Main.qml
        Background.qml
        SystemConfig.qml
        ObjButton.qml
        VColumns.qml
        VideoCamera.qml
        MainScreen.qml
        Reticle.qml
        BRow.qml
)

set_target_properties(appMFDU PROPERTIES
    OUTPUT_NAME "MFDU ver 2.0"
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/Info.plist
    MACOSX_BUNDLE_GUI_IDENTIFIER com.yuval.mfdu
    MACOSX_BUNDLE_BUNDLE_NAME "MFDU ver 2.0"
    MACOSX_BUNDLE_ICON_FILE "appIcon.icns"
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
