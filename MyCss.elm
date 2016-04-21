module MyCss (..) where

import Css exposing (..)
import Css.Elements exposing (img)
import Css.Namespace exposing (namespace)
import Html.CssHelpers


{ class } =
  Html.CssHelpers.withNamespace "craft-conf"


css =
  (stylesheet << namespace "craft-conf")
    []
