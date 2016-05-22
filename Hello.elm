module Hello exposing (main)

import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events
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


type Direction
    = Left
    | Right
    | Up


type alias Model =
    { x : Int, y : Int, direction : Direction }


type Msg
    = Point Direction
    | MouseMove Mouse.Position


decide : Msg -> Model
decide msg =
    case msg of
        Point dir ->
            { x = 0, y = 0, direction = dir }

        MouseMove pos ->
            { x = pos.x, y = pos.y, direction = Up }


positionView : Model -> Html Msg
positionView { x, y } =
    Html.div []
        [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
        ]


imageView : Model -> Html Msg
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
            [ Html.button [ Html.Events.onClick (Point Left) ]
                [ Html.text "Left" ]
            , Html.img [ Attr.src imagefile ]
                []
            , Html.button [ Html.Events.onClick (Point Right) ]
                [ Html.text "Right" ]
            ]
