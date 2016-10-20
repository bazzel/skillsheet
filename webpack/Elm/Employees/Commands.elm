module Employees.Commands exposing (..)

import Task exposing (Task)
import Http
import Json.Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (..)
import Employees.Models exposing (..)
import Employees.Messages exposing (Msg(..))


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
