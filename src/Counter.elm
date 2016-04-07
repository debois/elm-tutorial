module Counter where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

type alias Model = Int

type Action
  = ChangeQty Int


update : Action -> Model -> Model
update action model = 
  case action of
    ChangeQty qty ->
      model + qty


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button 
      [ onClick address (ChangeQty -1) ]
      [ text "-" ]
    , div
      [ countStyle ]
      [ text (toString model) ]
    , button
      [ onClick address (ChangeQty 1) ]
      [ text "+" ]
    ]


countStyle : Attribute
countStyle =
  style
  [ ("font-size", "20px")
  , ("font-family", "monospace")
  , ("display", "inline-block")
  , ("width", "50px")
  , ("text-align", "center")
  ]

