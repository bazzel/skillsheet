module Employees.Update exposing (..)

import Employees.Models exposing (Employee)
import Employees.Messages exposing (Msg(..))
import Navigation


update : Msg -> List Employee -> ( List Employee, Cmd Msg )
update msg employees =
    case msg of
        ShowEmployee id ->
            ( employees, Navigation.newUrl ("#employees/" ++ (toString id)) )

        FilterLanguage language employee ->
            let
                hasLanguage skill =
                    List.member language skill.languages

                skillsWithLanguage =
                    List.filter hasLanguage employee.skills

                updatedEmployee =
                    { employee | skills = skillsWithLanguage }

                x updated employee =
                    if employee.id == updated.id then
                        updated
                    else
                        employee

                updatedEmployees =
                    List.map (x updatedEmployee) employees
            in
                updatedEmployees ! []

        HandleResponseSuccess newEmployees ->
            ( newEmployees, Cmd.none )

        HandleResponseError error ->
            let
                _ =
                    Debug.log "error" error
            in
                employees ! []
