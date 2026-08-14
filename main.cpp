#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QPermissions>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // בקשת הרשאה למצלמה בזמן עליית האפליקציה
    QCameraPermission cameraPermission;
    switch (app.checkPermission(cameraPermission)) {
    case Qt::PermissionStatus::Undetermined:
        app.requestPermission(cameraPermission, [&app](const QPermission &permission) {
            if (permission.status() == Qt::PermissionStatus::Granted) {
                qDebug() << "Camera permission granted!";
            } else {
                qDebug() << "Camera permission denied!";
            }
        });
        break;
    case Qt::PermissionStatus::Denied:
        qDebug() << "Camera permission previously denied.";
        break;
    case Qt::PermissionStatus::Granted:
        qDebug() << "Camera permission already granted.";
        break;
    }

    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("myGUI", "Main");

    return app.exec();
}
