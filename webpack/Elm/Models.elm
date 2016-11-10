module Models exposing (..)

import Material
import Routing
import Employees.Models exposing (Employee, EmployeeFilter)


type alias Model =
    { employees : List Employee
    , employeeFilter : EmployeeFilter
    , route : Routing.Route
    , mdl : Material.Model
    , selectedTab : Int
    }


initialModel : Routing.Route -> Model
initialModel route =
    { employees = []
    , employeeFilter = { language = "" }
    , route = route
    , mdl = Material.model
    , selectedTab = 0
    }
