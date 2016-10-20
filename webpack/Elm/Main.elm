module Main exposing (..)

import Html exposing (..)
import Html.App as App exposing (..)
import Task exposing (Task)
import Http
import Json.Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (..)


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


type alias Model =
    { employees : List Employee }


type alias Employee =
    { id : Int
    , name : String
    }


type Msg
    = HandleResponseSuccess (List Employee)
    | HandleResponseError Http.Error
    | NoOp


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


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ ul []
            (List.map employeeListItemView model.employees)
        ]


employeeListItemView : Employee -> Html Msg
employeeListItemView employee =
    li [] [ text employee.name ]
