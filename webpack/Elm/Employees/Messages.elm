module Employees.Messages exposing (..)

import Http
import Employees.Models exposing (..)


type Msg
    = HandleResponseSuccess (List Employee)
    | HandleResponseError Http.Error
