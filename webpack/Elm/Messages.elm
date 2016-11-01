module Messages exposing (..)

import Material
import Employees.Messages exposing (..)


type Msg
    = EmployeesMsg Employees.Messages.Msg
    | Mdl (Material.Msg Msg)
    | SelectTab Int
