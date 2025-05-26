/*
 *   Copyright 2016 David Edmundson <davidedmundson@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2

// Plasma 6: update imports
import org.kde.plasma.core 6.0 as PlasmaCore
import org.kde.plasma.components 6.0 as PlasmaComponents

ColumnLayout {
    Label {
        text: Qt.formatTime(timeSource.data["Local"]["DateTime"])
        font.pointSize: 44
        font.weight: Font.Light
        Layout.alignment: Qt.AlignHCenter
        renderType: Text.QtRendering
    }
    Label {
        text: Qt.formatDate(timeSource.data["Local"]["DateTime"], Qt.DefaultLocaleLongDate)
        font.pointSize: 20
        font.weight: Font.Light
        Layout.alignment: Qt.AlignHCenter
    }
    DataSource {
        id: timeSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 1000
    }
}
