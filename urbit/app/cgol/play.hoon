::
::  play - run the simulation
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
    ?-  -.fig-hed
        %made
      :-  %next
      :_  ~
      `@t`(cat 3 'play?game=' (scot %uv id.fig-hed))
    ::
        %live
      :-  %next
      :_  'a generation has passed'
      ^-  @t
      %+  rap  3
      :~  'play?game='
          (scot %uv id.fig-hed)
        ::
          '&left='
          (scot %ud lef.fig-hed)
        ::
          '&auto=false'
      ==
    ==
  ;;  play-steer:stern
  %+  rash
    msg
  ;~  pose
    ;~  (glue bar)
      (jest 'made')
    ::
      %+  cook
        |=(t=tape `@uv`(slav %uv (crip t)))
      (star ;~(pose aln dot))
    ==
  ::
    ;~  (glue bar)
      (jest 'live')
    ::
      %+  cook
        |=(t=tape `@uv`(slav %uv (crip t)))
      (star ;~(pose aln dot))
    ::
      %+  cook
        |=(t=tape `@ud`(slav %ud (crip t)))
      (star ;~(pose aln dot))
    ==
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
  ::
      %play-game
    ?~  sep=(~(get by args) 'cycles')  err
    ?~  ud=(~(get by args) 'id')       err
    ?~  ux=(~(get by args) 'x')        err
    ?~  wu=(~(get by args) 'y')        err
    =;  bin=board
      :^    %webp
          `@uv`(slav %uv (need ud))
        `@ud`(slav %ud (need sep))
      bin
    =+  ax=`@ud`(slav %ud (need ux))
    =+  wa=`@ud`(slav %ud (need wu))
    =|  bun=board
    =|  lst=(list ?)
    =|  ex=@ud
    =|  wy=@ud
    |-  ^-  _bun
    ?:  =(ax ex)
      ?:  =(wa +(wy))  (flop [(flop lst) bun])
      $(lst ~, ex 0, wy +(wy), bun [(flop lst) bun])
    %=    $
      ex  +(ex)
    ::
        lst
      :_  lst
      ::
      %-  ~(has by args)
      (crip "cell-{(scow %ud ex)}-{(scow %ud wy)}")
    ==
  ==
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
  ::
  =/  gud=(unit @uv)
    ?~(i=(~(get by arg) 'game') ~ `(slav %uv u.i))
  ::
  =/  lef=(unit @ud)
    ?~(l=(~(get by arg) 'left') ~ ``@ud`(slav %ud u.l))
  ::
  =/  aut=(unit ?)
    ?~(a=(~(get by arg) 'auto') ~ `?:(=('true' u.a) %& %|))
  ::
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
            ;+  ~(show-game make gam lef aut gud)
          ==
        ==
      ::
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