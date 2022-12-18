::
::  home - play cgol
::
/-  *cgol
/+  rudder, *cgol-sail
::
^-  (page:rudder [games lives] play)
|_  [bol=bowl:gall odo=order:rudder sat=[gam=games liv=lives]]
++  final
    |=  [suc=? msg=brief:rudder]
  =/  args=(map @t @t)
    (malt +:(purse:rudder url.request.odo))
  ?.  suc  (build ~(tap by args) `[%| msg])
  =;  fig-hed=play-steer:stern
    ?+  -.fig-hed  !!
        %made
      :-  %next
      :_  'constructing new cgol board'
      `@t`(cat 3 'cgol/play?game=' (scot %uv +.fig-hed))
    ==
  ;;  play-steer:stern
  %+  rash
    msg
  ;~  pose
    ;~  (glue bar)
      sym
    ::
      %+  cook
        |=(t=tape `@uv`(slav %uv (crip t)))
      (star ;~(pose aln dot))
    ==
  ::
  ==
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder play)
  =+  err='500: something went wrong'
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  (~(has by args) 'act')           err
  ?>  authenticated.odo
  =+  act=(~(got by args) 'act')
  ?+    act  (rap 3 ~[err ' - ' act])
      %make-game
    ?~  siz=(~(get by args) 'range')   err
    =+  xy=(slav %ud u.siz)
    [%make xy xy]
  ==
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@])
      ==
  ^-  reply:rudder
  =+  arg=(malt args)
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"cgol - home"
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
            ;p:"put link back to main page - toolbar"
          ==
        ::
          ;div(class "options")
            ;+  make-game:make
          ::
            ;a(href "./cgol/load")
              ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                ;path(d "M7.792 35q-1.125 0-1.959-.833Q5 33.333 5 32.208V7.792q0-1.125.833-1.959Q6.667 5 7.792 5h24.416q1.125 0 1.959.833.833.834.833 1.959v24.416q0 1.125-.833 1.959-.834.833-1.959.833h-8.041v-2.792h8.041V10.542H7.792v21.666h8.041V35Zm10.833 0V23.708l-3.208 3.167-1.959-2L20 18.333l6.542 6.542-1.959 2-3.208-3.167V35Z");
              ==
            ==
          ==
        ==
      ::
        :: ;script:"{(trip scrp)}"
      ==
    ==
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
