::
::  cgol - by chorusone and quartus
::  -  dedicated to josh lehman
::  -  see: https://github.com/jalehman/hoon-life/blob/master/life.hoon
::
/-  *cgol
/+  rudder, c-g=cgol-game, c-w=cgol-wing
/+  verb, dbug, default-agent
::
/~  pages  (page:rudder [games lives] action)  /app/cgol
::
|%
+$  versioned-state  $%(state-0)
::
+$  state-0  [%0 =games =lives]
::
::  boilerplate
::
+$  card  card:agent:gall
+$  mast  (each brief:rudder @t)
--
::
%+  verb  |
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
    :: ~>  %bout.[0 '%cgol +on-init']
    =^  cards  state
      abet:init:eng
    [cards this]
  ::
  ++  on-save
    ^-  vase
    :: ~>  %bout.[0 '%cgol +on-save']
    !>(state)
  ::
  ++  on-load
    |=  ole=vase
    :: ~>  %bout.[0 '%cgol +on-load']
    ^-  (quip card _this)
    =^  cards  state
      abet:(load:eng ole)
    [cards this]
  ::
  ++  on-poke
    |=  [mar=mark vaz=vase]
    ::  poke timer for debugging
    :: ~>  %bout.[0 '%cgol +on-poke']
    ^-  (quip card _this)
    =^  cards  state
      ?+    mar  ~|(bad-mark-cgol/mar !!)
        %cgol-action  abet:(poke:eng vaz)
      ::
          %handle-http-request
        =;  out=(quip card [_games _lives])
          [-.out [%0 +.out]]
        ::
        %.  [bowl !<(order:rudder vaz) +.state]
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
            [%life ~]  `[%page & %life]     ::  see lives
            [%load ~]  `[%page & %load]     ::  saved files
            [%port ~]  `[%page & %port]     ::  import rle files as lives
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
    :: ~>  %bout.[0 '%cgol +on-peek']
    ^-  (unit (unit cage))
    [~ ~]
  ::
  ++  on-agent
    |=  [wir=wire sig=sign:agent:gall]
    :: ~>  %bout.[0 '%cgol +on-agent']
    ^-  (quip card _this)
    `this
  ::
  ++  on-arvo
    |=  [wir=wire sig=sign-arvo]
    :: ~>  %bout.[0 '%cgol +on-arvo']
    ^-  (quip card _this)
    `this
  ::
  ++  on-watch
  |=  =path
  :: ~>  %bout.[0 '%cgol +on-watch']
  ^-  (quip card _this)
  `this
  ::
  ++  on-fail
    :: ~>  %bout.[0 '%cgol +on-fail']
    on-fail:def
  ::
  ++  on-leave
    :: ~>  %bout.[0 '%cgol +on-init']
    on-leave:def
  --
::  |eng: helper engine
::
|_  [bol=bowl:gall dek=(list card) mas=mast]
+*  dat  .
::  +emit: append a card
::
++  emit  |=(=card dat(dek [card dek]))
::  +emil: append a list of cards
::
++  emil  |=(lac=(list card) dat(dek (welp (flop lac) dek)))
::  +abet: wrap up and return deck
::
++  abet
  ^-  (quip card _state)
  [(flop dek) state]
::  +keel: handle requests from rudder
::
++  keel
  ^-  $@(@t $:(brief:rudder (list card) $:(_games _lives)))
  ?.(-.mas `@t`p.mas [p.mas dek [games lives]])
::
++  init
  ^+  dat
  =;  logo=tape
    %-  emit:(poke !>(`action`[%read 'logo' logo]))
    =-  [%pass /eyre/connect %arvo %e -]
    [%connect [[~ [%apps %cgol ~]] dap.bol]]
  """
  #N R-pentomino
  #C A methuselah with lifespan 1103.
  #C www.conwaylife.com/wiki/index.php?title=R-pentomino
  #C chorus one x quartus
  x = 3, y = 3, rule = B3/S23
  b2o$2ob$bob!
  """
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
    %webp  dat  ::  not used, not crashing
  ::
    %save  dat
    %kill  dat(lives (~(del by lives) nam.act))
  ::
      %rite
    =/  life=urle                                       ::  a life
      (~(got by lives) nam.act)
    =+  max=(max x.head.life y.head.life)
    =/  siz=@ud                                         ::  my size
      =+  temp=(mul 2 max)
      ?:(=(0 (mod max 2)) temp +(temp))
    =+  id=`@uv`(shaw eny.bol 64 siz)                   ::  new id
    =/  sta=@ud                                         ::  offset corner
      (sub (div siz 2) (div max 2))
    ?>  (gte 25 siz)
    =/  newb=game  (make:ngen:c-g [siz siz])
    =/  quab=game
      :^    %0
          [x.head.life y.head.life]
        0
      (brow:c-g rows.life x.head.life)
    =+  baby=(paint:c-g newb quab [sta sta])
    %=    dat
        games  (~(put by games) id baby)
    ==
  ::
      %read
    %=  dat
      lives  (~(put by lives) nam.act (par:parse:c-w rle.act))
    ==
  ::
    %drop  dat(games (~(del by games) id.act))
  ::
      %make
    ?>  &(!=(0 x.act) !=(0 y.act))
    ?>  &((gth 51 x.act) (gth 51 y.act))
    =+  id=`@uv`(shaw eny.bol 64 (mul x.act y.act))
    %=    dat
        games
      (~(put by games) id (make:ngen:c-g x.act y.act))
    ==
  ::
      %play
    =+  gam=(~(got by games) id.act)
    %=    dat
        games
      (~(put by games) id.act (play:ngen:c-g gam steps.act))
    ==
  ==
::  +wash: special handler for rudder pokes
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
    %play  dat(mas [%| 'for offline play'])
  ::
      %rite
    ?~  lif=(~(get by lives) nam.act)
      dat(mas [%| 'couldn\'t find that life'])
    =+  max=(max x.head.u.lif y.head.u.lif)
    =+  siz=(mul 2 max)     ::  min siz
    =+  id=`@uv`(shaw eny.bol 64 ?:(=(0 (mod max 2)) siz +(siz)))
    %.  !>(`action`[%rite nam.act ~])
    poke(mas [%& (cat 3 'rite|' (scot %uv id))])
  ::
      %read
    %.  !>(`action`[%read nam.act rle.act])
    poke(mas [%& (cat 3 'read|' nam.act)])
  ::
      %kill
    %.  !>(`action`[%kill nam.act ~])
    poke(mas [%& (cat 3 'kild|' (crip (cass (trip nam.act))))])
  ::
    %drop
    ?~  gam=(~(get by games) id.act)
      dat(mas [%| 'i was unable to find that game'])
    %.  !>(`action`[%drop id.act])
    poke(mas [%& (cat 3 'kilt|' (scot %uv id.act))])
  ::
      %webp
    ?.  &((gth steps.act 0) (gth 51 steps.act))
      dat(mas [%| 'you\'re asking too much of me.'])
    ?~  gam=(~(get by games) id.act)
      dat(mas [%| 'your game no longer exists rip'])
    %.  !>(`action`[%play id.act 1])
    %=    poke
        games
      (~(put by games) id.act u.gam(bord board.act))
    ::
        mas
      :-  %&
      ^-  @t
      %+  rap  3
      :~  'live|'
          (scot %uv id.act)
          '|'
          (scot %ud (dec steps.act))
      ==
    ==
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
      [%& `@t`(cat 3 'made|' (scot %uv id))]
    ::
        games
      (~(put by games) id (make:ngen:c-g x.act y.act))
    ==
  ==
--
