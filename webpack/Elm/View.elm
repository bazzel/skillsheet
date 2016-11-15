module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.App exposing (..)
import Material.Layout as Layout
import Models exposing (..)
import Messages exposing (Msg(..))
import Employees.List
import Employees.Show
import Routing exposing (Route(..))
import Tabs exposing (..)


view : Model -> Html Msg
view model =
    Layout.render Mdl
        model.mdl
        [ Layout.scrolling
        , Layout.selectedTab model.selectedTab
        , Layout.onSelectTab SelectTab
        ]
        { header = [ h1 [ style [ ( "padding", "2rem" ) ] ] [ text "Skillsheet" ] ]
        , drawer = []
        , tabs = ( tabTitles, [] )
        , main = [ page model ]
        }


page : Model -> Html Msg
page model =
    case model.route of
        EmployeesRoute ->
            Html.App.map EmployeesMsg (Employees.List.view model.employees)

        EmployeeRoute id ->
            employeeShowPage model

        SkillsRoute ->
            skillsView

        NotFoundRoute ->
            notFoundView


employeeShowPage : Model -> Html Msg
employeeShowPage model =
    case model.currentEmployee of
        Just employee ->
            Html.App.map EmployeesMsg (Employees.Show.view employee model.employeeFilter)

        Nothing ->
            notFoundView


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found" ]


skillsView : Html Msg
skillsView =
    div []
        [ text "Coming soon..." ]
