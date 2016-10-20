module Models exposing (..)


type alias Model =
    { employees : List Employee }


type alias EmployeeId =
    Int


type alias Employee =
    { id : EmployeeId
    , name : String
    }
