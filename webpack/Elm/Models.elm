module Models exposing (..)

import Routing
import Employees.Models exposing (Employee)


type alias Model =
    { employees : List Employee
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { employees = []
    , route = route
    }
