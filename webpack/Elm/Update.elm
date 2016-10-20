module Update exposing (..)

import Models exposing (..)
import Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HandleResponseSuccess employees ->
            ( { model | employees = employees }, Cmd.none )

        HandleResponseError error ->
            let
                _ =
                    Debug.log "error" error
            in
                model ! []

        NoOp ->
            model ! []
