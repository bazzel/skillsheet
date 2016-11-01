module Employees.Show exposing (..)

import Html exposing (..)
import Material.Grid exposing (..)
import Employees.Models exposing (..)
import Employees.Messages exposing (Msg(..))


view : Employee -> Html Msg
view employee =
    grid []
        [ cell [ size All 12 ]
            [ h3 [] [ text employee.name ]
            ]
        ]
