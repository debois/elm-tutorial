## Getting started with Elm

```bash
npm install --global elm elm-live
elm package install evancz/start-app
elm package install evancz/elm-html
```

Make a script file (e.g. ./elm-run, chmod +x), with:
```bash
elm-live src/Main.elm --output=index.html
```

Start live coding:
```bash
./elm-run
```
