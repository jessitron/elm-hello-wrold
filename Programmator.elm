module Programmator exposing (viewFromOneInput, viewFromOneInputAndDecide, viewFromSpecificInputAndDecide)

import Html exposing (Html)
import Html.App


viewFromOneInput :
    { view : a -> Html a
    , input : (a -> a) -> Sub a
    , init : a
    }
    -> Program {}
viewFromOneInput { view, input, init } =
    Html.App.programWithFlags
        { init = \_ -> ( init, Cmd.none )
        , update = (\a -> \_ -> ( a, Cmd.none ))
        , subscriptions = (\_ -> input identity)
        , view = view
        }


viewFromOneInputAndDecide :
    { init : model
    , input : (msg -> msg) -> Sub msg
    , view : model -> Html msg
    , decide : msg -> model
    }
    -> Program {}
viewFromOneInputAndDecide { init, input, decide, view } =
    Html.App.programWithFlags
        { init = \_ -> ( init, Cmd.none )
        , update = (\a -> \_ -> ( decide a, Cmd.none ))
        , subscriptions = (\_ -> input identity)
        , view = view
        }


viewFromSpecificInputAndDecide :
    { init : model
    , input : Sub msg
    , view : model -> Html msg
    , decide : msg -> model
    }
    -> Program {}
viewFromSpecificInputAndDecide { init, input, decide, view } =
    Html.App.programWithFlags
        { init = \_ -> ( init, Cmd.none )
        , update = (\a -> \_ -> ( decide a, Cmd.none ))
        , subscriptions = (\_ -> input)
        , view = view
        }
