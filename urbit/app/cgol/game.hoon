::
::  game - see your game files
::
/-  *cgol
/+  rudder
::
^-  (page:rudder [games lives] play)
|_  [bol=bowl:gall odo=order:rudder sat=[gam=games liv=lives]]
++  final  (alert:rudder 'tiket' build)
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder play)
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  (~(has by args) 'REPLACE ME')
    'unsatisfactory post action'
  ?>  authenticated.odo
  'REPLACE ME'
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@])
      ==
  ^-  reply:rudder
  =+  arg=(malt args)
  =/  gam=(unit game)
    ?~  g=(~(get by arg) 'game')  ~
    (~(get by gam.sat) (slav %uv u.g))
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"cgol - play"
        ;style:"{(trip styl)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "banner")
          ;p:"banner here"
        ==
      ::
        ;div(class "outcome")
          ;+  ?~  msg  :/""
            ?:  gud.u.msg
              ;div#status.green:"{(trip txt.u.msg)}"
            ;div#status.red:"{(trip txt.u.msg)}"
        ==
      ::
        ;div(class "main")
          ;div(class "toolbar")
            ;+  make-game:make
          ==
          ;div(class "game")
            ;+  (show-game:make `(unit game)`gam)
          ==
        ==
      ::
        :: ;script:"{(trip scrp)}"
      ==
    ==
  ++  make
    |%
    ++  make-game
      ^-  manx
      ;form(method "post")
        ;input(name "act", id "m-act", value "make-game", style "display: none");
        ;input(name "range", id "m-range", type "range", min "3", max "50");
        ;button
          ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
            ;path(d "M11 20.95q-3.025-.375-5.012-2.638Q4 16.05 4 13q0-1.65.65-3.163Q5.3 8.325 6.5 7.2l1.425 1.425q-.95.85-1.437 1.975Q6 11.725 6 13q0 2.2 1.4 3.887 1.4 1.688 3.6 2.063Zm2 0v-2q2.175-.4 3.587-2.075Q18 15.2 18 13q0-2.5-1.75-4.25T12 7h-.075l1.1 1.1-1.4 1.4-3.5-3.5 3.5-3.5 1.4 1.4-1.1 1.1H12q3.35 0 5.675 2.325Q20 9.65 20 13q0 3.025-1.987 5.288Q16.025 20.55 13 20.95Z");
          ==
        ==
      ==
    ++  show-game
      |=  gum=(unit game)
      |^  ^-  manx
        ?~  gum
          ;div(class "game-space")
            ;div(class "game-board")
              ;p:"none-loaded"
            ==
          ::
            ;div(class "game-controls")
              ;p:"error"
            ==
          ==
        ;div(class "game-space")
          ;div(class "game-board")
            ;*  (board bord.u.gum)
          ==
        ::
          ;div(class "game-controls")
            ;*  save-game
          ==
        ==
      ::
      ++  save-game
        ^-  marl
        ;=  ;input(name "act", id "s-act", value "save-game", style "display: none");
            ;button
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(d "M21 7v12q0 .825-.587 1.413Q19.825 21 19 21H5q-.825 0-1.413-.587Q3 19.825 3 19V5q0-.825.587-1.413Q4.175 3 5 3h12Zm-2 .85L16.15 5H5v14h14ZM12 18q1.25 0 2.125-.875T15 15q0-1.25-.875-2.125T12 12q-1.25 0-2.125.875T9 15q0 1.25.875 2.125T12 18Zm-6-8h9V6H6ZM5 7.85V19 5Z");
              ==
            ==
        ==
      ++  board
        |=  bod=^board
        ^-  marl
        =|  mar=marl
        =|  cow=@ud
        |-  ?~  bod  mar
        %=  $
          bod  t.bod
          cow  +(cow)
        ::
            mar
          :_  mar
          ;div(class "game-row", id "row-{(scow %ud cow)}")
            ;*  =|  wor=marl
                =|  cou=@ud
                =+  row=i.bod
                ^-  marl
                |-  ?~  row  wor
                %=  $
                  row  t.row
                  cou  +(cou)
                ::
                    wor
                  :_  wor
                  ?:  i.row
                    ;input
                      =name     "cell-{(scow %ud cow)}-{(scow %ud cou)}"
                      =id       "c-{(scow %ud cow)}-{(scow %ud cou)}"
                      =type     "checkbox"
                      =checked  "";
                  ;input
                    =name     "cell-{(scow %ud cow)}-{(scow %ud cou)}"
                    =id       "c-{(scow %ud cow)}-{(scow %ud cou)}"
                    =type     "checkbox";
                ==
          ==
        ==
      --
    --
  ++  scrp
    '''
    test
    '''
  ++  styl
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }
    .red {
      color: red;
    }

    .green {
      color: green;
    }
    '''
  --
--