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


type alias Model =
    Mouse.Position


positionView : Model -> Html Model
positionView { x, y } =
    Html.div []
        [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
        ]


imageView : Model -> Html Model
imageView { x } =
    let
        imagefile =
            if x < 200 then
                "images/deeter-left.png"
            else
                "images/deeter-right.png"
    in
        Html.div []
            [ Html.img [ Attr.src imagefile ] []
            ]
