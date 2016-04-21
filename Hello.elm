module Hello (main) where

import Html exposing (Html)
import Html.Attributes
import Signal exposing (Signal)
import Mouse
import MyCss exposing (CssClasses(..))


main : Signal Html
main =
  Mouse.position |> Signal.map view


type alias Model =
  ( Int, Int )


view : Model -> Html
view model =
  Html.div
    []
    [ pointerView model
    , imageView model
    ]


imageView model =
  Html.img [ Html.Attributes.src "images/left.png" ] []


pointerView : Model -> Html
pointerView ( x, y ) =
  Html.div
    [ MyCss.class [ Pointer ] ]
    [ Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
    ]
