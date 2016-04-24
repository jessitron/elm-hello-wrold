module Hello (main) where

import Html exposing (Html)
import Html.Attributes
import Signal exposing (Signal)
import Mouse


main : Signal Html
main =
  incomingMessages
    |> Signal.foldp makeDecisions initialState
    |> Signal.map view


type Message
  = MouseMove ( Int, Int )
  | Click


incomingMessages : Signal Message
incomingMessages =
  Signal.merge
    (Signal.map MouseMove Mouse.position)
    (Signal.map (always Click) Mouse.clicks)


type alias ApplicationState =
  { x : Int
  , y : Int
  , picture : String
  }


initialState =
  { x = 0, y = 0, picture = "images/deeter-up.png" }


makeDecisions : Message -> ApplicationState -> ApplicationState
makeDecisions msg state =
  state
    |> updatePosition msg
    |> updatePicture msg


updatePosition msg state =
  case msg of
    MouseMove ( x, y ) ->
      { state | x = x, y = y }

    _ ->
      state


updatePicture msg state =
  case msg of
    Click ->
      let
        picture =
          if state.x < 150 then
            "images/deeter-left.png"
          else
            "images/deeter-right.png"
      in
        { state | picture = picture }

    _ ->
      state


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
