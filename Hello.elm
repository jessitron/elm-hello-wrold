module Hello exposing (main)

import Html exposing (Html)


main : Html ()
main =
    view


view : Html ()
view =
    Html.div []
        [ Html.text "Hello World"
        ]
