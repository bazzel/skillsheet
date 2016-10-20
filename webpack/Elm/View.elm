module View exposing (..)

import Html exposing (..)
import Models exposing (..)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ ul []
            (List.map employeeListItemView model.employees)
        ]


employeeListItemView : Employee -> Html Msg
employeeListItemView employee =
    li [] [ text employee.name ]
