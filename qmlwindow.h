#include <QtCore/QObject>
#include <QMainWindow>

#ifndef TESTTT
#define TESTTT

class SimpleListModel;
class QDeclarativeView;

class QmlWindow : public QMainWindow
{
    Q_OBJECT

public:
    QmlWindow(QWidget *parent = 0);
    virtual ~QmlWindow() {}
private:
    QDeclarativeView *view;
};

#endif
