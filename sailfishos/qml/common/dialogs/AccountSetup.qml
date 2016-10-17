/* Fuoten - ownCloud/Nextcloud News App Client
 * Copyright (C) 2016 Buschtrommel/Matthias Fehring
 * https://www.buschmann23.de/entwicklung/anwendungen/fuoten/
 * https://github.com/Buschtrommel/Fuoten
 *
 * sailfishos/qml/phone/pages/MainPage.qml
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0
import harbour.fuoten.generic 1.0

Dialog {
    id: accountDialog

    SilicaFlickable {
        id: accountFlick
        anchors.fill: parent
        contentHeight: accountGrid.height + dHeader.height

        DialogHeader {
            id: dHeader;
            //% "User account"
            title: qsTrId("id-user-account");
            dialog: accountDialog;
            flickable: accountFlick
        }

        VerticalScrollDecorator { flickable: accountFlick; page: accountDialog }

        GridLayout {
            id: accountGrid
            anchors { left: parent.left; right: parent.right; top: dHeader.bottom }

            columnSpacing: 0
            rowSpacing: Theme.paddingSmall

            columns: Screen.sizeCategory < Screen.Large ? (accountDialog.isLandscape ? 2 : 1) : (accountDialog.isLandscape ? 4 : 2)

            Item {
                Layout.columnSpan: accountGrid.columns
                Layout.fillWidth: true
                Layout.preferredHeight: infoText.height

                Text {
                    id: infoText
                    anchors { left: parent.left; right: parent.right; leftMargin: Theme.horizontalPageMargin; rightMargin: Theme.horizontalPageMargin }
                    wrapMode: Text.WordWrap
                    color: Theme.primaryColor
                    font.pixelSize: Theme.fontSizeExtraSmall
                    //% "Set up your user account by entering your user name, your password and the host address of the server your ownCloud/Nextcloud is running on. If your ownCloud/Nextcloud is installed in a subdirectory on your server, you have to enter the installation path as well. If your server uses an other port than the default port for HTTP(S), enter it in server port. If you use the standard ports or if you do not know what this is all about, keep the 0 at the server port."
                    text: qsTrId("id-account-setup-info")
                    textFormat: Text.PlainText
                }
            }

            TextField {
                id: username
                Layout.fillWidth: true
                //% "User name"
                label: qsTrId("id-user-name"); placeholderText: label
                EnterKey.enabled: text || inputMethodComposing
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: password.focus = true
                text: config.username
            }

            TextField {
                id: password
                Layout.fillWidth: true
                //% "Password"
                label: qsTrId("id-password"); placeholderText: label
                echoMode: TextInput.Password
                EnterKey.enabled: text || inputMethodComposing
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: host.focus = true
                text: config.password
            }

            TextField {
                id: host
                Layout.fillWidth: true
                //% "Host"
                label: qsTrId("id-host")
                //% "Host: e.g. cloud.example.com"
                placeholderText: qsTrId("id-host-placeholder")
                inputMethodHints: Qt.ImhUrlCharactersOnly
                EnterKey.enabled: text || inputMethodComposing
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: port.focus = true
                text: config.host
            }

            TextField {
                id: port
                Layout.fillWidth: true
                //% "Server port"
                label: qsTrId("id-server-port"); placeholderText: label
                inputMethodHints: Qt.ImhDigitsOnly
                validator: IntValidator { bottom: 0; top: 65536 }
                EnterKey.enabled: text || inputMethodComposing
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: installPath.focus = true
                text: config.serverPort
            }

            TextField {
                id: installPath
                Layout.fillWidth: true
                //% "Installation path"
                label: qsTrId("id-server-path"); placeholderText: label
                inputMethodHints: Qt.ImhUrlCharactersOnly
                EnterKey.iconSource: "image://theme/icon-m-enter-close"
                EnterKey.onClicked: installPath.focus = false
                text: config.installPath
            }

            Item {
                Layout.fillWidth: true
                Layout.columnSpan: Screen.sizeCategory < Screen.Large ? 1 : (accountDialog.isLandscape ? 3 : 1)
                height: 1
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: usessl.implicitHeight
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                TextSwitch {
                    id: usessl
                    //% "Use HTTPS (SSL/TLS) connection"
                    text: qsTrId("id-use-ssl-text")
                    //% "Because the News App requires to send your username and password with every request, you should keep this enabled to use an encrypted connection, when your server supports or even requires encryption."
                    description: qsTrId("id-use-ssl-desc")
                    checked: config.useSSL
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: ignoresslerrors.implicitHeight
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                TextSwitch {
                    id: ignoresslerrors
                    //% "Ignore SSL errors"
                    text: qsTrId("id-ignore-ssl-errs-text")
                    //% "Only ignore SSL errors when you really know what you are doing. Ignoring SSL errors is a big security risk."
                    description: qsTrId("id-ignore-ssl-errs-desc")
                    enabled: usessl.checked
                    checked: config.ignoreSSLErrors
                }
            }
        }
    }

    onDone: {
        if (result === DialogResult.Accepted) {
            config.username = username.text
            config.password = password.text
            config.host = host.text
            config.serverPort = port.text.length > 0 ? parseInt(port.text) : 0
            config.installPath = installPath.text
            config.useSSL = usessl.checked
            config.ignoreSSLErrors = ignoresslerrors.checked
        }
    }
}

