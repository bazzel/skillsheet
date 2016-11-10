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
                _ =
                    Debug.log "lang" language
            in
                employees ! []

        HandleResponseSuccess newEmployees ->
            ( newEmployees, Cmd.none )

        HandleResponseError error ->
            let
                _ =
                    Debug.log "error" error
            in
                employees ! []
