module Hello (main) where

import Html exposing (Html)
import Signal exposing (Signal)
import Mouse


main : Signal Html
main =
  Mouse.position |> Signal.map textOfMousePosition


textOfMousePosition : ( Int, Int ) -> Html
textOfMousePosition ( x, y ) =
  Html.text ("x = " ++ (toString x) ++ ", y = " ++ (toString y))
