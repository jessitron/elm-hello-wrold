module Hello exposing (main)

import Html exposing (Html)
import Html.Attributes as Attr
import Mouse
import Programmator


main : Program {}
main =
    { init = { x = 0, y = 0 }
    , input = Mouse.moves
    , view = view
    }
        |> Programmator.viewFromOneInput


view m =
    Html.div []
        [ positionView m
        , imageView m
        ]


positionView : Mouse.Position -> Html Mouse.Position
positionView { x, y } =
    Html.div []
        [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
        ]


imageView : Mouse.Position -> Html Mouse.Position
imageView _ =
    Html.div []
        [ Html.img [ Attr.src "images/deeter-up.png" ] []
        ]
