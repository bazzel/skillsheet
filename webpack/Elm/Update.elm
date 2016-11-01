module Update exposing (..)

import Array exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Employees.Update
import Material
import Navigation
import Tabs exposing (..)


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
                    Array.get n tabUrls |> Maybe.withDefault ""
            in
                ( { model | selectedTab = n }, Navigation.newUrl ("#" ++ url) )
