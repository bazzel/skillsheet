module Main exposing (..)

import Html.App as App exposing (..)
import Task exposing (Task)
import Http
import Json.Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (..)
import Models exposing (..)
import Messages exposing (..)
import View exposing (..)
import Update exposing (..)


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
    ( initialModel, fetch flags.employeesUrl )


initialModel : Model
initialModel =
    { employees = [] }


fetch : String -> Cmd Msg
fetch url =
    let
        task =
            Http.get responseDecoder url
    in
        task |> Task.perform HandleResponseError HandleResponseSuccess


responseDecoder : Decoder (List Employee)
responseDecoder =
    Json.Decode.at [ "employees" ] (Json.Decode.list employeeDecoder)


employeeDecoder : Decoder Employee
employeeDecoder =
    decode Employee
        |> required "id" Json.Decode.int
        |> required "full_name" Json.Decode.string


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
