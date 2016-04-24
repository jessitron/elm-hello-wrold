module Hello (main) where

import Html exposing (Html)
import Html.Attributes
import Signal exposing (Signal)
import Mouse


main : Signal Html
main =
  Mouse.position
    |> Signal.map makeDecisions
    |> Signal.map view


type alias ApplicationState =
  { x : Int
  , y : Int
  , picture : String
  }


makeDecisions : ( Int, Int ) -> ApplicationState
makeDecisions ( x, y ) =
  let
    picture =
      if x < 150 then
        "images/deeter-left.png"
      else
        "images/deeter-right.png"
  in
    { x = x, y = y, picture = picture }


view : ApplicationState -> Html
view m =
  Html.div
    []
    [ positionView m
    , pictureView m
    ]


pictureView : ApplicationState -> Html
pictureView { picture } =
  Html.img [ Html.Attributes.src picture ] []


positionView : ApplicationState -> Html
positionView { x, y } =
  Html.div
    []
    [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
    ]
