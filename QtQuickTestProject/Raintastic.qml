import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
import QtMultimedia 5.0
import QtGraphicalEffects 1.0
import "../Source/Scripts/RainQuotes.js" as Quotes

ApplicationWindow {
    title: qsTr("Raintastic")
    width: Screen.width
    height: Screen.height
    id : main
    visible : true
    Text {
        id: textUp

        text: qsTr("Now, Just relax...")
        z : 99999
        font.pixelSize: 90
        font.family: "Ubuntu"
        color : "white"
        x : (textUp.width/2)


        NumberAnimation on y
        {
            from : 400
            to : -100
            running : true
            duration : 2000

        }

        NumberAnimation on opacity {
            duration: 1800
            from : 1.0
            to : 0.0
        }
    }
    Audio
    {
        id : sound
        source: "../Source/Resources/Media/rain.ogv"
        autoLoad: true
        autoPlay: true
        property bool isPlaying: true
        onStatusChanged:
        {
            sound.play();
        }
    }

    Rectangle
    {
        anchors.fill: parent

        Image
        {
            source: "../Source/Resources/Bitmap/fiber.jpeg"
        }

        Flickable{
            width : 300
            height: slidePanelColumn.height
            contentHeight: slidePanelColumn.height
            contentWidth: slidePanelColumn.width
            interactive: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.DragOverBounds
        Column
        {
            id : slidePanelColumn

            y : 20
            spacing : 10

            Image
            {
                id: playPauseControl
                source: "../Source/Resources/Control/media-pause.png"
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        if(sound.isPlaying === true)
                        {
                            sound.pause()
                            parent.source = "../Source/Resources/Control/media-play.png"
                            sound.isPlaying = false
                        }
                        else
                        {
                            sound.play()
                            parent.source = "../Source/Resources/Control/media-pause.png"
                            sound.isPlaying = true
                        }
                    }
                }
            }



            Row
            {
            spacing: 5

                Image
                {
                    id: volumeIcon
                    source: "../Source/Resources/Control/player-volume.png"
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            if(volumeController.value != 0)
                            {
                                volumeController.value = 0;
                                volumeIcon.source = "../Source/Resources/Control/player-volume-muted.png";
                            }
                            else
                            {
                                volumeController.value = 1;
                                volumeIcon.source = "../Source/Resources/Control/player-volume.png";
                            }
                        }
                    }
                }


            Slider
            {
                id : volumeController
                property int lastValue : value
                maximumValue: 1
                minimumValue: 0
                value: sound.volume
                y : (volumeIcon.height / 2) - (volumeController.height /2)
                onValueChanged:
                {
                    sound.volume = value
                    volumeController.lastValue = value
                }
            }
        }

            Image
            {
                id: refreshButton
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../Source/Resources/Control/refresh.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        quoteText.text = Quotes.getQuote()
                    }
                }
            }

            Text
            {
                id : quoteText
                color : "white"
                font.pixelSize: 18
                text: Quotes.getQuote()
                wrapMode: Text.WordWrap
                x : 10
                width : 250
                height : 100



            }

            Image
            {
                id: closeButton
                anchors.horizontalCenter: parent.horizontalCenter

                source: "../Source/Resources/Control/program-shutdown.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        Qt.quit()
                    }
                }
            }

            Text
            {
                id: descriptionTest
                x : 10
                text: qsTr("because rain makes everything better, Raintastic is a simple app \
to relax while listening to rain sound.")
                width : 250
                wrapMode: Text.WordWrap
                color : "white"
                font.pixelSize: 11
            }

        }

    }
        Image
        {
            id: background
            source: "../Source/Resources/Bitmap/background.jpg"
            width : parent.width
            height : parent.height
            property bool slided: false
            Image {
                id: shadow
                source: "../Source/Resources/Bitmap/shadow.png"
                anchors.right: parent.left
            }
            Behavior on x
            {
                NumberAnimation
                {
                    duration : 200
                    easing.type : Easing.Linear
                }
            }

           /* DropShadow
            {
                //This drop shadow was replaced with bitmap image

                anchors.fill: background
                source: background
                horizontalOffset: -40
                verticalOffset: 0
                radius: 40
                samples: 39
                color: "#000000"
                transparentBorder: true
                spread: 0.0
                z: -1
            }*/

        }

        Image
        {
            id: settingsIcon
            source: "../Source/Resources/Control/program-settings.png"
            x : 10
            y : 10
            Behavior on x
            {
                NumberAnimation{
                    duration : 200
                    easing.type: Easing.Linear
                }
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    if(background.slided === false)
                    {
                        background.x += 300;
                        parent.x += 300;
                        background.slided = true;
                    }
                    else if(background.slided === true)
                    {
                        background.x -= 300;
                        parent.x -= 300;
                        background.slided = false;
                    }
                }
            }
        }
    }
}
