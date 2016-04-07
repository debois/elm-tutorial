import StartApp.Simple exposing (start)
import CounterPair exposing (update, view)

main =
  start
    { model = CounterPair.init 0 0
    , update = CounterPair.update
    , view = CounterPair.view
  }
    
