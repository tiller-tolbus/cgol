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
        ;p:"{gid}"
      ==
    ::
      ;td
        ;p:"x: {ex}"
      ==
    ::
      ;td
        ;p:"y: {wy}"
      ==
    ::
      ;td
        ;div(class "list-gid")
          ;input(name "act", id "l-act", value "load-game", style "display: none");
          ;input(name "game", id "l-game", value "{gid}", style "display: none");
          ;a(href "./play?game={gid}")
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(d "M7.5 18q.625 0 1.062-.438Q9 17.125 9 16.5t-.438-1.062Q8.125 15 7.5 15t-1.062.438Q6 15.875 6 16.5t.438 1.062Q6.875 18 7.5 18Zm0-9q.625 0 1.062-.438Q9 8.125 9 7.5t-.438-1.062Q8.125 6 7.5 6t-1.062.438Q6 6.875 6 7.5t.438 1.062Q6.875 9 7.5 9Zm4.5 4.5q.625 0 1.062-.438.438-.437.438-1.062t-.438-1.062Q12.625 10.5 12 10.5t-1.062.438Q10.5 11.375 10.5 12t.438 1.062q.437.438 1.062.438Zm4.5 4.5q.625 0 1.062-.438Q18 17.125 18 16.5t-.438-1.062Q17.125 15 16.5 15t-1.062.438Q15 15.875 15 16.5t.438 1.062Q15.875 18 16.5 18Zm0-9q.625 0 1.062-.438Q18 8.125 18 7.5t-.438-1.062Q17.125 6 16.5 6t-1.062.438Q15 6.875 15 7.5t.438 1.062Q15.875 9 16.5 9ZM5 21q-.825 0-1.413-.587Q3 19.825 3 19V5q0-.825.587-1.413Q4.175 3 5 3h14q.825 0 1.413.587Q21 4.175 21 5v14q0 .825-.587 1.413Q19.825 21 19 21Zm0-2h14V5H5v14ZM5 5v14V5Z");
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
          ;input(name "range", id "m-range", type "range", min "3", max "50", value "3");
          ;button
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(d "M11 20.95q-3.025-.375-5.012-2.638Q4 16.05 4 13q0-1.65.65-3.163Q5.3 8.325 6.5 7.2l1.425 1.425q-.95.85-1.437 1.975Q6 11.725 6 13q0 2.2 1.4 3.887 1.4 1.688 3.6 2.063Zm2 0v-2q2.175-.4 3.587-2.075Q18 15.2 18 13q0-2.5-1.75-4.25T12 7h-.075l1.1 1.1-1.4 1.4-3.5-3.5 3.5-3.5 1.4 1.4-1.1 1.1H12q3.35 0 5.675 2.325Q20 9.65 20 13q0 3.025-1.987 5.288Q16.025 20.55 13 20.95Z");
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
              ;*  save-game
              ;+  play-game
          ==
        ==
      ==
    ::
    ++  numb-game
      ^-  manx
      ?.  ?=(^ gud)
        ;input(style "display: none");
      ;input(name "id", id "p-id", value "{(scow %uv u.gud)}", style "display: none");
    ++  save-game
      ^-  marl
      ?.  &(?=(^ gum) ?=(^ gud))
        ;=  ;button(disabled "")
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(d "M21 7v12q0 .825-.587 1.413Q19.825 21 19 21H5q-.825 0-1.413-.587Q3 19.825 3 19V5q0-.825.587-1.413Q4.175 3 5 3h12Zm-2 .85L16.15 5H5v14h14ZM12 18q1.25 0 2.125-.875T15 15q0-1.25-.875-2.125T12 12q-1.25 0-2.125.875T9 15q0 1.25.875 2.125T12 18Zm-6-8h9V6H6ZM5 7.85V19 5Z");
              ==
            ==
        ==
      ;=  ;input(name "act", id "s-act", value "save-game", style "display: none");
          ;button
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(d "M21 7v12q0 .825-.587 1.413Q19.825 21 19 21H5q-.825 0-1.413-.587Q3 19.825 3 19V5q0-.825.587-1.413Q4.175 3 5 3h12Zm-2 .85L16.15 5H5v14h14ZM12 18q1.25 0 2.125-.875T15 15q0-1.25-.875-2.125T12 12q-1.25 0-2.125.875T9 15q0 1.25.875 2.125T12 18Zm-6-8h9V6H6ZM5 7.85V19 5Z");
            ==
          ==
      ==
    ::
    ++  play-game
      ^-  manx
      ?.  &(?=(^ gum) ?=(^ gud))
        ;div(class "play-space")
          ;div(class "play-function")
            ;input(name "cycles", id "p-cycles", type "range", min "0", max "0", value "0", disabled "");
            ;button(disabled "")
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(d "m9.5 16.5 7-4.5-7-4.5ZM12 22q-2.075 0-3.9-.788-1.825-.787-3.175-2.137-1.35-1.35-2.137-3.175Q2 14.075 2 12t.788-3.9q.787-1.825 2.137-3.175 1.35-1.35 3.175-2.138Q9.925 2 12 2t3.9.787q1.825.788 3.175 2.138 1.35 1.35 2.137 3.175Q22 9.925 22 12t-.788 3.9q-.787 1.825-2.137 3.175-1.35 1.35-3.175 2.137Q14.075 22 12 22Zm0-2q3.35 0 5.675-2.325Q20 15.35 20 12q0-3.35-2.325-5.675Q15.35 4 12 4 8.65 4 6.325 6.325 4 8.65 4 12q0 3.35 2.325 5.675Q8.65 20 12 20Zm0-8Z");
              ==
            ==
          ==
        ==
      ;div(class "play-space")
        ;div(class "play-function")
          ;input(name "act", id "p-act", value "play-game", style "display: none");

          ;input(name "x", id "p-x", value "{(scow %ud x.size.u.gum)}", style "display: none");
          ;input(name "y", id "p-y", value "{(scow %ud y.size.u.gum)}", style "display: none");
          ;input(name "cycles", id "p-cycles", type "range", min "1", max "50", value "{(scow %ud ?~(lef 1 u.lef))}");
          ;button
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(d "m9.5 16.5 7-4.5-7-4.5ZM12 22q-2.075 0-3.9-.788-1.825-.787-3.175-2.137-1.35-1.35-2.137-3.175Q2 14.075 2 12t.788-3.9q.787-1.825 2.137-3.175 1.35-1.35 3.175-2.138Q9.925 2 12 2t3.9.787q1.825.788 3.175 2.138 1.35 1.35 2.137 3.175Q22 9.925 22 12t-.788 3.9q-.787 1.825-2.137 3.175-1.35 1.35-3.175 2.137Q14.075 22 12 22Zm0-2q3.35 0 5.675-2.325Q20 15.35 20 12q0-3.35-2.325-5.675Q15.35 4 12 4 8.65 4 6.325 6.325 4 8.65 4 12q0 3.35 2.325 5.675Q8.65 20 12 20Zm0-8Z");
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