module Main exposing (..)

import Html exposing (..)
import Html.App as App exposing (..)


main : Program Flags
main =
    App.programWithFlags
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


type alias Flags =
    { employeesUrl : String }


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        _ =
            Debug.log "flags" flags
    in
        model ! []


model : Model
model =
    ""


type alias Model =
    String


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    text "Hoi"
