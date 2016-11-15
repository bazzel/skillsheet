module Employees.Messages exposing (..)

import Http
import Employees.Models exposing (..)


type Msg
    = ShowEmployee EmployeeId
    | FilterLanguage String EmployeeId
    | HandleResponseSuccess (List Employee)
    | HandleResponseError Http.Error
