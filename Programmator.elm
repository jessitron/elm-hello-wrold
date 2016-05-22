module Programmator exposing (viewFromOneInput)

import Html exposing (Html)
import Html.App


viewFromOneInput : { view : a -> Html a, input : (a -> a) -> Sub a, init : a } -> Program {}
viewFromOneInput { view, input, init } =
    Html.App.programWithFlags
        { init = \_ -> ( init, Cmd.none )
        , update = (\a -> \_ -> ( a, Cmd.none ))
        , subscriptions = (\_ -> input identity)
        , view = view
        }
