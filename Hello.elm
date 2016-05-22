module Hello exposing (main)

import Html exposing (Html)
import Mouse
import Programmator


main : Program {}
main =
    { init = { x = 0, y = 0 }
    , input = Mouse.moves
    , view = view
    }
        |> Programmator.viewFromOneInput


view : Mouse.Position -> Html Mouse.Position
view { x, y } =
    Html.div []
        [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
        ]
