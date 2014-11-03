#include <QApplication>
#include <QQmlApplicationEngine>
#include <QUrl>
#include <QtGui>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    app.setWindowIcon(QIcon("qrc:///resources/icon16.png"));


    return app.exec();
}
