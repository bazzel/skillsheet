module Employees.Models exposing (..)


type alias EmployeeId =
    Int


type alias Employee =
    { id : EmployeeId
    , name : String
    , image : String
    , bio : String
    , skills : List Skill
    }


type alias SkillId =
    Int


type alias Skill =
    { id : SkillId
    , name : String
    }
