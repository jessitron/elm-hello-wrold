module Hello exposing (main)

import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events as Events
import Mouse
import Programmator


main : Program {}
main =
    { init = { x = 0, y = 0, direction = Up }
    , input = Mouse.moves MouseMove
    , decide = decide
    , view = view
    }
        |> Programmator.viewFromSpecificInputAndDecide


view m =
    Html.div []
        [ positionView m
        , imageView m
        ]


type alias Model =
    { x : Int, y : Int, direction : Direction }


type Msg
    = MouseMove Mouse.Position
    | Point Direction


decide : Msg -> Model
decide msg =
    case msg of
        MouseMove m ->
            { x = m.x, y = m.y, direction = Up }

        Point dir ->
            { x = 0, y = 0, direction = dir }


positionView : Model -> Html Msg
positionView { x, y } =
    Html.div []
        [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
        ]


type Direction
    = Left
    | Right
    | Up


imageView : Model -> Html Msg
imageView { direction } =
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
            [ Html.button [ Events.onClick (Point Left) ]
                [ Html.text "Left" ]
            , Html.img [ Attr.src imagefile ] []
            , Html.button [ Events.onClick (Point Right) ]
                [ Html.text "Right" ]
            ]
