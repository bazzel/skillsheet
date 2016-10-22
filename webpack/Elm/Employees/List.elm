module Employees.List exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Employees.Models exposing (..)
import Employees.Messages exposing (..)


view : List Employee -> Html Msg
view employees =
    div []
        [ ul []
            (List.map employeeListItemView employees)
        ]


employeeListItemView : Employee -> Html Msg
employeeListItemView employee =
    li [ onClick (ShowEmployee employee.id) ] [ text employee.name ]
