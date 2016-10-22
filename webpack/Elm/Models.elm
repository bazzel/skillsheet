module Models exposing (..)

import Material
import Routing
import Employees.Models exposing (Employee)


type alias Model =
    { employees : List Employee
    , route : Routing.Route
    , mdl : Material.Model
    }


initialModel : Routing.Route -> Model
initialModel route =
    { employees = []
    , route = route
    , mdl = Material.model
    }
