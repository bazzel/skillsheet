module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Employees.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EmployeesMsg subMsg ->
            let
                ( updatedEmployees, cmd ) =
                    Employees.Update.update subMsg model.employees
            in
                ( { model | employees = updatedEmployees }, Cmd.map EmployeesMsg cmd )
