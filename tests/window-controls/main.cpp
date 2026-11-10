#include <QtQuickTest/quicktest.h>
#include <QQuickStyle>
int main(int argc, char **argv) {
    QQuickStyle::setStyle(QStringLiteral("Basic"));
    return quick_test_main(argc, argv, "music_window", QUICK_TEST_SOURCE_DIR);
}
