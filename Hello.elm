module Hello exposing (main)

import Html exposing (Html)
import Mouse


main : Html ()
main =
    view { x = 0, y = 0 }


view : Mouse.Position -> Html ()
view { x, y } =
    Html.div []
        [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
        ]
