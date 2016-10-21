module View exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Models exposing (..)
import Messages exposing (Msg(..))
import Employees.List
import Employees.Show
import Employees.Models exposing (..)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        EmployeesRoute ->
            Html.App.map EmployeesMsg (Employees.List.view model.employees)

        EmployeeRoute id ->
            employeeShowPage model id

        NotFoundRoute ->
            notFoundView


employeeShowPage : Model -> EmployeeId -> Html Msg
employeeShowPage model employeeId =
    div [] [ text "Hoi" ]


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found" ]
