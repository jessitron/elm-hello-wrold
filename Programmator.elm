module Programmator exposing (viewFromOneInput)

import Html exposing (Html)
import Html.App


viewFromOneInput : { view : a -> Html a, input : (a -> a) -> Sub a, init : a } -> Program Never
viewFromOneInput { view, input, init } =
    Html.App.program
        { init = ( init, Cmd.none )
        , update = (\a -> \_ -> ( a, Cmd.none ))
        , subscriptions = (\_ -> input identity)
        , view = view
        }
