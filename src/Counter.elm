module Counter where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


type alias Model = Int


init : Int -> Model
init val =
  val


type Action
  = ChangeQty Int


{-
Update myself, and emit the change,
together with the model.
https://github.com/evancz/elm-architecture-tutorial/issues/30
-}
update : Action -> Model -> (Model, Int)
update action model = 
  case action of
    ChangeQty qty ->
      (model + qty, qty)


{-
"address" is now an address to an Action in the parent module.
On "click", the local Action "Increment" is sent to the parent,
tagged as requested by the parent.
-}
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

