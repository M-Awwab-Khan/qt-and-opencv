#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "webcamitem.h"


int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);
    // QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    qmlRegisterType<WebcamItem>("Webcam", 1, 0, "WebcamItem");

    const QUrl url(QStringLiteral("qrc:/qtandopencv/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
