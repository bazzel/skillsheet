module Employees.Show exposing (..)

import Html exposing (..)
import Material.Grid exposing (..)
import Material.Color as Color
import Material.Card as Card
import Material.Options as Options exposing (css, cs)
import Material.Elevation as Elevation
import Markdown
import Employees.Models exposing (..)
import Employees.Messages exposing (Msg(..))


view : Employee -> Html Msg
view employee =
    grid []
        [ cell [ size All 12 ]
            [ h3 [] [ text employee.name ]
            ]
        , cell [ size All 3 ]
            [ cardView employee ]
        , cell [ size All 9 ]
            [ h4 [] [ text "table" ]
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
