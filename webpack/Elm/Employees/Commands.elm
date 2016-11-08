module Employees.Commands exposing (fetchAll)

import Task exposing (Task)
import Http
import Json.Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (..)
import Employees.Models exposing (..)
import Employees.Messages exposing (Msg(..))


fetchAll : String -> Cmd Msg
fetchAll url =
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
        |> required "fullName" Json.Decode.string
        |> required "image" Json.Decode.string
        |> required "bio" Json.Decode.string
        |> required "skills" (Json.Decode.list skillDecoder)


skillDecoder =
    decode Skill
        |> required "id" Json.Decode.int
        |> required "technology" Json.Decode.string
        |> required "languages" (Json.Decode.list Json.Decode.string)
