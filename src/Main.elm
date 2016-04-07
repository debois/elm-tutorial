import StartApp.Simple exposing (start)
import Counter exposing (update, view)

main =
  start
    { model = 0
    , update = Counter.update
    , view = Counter.view
  }
    
