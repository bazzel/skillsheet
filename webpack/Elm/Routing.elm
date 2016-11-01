module Routing exposing (..)

import String
import Navigation
import UrlParser exposing (..)
import Employees.Models exposing (EmployeeId)


type Route
    = EmployeesRoute
    | EmployeeRoute EmployeeId
    | SkillsRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ format EmployeesRoute (s "")
        , format EmployeeRoute (s "employees" </> int)
        , format EmployeesRoute (s "employees")
        , format SkillsRoute (s "skills")
        ]


hashParser : Navigation.Location -> Result String Route
hashParser location =
    location.hash
        |> String.dropLeft 1
        |> parse identity matchers


parser : Navigation.Parser (Result String Route)
parser =
    Navigation.makeParser hashParser


routeFromResult : Result String Route -> Route
routeFromResult result =
    case result of
        Ok route ->
            route

        Err string ->
            NotFoundRoute
