module Employees.Show exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Material.Grid exposing (..)
import Material.Color as Color
import Material.Card as Card
import Material.Options as Options exposing (css, cs)
import Material.Elevation as Elevation
import Markdown
import Employees.Models exposing (..)
import Employees.Messages exposing (Msg(..))


view : Employee -> EmployeeFilter -> Html Msg
view employee filter =
    grid []
        [ cell [ size All 12 ]
            [ h3 [] [ text employee.name ]
            ]
        , cell [ size All 3 ]
            [ cardView employee ]
        , cell [ size All 9 ]
            [ filterView filter employee
            , skillsView employee.skills
            ]
        ]


cardView : Employee -> Html Msg
cardView employee =
    Card.view
        [ Options.cs "employee-card"
        , Elevation.e2
        ]
        [ Card.title
            [ css "background" ("url(" ++ employee.image ++ ") center/cover")
            ]
            [ Card.head
                [ Color.text Color.white
                , Options.scrim 0.75
                ]
                [ text employee.name ]
            ]
        , Card.text
            []
            [ Markdown.toHtml [] employee.bio
            ]
        ]


skillsView : List Skill -> Html Msg
skillsView skills =
    ul []
        (List.map skillView skills)


skillView : Skill -> Html Msg
skillView skill =
    li []
        [ div [] [ text skill.technology ]
        , languagesView skill.languages
        ]


languagesView : List Language -> Html Msg
languagesView languages =
    ul [] (List.map languageView languages)


languageView : Language -> Html Msg
languageView language =
    li [] [ text language ]


filterView : EmployeeFilter -> Employee -> Html Msg
filterView filter employee =
    let
        view l =
            li [ onClick (FilterLanguage l employee) ] [ text l ]
    in
        ul [] (List.map view employee.languages)
