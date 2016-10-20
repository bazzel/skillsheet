module Messages exposing (..)

import Employees.Messages exposing (..)


type Msg
    = EmployeesMsg Employees.Messages.Msg
