module Messages exposing (..)

import Models exposing (..)
import Http


type Msg
    = HandleResponseSuccess (List Employee)
    | HandleResponseError Http.Error
    | NoOp
