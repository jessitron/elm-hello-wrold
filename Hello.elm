module Hello (main) where

import Html exposing (Html)
import Html.Attributes
import Signal exposing (Signal)
import Mouse


main : Signal Html
main =
  Mouse.position
    |> Signal.map view


view : ( Int, Int ) -> Html
view m =
  Html.div
    []
    [ positionView m
    , pictureView m
    ]


pictureView : ( Int, Int ) -> Html
pictureView ( x, _ ) =
  let
    picture =
      if x < 150 then
        "images/deeter-left.png"
      else
        "images/deeter-right.png"
  in
    Html.img [ Html.Attributes.src picture ] []


positionView : ( Int, Int ) -> Html
positionView ( x, y ) =
  Html.div
    []
    [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
    ]
