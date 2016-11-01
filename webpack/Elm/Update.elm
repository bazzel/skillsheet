module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Employees.Update
import Material
import Navigation


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EmployeesMsg subMsg ->
            let
                ( updatedEmployees, cmd ) =
                    Employees.Update.update subMsg model.employees
            in
                ( { model | employees = updatedEmployees }, Cmd.map EmployeesMsg cmd )

        Mdl msg' ->
            Material.update msg' model

        SelectTab n ->
            let
                url =
                    case n of
                        0 ->
                            "employees"

                        1 ->
                            "skills"

                        _ ->
                            ""
            in
                ( { model | selectedTab = n }, Navigation.newUrl ("#" ++ url) )
