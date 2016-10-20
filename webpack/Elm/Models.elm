module Models exposing (..)

import Employees.Models exposing (Employee)


type alias Model =
    { employees : List Employee }


initialModel : Model
initialModel =
    { employees = [] }
