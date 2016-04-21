module Hello (main) where

import Html exposing (Html)
import Signal exposing (Signal)
import Mouse


main : Signal Html
main =
  Mouse.position |> Signal.map view


view : ( Int, Int ) -> Html
view ( x, y ) =
  Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
