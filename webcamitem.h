#ifndef WEBCAMITEM_H
#define WEBCAMITEM_H

#include <QQuickPaintedItem>
#include <QTimer>
#include <QImage>
#include <opencv2/opencv.hpp>

class WebcamItem : public QQuickPaintedItem
{
    Q_OBJECT
public:
    explicit WebcamItem(QQuickItem *parent = nullptr);
    ~WebcamItem();

    void paint(QPainter *painter) override;

private slots:
    void captureFrame();

private:
    cv::VideoCapture cap;
    cv::Mat frame;
    QImage qtImage;
    QTimer timer;
};

#endif // WEBCAMITEM_H
