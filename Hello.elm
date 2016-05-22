module Hello exposing (main)

import Html exposing (Html)
import Html.Attributes as Attr
import Mouse
import Programmator


main : Program {}
main =
    { init = { x = 0, y = 0, direction = Up }
    , input = Mouse.moves
    , decide = decide
    , view = view
    }
        |> Programmator.viewFromOneInputAndDecide


view m =
    Html.div []
        [ positionView m
        , imageView m
        ]


type Direction
    = Left
    | Right
    | Up


type alias Model =
    { x : Int, y : Int, direction : Direction }


decide : Mouse.Position -> Model
decide msg =
    let
        d =
            if msg.x < 200 then
                Left
            else
                Right
    in
        { x = msg.x, y = msg.y, direction = d }


positionView : Model -> Html Mouse.Position
positionView { x, y } =
    Html.div []
        [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
        ]


imageView : Model -> Html Mouse.Position
imageView { x, direction } =
    let
        imagefile =
            case direction of
                Left ->
                    "images/deeter-left.png"

                Right ->
                    "images/deeter-right.png"

                Up ->
                    "images/deeter-up.png"
    in
        Html.div []
            [ Html.img [ Attr.src imagefile ] []
            ]
