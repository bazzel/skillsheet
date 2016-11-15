module Employees.Update exposing (..)

import Employees.Models exposing (Employee)
import Employees.Messages exposing (Msg(..))
import Navigation


update : Msg -> List Employee -> ( List Employee, Maybe Employee, Cmd Msg )
update msg employees =
    case msg of
        ShowEmployee id ->
            let
                maybeEmployee =
                    employees
                        |> List.filter (\employee -> employee.id == id)
                        |> List.head
            in
                ( employees, maybeEmployee, Navigation.newUrl ("#employees/" ++ (toString id)) )

        FilterLanguage language id ->
            let
                maybeEmployee =
                    employees
                        |> List.filter (\employee -> employee.id == id)
                        |> List.head

                employee =
                    case maybeEmployee of
                        Just employee ->
                            Just (employee |> filterOnLanguage language)

                        Nothing ->
                            Nothing
            in
                ( employees, employee, Cmd.none )

        HandleResponseSuccess newEmployees ->
            ( newEmployees, Nothing, Cmd.none )

        HandleResponseError error ->
            let
                _ =
                    Debug.log "error" error
            in
                ( employees, Nothing, Cmd.none )


filterOnLanguage : String -> Employee -> Employee
filterOnLanguage language employee =
    let
        hasLanguage skill =
            List.member language skill.languages

        skillsWithLanguage =
            List.filter hasLanguage employee.skills
    in
        { employee | skills = skillsWithLanguage }
