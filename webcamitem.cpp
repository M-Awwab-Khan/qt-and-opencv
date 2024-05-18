#include "webcamitem.h"
#include <QPainter>
#include <QDebug>

WebcamItem::WebcamItem(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    // Open the default webcam
    if (!cap.open(0)) {
        qWarning() << "Failed to open webcam.";
    }

    // Set up a timer to capture frames periodically
    connect(&timer, &QTimer::timeout, this, &WebcamItem::captureFrame);
    timer.start(30); // 30 ms interval ~ 33 FPS
}

WebcamItem::~WebcamItem()
{
    cap.release();
}

void WebcamItem::captureFrame()
{
    if (cap.isOpened()) {
        cap >> frame;
        if (!frame.empty()) {
            // Convert to QImage
            cv::cvtColor(frame, frame, cv::COLOR_BGR2RGB);
            qtImage = QImage(frame.data, frame.cols, frame.rows, frame.step, QImage::Format_RGB888);
            update(); // Request a repaint
        }
    }
}

void WebcamItem::paint(QPainter *painter)
{
    if (!qtImage.isNull()) {
        QRectF boundingRect = contentsBoundingRect();
        painter->drawImage(boundingRect, qtImage);
    }
}
