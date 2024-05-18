QT += quick

SOURCES += \
        main.cpp \
        webcamitem.cpp

resources.files = main.qml 
resources.prefix = /$${TARGET}
RESOURCES += resources

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -LD:/opencv/opencv/build/x64/vc16/lib/ -lopencv_world490
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/opencv/opencv/build/x64/vc16/lib/ -lopencv_world490d

INCLUDEPATH += D:/opencv/opencv/build/include
DEPENDPATH += D:/opencv/opencv/build/include

DISTFILES += \
    ../qtopencv/dog.jpg

HEADERS += \
    webcamitem.h
