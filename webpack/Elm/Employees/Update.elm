module Employees.Update exposing (..)

import Employees.Models exposing (Employee)
import Employees.Messages exposing (Msg(..))


update : Msg -> List Employee -> ( List Employee, Cmd Msg )
update msg employees =
    case msg of
        HandleResponseSuccess newEmployees ->
            ( newEmployees, Cmd.none )

        HandleResponseError error ->
            let
                _ =
                    Debug.log "error" error
            in
                employees ! []
