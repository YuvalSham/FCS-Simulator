import QtQuick

Item {
    id:vertical_column

    Item{
        id:vertical_L_column_space

        width: main.width/2
        height: main.height
        x:0
        opacity: 0.7

        MouseArea{
            anchors.fill: parent
            onClicked:
                console.log("Left panel been clicked")
        }

        Column{
            id: column_left

            PropertyAnimation on x{
                to: - 200
                duration: 1000
            }

            topPadding: main.height/5
            leftPadding: -10
            spacing: main.height/10

            MButton{
                id: vertical_Lbutton_one
                button_name: "Index"

            }
            MButton{
                id: vertical_Lbutton_two
                button_name: "Mode"

            }
            MButton{
                id: vertical_Lbutton_three
                button_name: "Maps"

            }
            MButton{
                id: vertical_Lbutton_tree
                button_name: "Set Range"

            }
        }
    }




    Item{
        id: vertical_R_column_space
        width: main.width/2
        height: main.height
        x: main.width / 2
        opacity:0.8

        MouseArea{
            anchors.fill: parent
            onClicked:
                console.log("Right panel been clicked")
        }

        Column{
            id: column_right

            x: parent.width - vertical_Rbutton_one.width + 10 // Increase by 10 because of right padding conflict
            topPadding: main.height/5
            spacing: main.height/10

            PropertyAnimation on x{
                to: main.width-965
                duration: 1000
            }

            MButton{
                id: vertical_Rbutton_one
                button_name: "Camera"
            }
            MButton{
                id: vertical_Rbutton_two
                button_name: "FOV"
            }
            MButton{
                id: vertical_Rbutton_three
                button_name: "Functions"
            }
            MButton{
                id: vertical_Rbutton_tree
                button_name: "Reticale"
            }
        }
    }

}
