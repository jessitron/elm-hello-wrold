module Hello exposing (main)

import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events as Events
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
imageView { x } =
    let
        imagefile =
            if x < 200 then
                "images/deeter-left.png"
            else
                "images/deeter-right.png"
    in
        Html.div []
            [ Html.button [ Events.onClick { x = 0, y = 0 } ]
                [ Html.text "Left" ]
            , Html.img [ Attr.src imagefile ] []
            , Html.button [ Events.onClick { x = 300, y = 0 } ]
                [ Html.text "Right" ]
            ]
