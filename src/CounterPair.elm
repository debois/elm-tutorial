module CounterPair where

import Counter exposing(init, view, update)
import Html exposing (..)
import Html.Events exposing (onClick)


{-
The Model pf CounterPair only knows that
it consists of two Counters, with their own Model
-}
type alias Model =
  { topCounter : Counter.Model
  , bottomCounter : Counter.Model
  , totalQty : Int
  }

{-
Call init on the two counters
-}
init : Int -> Int -> Model
init top bottom =
  { topCounter = Counter.init top
  , bottomCounter = Counter.init bottom
  , totalQty = 0
  }


{-
Updates need to be forwarded to one of 
the two counters
i.e.: a 'child' Action needs to be sent to the
update function of a counter
-}
type Action
  = Reset
  | Top Counter.Action
  | Bottom Counter.Action


{-
Incoming actions can come from either of the counters.
We have requested them to be tagged in the view function,
so we can distinguish them here.
The child action is an argument of the Action here.
In this way, the child can specify which Action it wants to be performed
on update.
"Data Down" via the view functions,
"Action Up" via the update functions.
-}
update : Action -> Model -> Model
update action model =
  case action of
    Reset ->
      init 0 0

    Top counterAction ->
      let (counter, qty) = Counter.update counterAction model.topCounter
          newTotalQty = model.totalQty + qty
      in
          { model 
          | topCounter = counter
          , totalQty = newTotalQty
          }

    Bottom counterAction ->
      let (counter, qty) = Counter.update counterAction model.bottomCounter
          newTotalQty = model.totalQty + qty
      in
          { model 
          | bottomCounter = counter
          , totalQty = newTotalQty
          }


{-
Hand over the addresses to my Actions, to each of
the counters
-}
view : Signal.Address Action -> Model -> Html
view address model =
  div []
  [ Counter.view (Signal.forwardTo address Top) model.topCounter
  , Counter.view (Signal.forwardTo address Bottom) model.bottomCounter
  , button [ onClick address Reset ] [ text "RESET" ]
  , div []
    [ text "Total: "
    , text (toString model.totalQty) ]
  ]


