/-  *cgol
|%
++  make
  |_  $:  gum=(unit game)
          lef=(unit @ud)
          aut=(unit ?)
          gud=(unit @uv)
      ==
  ++  list-them
    |=  =games
    ^-  manx
    =;  games=marl
      ;table(class "list-space")
        ;*  games
      ==
    %+  turn  ~(tap by games)
    |=  [=id gam=game]
    =+  gid=(scow %uv id)
    =+  sep=(scow %uc step.gam)
    =+  ex=(scow %ud x.size.gam)
    =+  wy=(scow %ud y.size.gam)
    ^-  manx
    ;tr(class "list-row")
      ;td
        ;p:"game id: {(oust [0 2] (scow %q id))}"
      ==
    ::
      ;td
        ;p:"grid size: "
      ==
    ::
      ;td
        ;p:"{ex}, {wy}"
      ==
    ::
      ;td
        ;div(class "list-gid")
          ;button(onclick "window.location.href = './play?game={gid}'")
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(fill "#fff", d "m9.5 16.5 7-4.5-7-4.5ZM12 22q-2.075 0-3.9-.788-1.825-.787-3.175-2.137-1.35-1.35-2.137-3.175Q2 14.075 2 12t.788-3.9q.787-1.825 2.137-3.175 1.35-1.35 3.175-2.138Q9.925 2 12 2t3.9.787q1.825.788 3.175 2.138 1.35 1.35 2.137 3.175Q22 9.925 22 12t-.788 3.9q-.787 1.825-2.137 3.175-1.35 1.35-3.175 2.137Q14.075 22 12 22Zm0-2q3.35 0 5.675-2.325Q20 15.35 20 12q0-3.35-2.325-5.675Q15.35 4 12 4 8.65 4 6.325 6.325 4 8.65 4 12q0 3.35 2.325 5.675Q8.65 20 12 20Zm0-8Z");
            ==
          ==
        ::
          ;form(method "post")
            ;input(name "act", id "d-act", value "drop-game", style "display: none");
            ;input(name "game", id "d-game", value "{gid}", style "display: none");
            ;button
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(fill "#fff", d "m8.4 17 3.6-3.6 3.6 3.6 1.4-1.4-3.6-3.6L17 8.4 15.6 7 12 10.6 8.4 7 7 8.4l3.6 3.6L7 15.6Zm3.6 5q-2.075 0-3.9-.788-1.825-.787-3.175-2.137-1.35-1.35-2.137-3.175Q2 14.075 2 12t.788-3.9q.787-1.825 2.137-3.175 1.35-1.35 3.175-2.138Q9.925 2 12 2t3.9.787q1.825.788 3.175 2.138 1.35 1.35 2.137 3.175Q22 9.925 22 12t-.788 3.9q-.787 1.825-2.137 3.175-1.35 1.35-3.175 2.137Q14.075 22 12 22Zm0-2q3.35 0 5.675-2.325Q20 15.35 20 12q0-3.35-2.325-5.675Q15.35 4 12 4 8.65 4 6.325 6.325 4 8.65 4 12q0 3.35 2.325 5.675Q8.65 20 12 20Zm0-8Z");
              ==
            ==
          ==
        ==
      ==
    ==
  ++  make-game
    ^-  manx
    ;div(class "make-space")
      ;div(class "make-function")
        ;form(method "post")
          ;input(name "act", id "m-act", value "make-game", style "display: none");
          ;input(name "range", id "m-range", type "range", min "3", max "25", value "3", step "1")
            ;output(id "m-output", for "m-range"):"03"
          ==
          ;button
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(fill "#fff", d "m9.5 16.5 7-4.5-7-4.5ZM12 22q-2.075 0-3.9-.788-1.825-.787-3.175-2.137-1.35-1.35-2.137-3.175Q2 14.075 2 12t.788-3.9q.787-1.825 2.137-3.175 1.35-1.35 3.175-2.138Q9.925 2 12 2t3.9.787q1.825.788 3.175 2.138 1.35 1.35 2.137 3.175Q22 9.925 22 12t-.788 3.9q-.787 1.825-2.137 3.175-1.35 1.35-3.175 2.137Q14.075 22 12 22Zm0-2q3.35 0 5.675-2.325Q20 15.35 20 12q0-3.35-2.325-5.675Q15.35 4 12 4 8.65 4 6.325 6.325 4 8.65 4 12q0 3.35 2.325 5.675Q8.65 20 12 20Zm0-8Z");
            ==
          ==
        ==
      ==
    ==
  ++  show-game
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
        ;form(method "post")
          ;div(class "game-board")
            ;*  (bord-game bord.u.gum)
          ==
        ::
          ;div(class "game-controls")
              ;+  numb-game
              :: ;+  save-game
              ;+  play-game
          ==
        ==
      ==
    ::
    ++  numb-game
      ^-  manx
      ?.  ?=(^ gud)
        ;input(style "display: none");
      ;input
        =name   "id"
        =id     "p-id"
        =value  "{(scow %uv u.gud)}"
        =style  "display: none";
    ::
    :: ++  save-game
    ::   ^-  manx
    ::   ?.  &(?=(^ gum) ?=(^ gud))
    ::     ;div(class "save-game")
    ::       ;button(disabled "")
    ::         ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
    ::           ;path(fill "#fff", d "M21 7v12q0 .825-.587 1.413Q19.825 21 19 21H5q-.825 0-1.413-.587Q3 19.825 3 19V5q0-.825.587-1.413Q4.175 3 5 3h12Zm-2 .85L16.15 5H5v14h14ZM12 18q1.25 0 2.125-.875T15 15q0-1.25-.875-2.125T12 12q-1.25 0-2.125.875T9 15q0 1.25.875 2.125T12 18Zm-6-8h9V6H6ZM5 7.85V19 5Z");
    ::         ==
    ::       ==
    ::     ==
    ::   ;div(class "save-game")
    ::     ;input(name "act", id "s-act", value "save-game", style "display: none");
    ::     ;button
    ::       ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
    ::         ;path(fill "#fff", d "M21 7v12q0 .825-.587 1.413Q19.825 21 19 21H5q-.825 0-1.413-.587Q3 19.825 3 19V5q0-.825.587-1.413Q4.175 3 5 3h12Zm-2 .85L16.15 5H5v14h14ZM12 18q1.25 0 2.125-.875T15 15q0-1.25-.875-2.125T12 12q-1.25 0-2.125.875T9 15q0 1.25.875 2.125T12 18Zm-6-8h9V6H6ZM5 7.85V19 5Z");
    ::       ==
    ::     ==
    ::   ==
    ::
    ++  play-game
      ^-  manx
      ?.  &(?=(^ gum) ?=(^ gud))
        ;div(class "play-space")
          ;div(class "play-function")
            ;input(name "cycles", id "p-cycles", type "range", min "0", max "0", value "0", disabled "");
            ;button(disabled "")
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(fill "#fff", d "m9.5 16.5 7-4.5-7-4.5ZM12 22q-2.075 0-3.9-.788-1.825-.787-3.175-2.137-1.35-1.35-2.137-3.175Q2 14.075 2 12t.788-3.9q.787-1.825 2.137-3.175 1.35-1.35 3.175-2.138Q9.925 2 12 2t3.9.787q1.825.788 3.175 2.138 1.35 1.35 2.137 3.175Q22 9.925 22 12t-.788 3.9q-.787 1.825-2.137 3.175-1.35 1.35-3.175 2.137Q14.075 22 12 22Zm0-2q3.35 0 5.675-2.325Q20 15.35 20 12q0-3.35-2.325-5.675Q15.35 4 12 4 8.65 4 6.325 6.325 4 8.65 4 12q0 3.35 2.325 5.675Q8.65 20 12 20Zm0-8Z");
              ==
            ==
          ==
        ==
      ;div(class "play-space")
        ;div(class "play-function")
          ;h3:"play game: "
          ;input(name "act", id "p-act", value "play-game", style "display: none");
          ;input(name "x", id "p-x", value "{(scow %ud x.size.u.gum)}", style "display: none");
          ;input(name "y", id "p-y", value "{(scow %ud y.size.u.gum)}", style "display: none");
          ;input(name "cycles", id "p-cycles", type "range", min "1", max "50", value "{(scow %ud ?~(lef 1 u.lef))}")
            ;output(id "p-output", for "p-cycles"):"01"
          ==
          ;button(id "auto-play")
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(fill "#fff", d "m9.5 16.5 7-4.5-7-4.5ZM12 22q-2.075 0-3.9-.788-1.825-.787-3.175-2.137-1.35-1.35-2.137-3.175Q2 14.075 2 12t.788-3.9q.787-1.825 2.137-3.175 1.35-1.35 3.175-2.138Q9.925 2 12 2t3.9.787q1.825.788 3.175 2.138 1.35 1.35 2.137 3.175Q22 9.925 22 12t-.788 3.9q-.787 1.825-2.137 3.175-1.35 1.35-3.175 2.137Q14.075 22 12 22Zm0-2q3.35 0 5.675-2.325Q20 15.35 20 12q0-3.35-2.325-5.675Q15.35 4 12 4 8.65 4 6.325 6.325 4 8.65 4 12q0 3.35 2.325 5.675Q8.65 20 12 20Zm0-8Z");
            ==
          ==
        ==
      ==
    ::
    ++  bord-game
      |=  bod=board
      ^-  marl
      =|  mar=marl
      =|  cow=@ud
      |-  ?~  bod  (flop mar)
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
              |-  ?~  row  (flop wor)
              %=  $
                row  t.row
                cou  +(cou)
              ::
                  wor
                :_  wor
                ?:  i.row
                  ;input
                    =name     "cell-{(scow %ud cou)}-{(scow %ud cow)}"
                    =value    "cell-{(scow %ud cou)}-{(scow %ud cow)}"
                    =id       "c-{(scow %ud cou)}-{(scow %ud cow)}"
                    =type     "checkbox"
                    =checked  "";
                ;input
                  =name     "cell-{(scow %ud cou)}-{(scow %ud cow)}"
                  =value    "cell-{(scow %ud cou)}-{(scow %ud cow)}"
                  =id       "c-{(scow %ud cou)}-{(scow %ud cow)}"
                  =type     "checkbox";
              ==
        ==
      ==
    --
  --
--