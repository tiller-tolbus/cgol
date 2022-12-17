::
::  cgol - by chorusone and quartus
::  -  dedicated to josh lehman
::  -  see: https://github.com/jalehman/hoon-life/blob/master/life.hoon
::
/-  *cgol
/+  rudder, c-g=cgol-game
/+  verb, dbug, default-agent
::
/~  pages  (page:rudder [games lives] action)  /app/cgol
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0  [%0 =games =lives]
::
::
::  boilerplate
::
+$  card  card:agent:gall
+$  mast  (each brief:rudder @t)
--
::
%+  verb  &
%-  agent:dbug
=|  state-0
=*  state  -
::
^-  agent:gall
::
=<
  |_  =bowl:gall
  +*  this  .
      def  ~(. (default-agent this %|) bowl)
      eng   ~(. +> [bowl ~ [%| '500 error']])
  ++  on-init
    ^-  (quip card _this)
    ~>  %bout.[0 '%cgol +on-init']
    =^  cards  state
      abet:init:eng
    [cards this]
  ::
  ++  on-save
    ^-  vase
    ~>  %bout.[0 '%cgol +on-save']
    !>(state)
  ::
  ++  on-load
    |=  ole=vase
    ~>  %bout.[0 '%cgol +on-load']
    ^-  (quip card _this)
    =^  cards  state
      abet:(load:eng ole)
    [cards this]
  ::
  ++  on-poke
    |=  [mar=mark vaz=vase]
    ::  poke timer for debugging
    ~>  %bout.[0 '%cgol +on-poke']
    ^-  (quip card _this)
    =^  cards  state
      ?+    mar  ~|(bad-mark-cgol/mar !!)
        %cgol-action  abet:(poke:eng vaz)
      ::
          %handle-http-request
        =;  out=(quip card [_games _lives])
          [-.out [%0 +.out]]
        ::
        %.  [bol !<(order:rudder vaz) +.state]
        %:  (steer:rudder $:(_games _lives) action)
          pages
        ::
          |=  =trail:rudder
          ^-  (unit place:rudder)
          ?~  site=(decap:rudder /apps/cgol site.trail)  ~
          ?+  u.site  ~
            ~          `[%page & %home]     ::  intro page
            [%$ ~]     `[%away /apps/cgol]  ::  redirects to intro page
            [%play ~]  `[%page & %play]     ::  play cgol
            [%life ~]  `[%away /apps/cgol]  ::  redirects (should list your lives)
            [%load ~]  `[%page & %load]     ::  saved files
          ==
        ::
          |=  =order:rudder
          ^-  [[(unit reply:rudder) (list card)] [_games _lives]]
          =;  msg=@t  [[`[%code 404 msg] ~] +.state]
          %+  rap  3
          ~['%cgol page ' url.request.order ' not found']
        ::
          |=(a=action keel:(wash:eng a))
        ==
      ==
    [cards this]
  ::
  ++  on-peek
    |=  =path
    ~>  %bout.[0 '%cgol +on-peek']
    ^-  (unit (unit cage))
    [~ ~]
  ::
  ++  on-agent
    |=  [wir=wire sig=sign:agent:gall]
    ~>  %bout.[0 '%cgol +on-agent']
    ^-  (quip card _this)
    `this
  ::
  ++  on-arvo
    |=  [wir=wire sig=sign-arvo]
    ~>  %bout.[0 '%cgol +on-arvo']
    ^-  (quip card _this)
    `this
  ::
  ++  on-watch
  |=  =path
  ~>  %bout.[0 '%cgol +on-watch']
  ^-  (quip card _this)
  `this
  ::
  ++  on-fail
    ~>  %bout.[0 '%cgol +on-fail']
    on-fail:def
  ::
  ++  on-leave
    ~>  %bout.[0 '%cgol +on-init']
    on-leave:def
  --
::
::  helper engine
|_  [bol=bowl:gall dek=(list card) mas=mast]
+*  dat  .
++  emit  |=(=card dat(dek [card dek]))
++  emil  |=(lac=(list card) dat(dek (welp (flop lac) dek)))
::  +abet: wrap up and return deck
++  abet
  ^-  (quip card _state)
  [(flop dek) state]
::  +keel: handle requests from rudder
::
++  keel
  ^-  $@(@t $:(brief:rudder (list card) $:(_games _lives)))
  ?.(-.mas `@t`p.mas [p.mas dek [games lives]])
::
++  wash
  |=  act=action
  ^+  dat
  ?+    -.act
    %=    dat
        mas
      :-  %|
      '''
      function not yet implemented
      if you'd like to help better
      cgol, gh ~tiller-tolbus/cgol
      '''
    ==
  ::
    %load  dat(mas [%| 'fail'])
    %play  dat(mas [%| 'fail'])
    %drop  dat(mas [%| 'fail'])
  ::
      %make
    ::  check to ensure valid size
    ?.  ?&  &(!=(0 x.act) !=(0 y.act))
            &((gth 51 x.act) (gth 51 y.act))
        ==
      dat(mas [%| 'requested game size not allowed'])
    =+  id=`@uv`(shaw eny.bol 64 (mul x.act y.act))
    %=    dat
        mas
      [%& `@t`(cat 3 'made|' `@t`(scot %uv id))]
    ::
        games
      (~(put by games) id (make:ngen:c-g x.act y.act))
    ==
  ==
::
++  init
  ^+  dat
  %-  emit
  =-  [%pass /eyre/connect %arvo %e -]
  [%connect [[~ [%apps %cgol ~]] dap.bol]]
::
++  load
  |=  vaz=vase
  ^+  dat
  ?>  ?=([%0 *] q.vaz)
  %-  emit(state !<(state-0 vaz))
  =-  [%pass /eyre/connect %arvo %e -]
  [%connect [[~ [%apps %cgol ~]] dap.bol]]
::
++  poke
  |=  vaz=vase
  ^+  dat
  =+  act=!<(action vaz)
  ?-  -.act
    %kill  dat
    %save  dat
    %rite  dat
    %read  dat
  ::
      %make
    ?>  &(!=(0 x.act) !=(0 y.act))
    ?>  &((gth 51 x.act) (gth 51 y.act))
    =+  id=`@uv`(shaw eny.bol 64 (mul x.act y.act))
    %=    dat
        games
      (~(put by games) id (make:ngen:c-g x.act y.act))
    ==
    %load  dat
    %play  dat
    %drop  dat
  ::
      %webp
    =+  gam=(~(got by games) id.act)
    %.  !>(`action`[%play id.act steps.act])
    %=    poke
        games
      (~(put by games) id.act gam(bord board.act))
    ==
  ==
--
