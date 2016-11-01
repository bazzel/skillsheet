module Employees.List exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Material.List as Lists
import Material.Options as Options
import Material.Grid exposing (..)
import Employees.Models exposing (..)
import Employees.Messages exposing (..)


view : List Employee -> Html Msg
view employees =
    grid []
        [ cell [ size All 12 ]
            [ h3 [] [ text "Employees" ]
            , Lists.ul []
                (List.map employeeListItemView employees)
            ]
        ]


employeeListItemView : Employee -> Html Msg
employeeListItemView employee =
    Lists.li []
        [ Lists.content
            [ Options.attribute <|
                Html.Events.onClick (ShowEmployee employee.id)
            ]
            [ text employee.name ]
        ]
