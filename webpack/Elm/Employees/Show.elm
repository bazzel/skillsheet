module Employees.Show exposing (..)

import Html exposing (..)
import Employees.Models exposing (..)
import Employees.Messages exposing (Msg(..))


view : Employee -> Html Msg
view employee =
    div [] [ text employee.name ]
