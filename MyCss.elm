module MyCss (..) where

import Css exposing (..)
import Css.Elements exposing (img)
import Css.Namespace exposing (namespace)
import Html.CssHelpers


{ class } =
  Html.CssHelpers.withNamespace "craft-conf"


type CssClasses
  = MyImage
  | Pointer


css =
  (stylesheet << namespace "craft-conf")
    [ img [ width (pct 100) ]
    , (.)
        Pointer
        [ textAlign center ]
    ]
