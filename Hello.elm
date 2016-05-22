module Hello exposing (main)

import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events
import Mouse
import Html.App


main : Program {}
main =
    { init = (\flags -> ( { x = 0, y = 0, direction = Up }, Cmd.none ))
    , subscriptions = \model -> Mouse.moves MouseMove
    , update = doNothing update
    , view = view
    }
        |> Html.App.programWithFlags


doNothing f a b =
    ( f a b, Cmd.none )


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


update : Msg -> Model -> Model
update msg previous =
    case msg of
        Point dir ->
            { previous | direction = dir }

        MouseMove pos ->
            { x = pos.x, y = pos.y, direction = previous.direction }


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
