/* Fuoten - ownCloud/Nextcloud News App Client
 * Copyright (C) 2016 Buschtrommel/Matthias Fehring
 * https://www.buschmann23.de/entwicklung/anwendungen/fuoten/
 * https://github.com/Buschtrommel/Fuoten
 *
 * sailfishos/qml/common/pages/About.qml
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
import Sailfish.Silica 1.0
import de.huessenbergnetz.hbnsc 1.0
import "../models"

AboutPage {
    //% "About"
    pageTitle: qsTrId("id-about")

    appTitle: "Fuoten"
    //% "Client for the ownCloud/Nextcloud News App."
    appDescription: qsTrId("about-desc")
    appHomepage: "https://github.com/Huessenbergnetz/Fuoten"
    appCopyrightYear: "2016-2018"
    appCopyrightHolder: "Matthias Fehring"
    appLicense: "GNU General Public License, Version 3"
    appLicenseFile: "GPLv3.qml"

    changelogModel: ChangelogModel {}
    bugTrackerBaseUrl: "https://github.com/Huessenbergnetz/Fuoten/issues/"

    contributorsModel: ContributorsModel {}
    contributorsAvatarBasePath: "/usr/share/harbour-fuoten/images/contributors"

    contactCompany: "Hüssenbergnetz"
    contactName: "Matthias Fehring"
    contactStreet: "Zum Südholz"
    contactHouseNo: "8"
    contactZIP: "34439"
    contactCity: "Willebadessen-Eissen"
    //% "Germany"
    contactCountry: qsTrId("id-germany")
    contactEmail: Qt.atob("a29udGFrdEBodWVzc2VuYmVyZ25ldHouZGU=")
    contactWebsite: "www.huessenbergnetz.de"
    contactWebsiteLink: "https://www.huessenbergnetz.de/?pk_campaign=Sailfish-App-Fuoten&pk_kwd=AboutPage"

    bugUrl: "https://github.com/Huessenbergnetz/Fuoten/issues"
    translateUrl: "https://www.transifex.com/huessenbergnetz/fuoten"

    licensesModel: LicensesModel {}

    privacyPolicyQmlFile: Qt.resolvedUrl("PrivacyPolicy.qml")
}

