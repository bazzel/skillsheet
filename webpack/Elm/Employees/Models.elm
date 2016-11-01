module Employees.Models exposing (..)


type alias EmployeeId =
    Int


type alias Employee =
    { id : EmployeeId
    , name : String
    , imageUrl : String
    }
