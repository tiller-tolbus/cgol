::
::  game - see your game files
::
/-  *cgol
/+  rudder, *cgol-sail
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
            ;p:"put link back to main page - toolbar"
          ==
          ;div(class "list")
            ;+  (list-them:make gam.sat)
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