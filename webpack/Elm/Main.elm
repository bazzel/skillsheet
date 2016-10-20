module Main exposing (..)

import Html.App as App exposing (..)
import Models exposing (Model, initialModel)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update)
import Employees.Commands exposing (fetchAll)


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
    ( initialModel
    , Cmd.map EmployeesMsg (fetchAll flags.employeesUrl)
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
