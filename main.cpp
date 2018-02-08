#include <QGuiApplication>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView viewer;
    viewer.setSource(QUrl("qrc:///main.qml"));
    viewer.setMinimumSize(QSize(720, 480));
    viewer.show();

    return app.exec();
}
