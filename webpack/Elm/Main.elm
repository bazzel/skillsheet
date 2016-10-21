module Main exposing (..)

import Navigation
import Models exposing (Model, initialModel)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update)
import Employees.Commands exposing (fetchAll)
import Routing exposing (Route)


main : Program Flags
main =
    Navigation.programWithFlags Routing.parser
        { init = init
        , subscriptions = subscriptions
        , update = update
        , urlUpdate = urlUpdate
        , view = view
        }


type alias Flags =
    { employeesUrl : String }


init : Flags -> Result String Route -> ( Model, Cmd Msg )
init flags result =
    let
        currentRoute =
            Routing.routeFromResult result
    in
        ( initialModel currentRoute
        , Cmd.map EmployeesMsg (fetchAll flags.employeesUrl)
        )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


urlUpdate : Result String Route -> Model -> ( Model, Cmd Msg )
urlUpdate result model =
    let
        currentRoute =
            Routing.routeFromResult result
    in
        ( { model | route = currentRoute }, Cmd.none )
