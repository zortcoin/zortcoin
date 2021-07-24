// Copyright (c) 2009-2016 The Zortcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef ZORTCOIn_QT_TEST_COMPATTESTS_H
#define ZORTCOIn_QT_TEST_COMPATTESTS_H

#include <QObject>
#include <QTest>

class CompatTests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void bswapTests();
};

#endif // ZORTCOIn_QT_TEST_COMPATTESTS_H
