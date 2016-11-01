module Tabs exposing (..)

import Html exposing (..)
import Array exposing (..)


tabs : List ( String, String )
tabs =
    [ ( "Employees", "employees" ), ( "Skills", "skills" ) ]


tabTitles : List (Html a)
tabTitles =
    List.map (\( x, _ ) -> text x) tabs


tabUrls : Array String
tabUrls =
    List.map (\( _, x ) -> x) tabs |> Array.fromList
