module View exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Models exposing (..)
import Messages exposing (Msg(..))
import Employees.List


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    Html.App.map EmployeesMsg (Employees.List.view model.employees)
