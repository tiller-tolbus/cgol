/-  *cgol
|%
::  +brun: binary from run
::
++  brun
  ^-  $-([rows @ud] bin)
  |=  [ran=rows x=@ud]
  =|  bun=@ub
  |-
  ?~  ran  bun
  ?@  i.ran
    ::  on newline, pad the row
    =?    bun
        !=(0 (mod (met 0 bun) x))
      (rsh 0^(mod (met 0 bun) x) bun)
    $(ran t.ran)
  %=    $
    ran  t.ran
  ::
      bun  
    (cat 0 (fil 0 +.i.ran ?-(-.i.ran %live 0b1, %dead 0b0)) bun)
  ==
::  +brow: board from run
::
++  brow
  ^-  $-([rows @ud] board)
  |=  [ran=rows x=@ud]
  =|  brd=(list (list ?))
  =|  lst=(list ?)
  |-
  ?~  ran  (flop [(flop lst) brd])
  ?@  i.ran
    =?    lst
        !=(x (lent lst))
      (welp (reap (sub x (lent lst)) %|) lst)
    $(ran t.ran, brd [(flop lst) brd], lst ~)
  %=    $
    ran  t.ran
  ::
      lst
    ^-  (list ?)
    %-  welp  :_  lst
    (reap +.i.ran ?-(-.i.ran %live %&, %dead %|))
  ==
::  +worb: run from board
::
:: ++  worb
::   ^-  $-(board rows)

::  +play: iterates a game n moves
::
++  ngen
  |%
  +$  stat  [ole=board nel=(list ?) [x=@ud y=@ud]]
  ++  make
    ^-  $-([@ud @ud] game)
    |=  [x=@ud y=@ud]
    =|  bud=board
    =+  dun=(dec y)
    |-  ^-  game
    ?:  =(0 dun)  [%0 [x y] 0 [(reap x %|) bud]]
    $(dun (dec dun), bud [(reap x %|) bud])
  ++  play
    ^-  $-([game @ud] game)
    |=  [gam=game n=@ud]
    |^  ^-  game
      |-  ?:  =(0 n)  [%0 size.gam step.gam bord.gam]
      $(bord.gam (next bord.gam), n (dec n), step.gam +(step.gam))
    ++  next
      |=  bord=board
      =;  [neu=board sta=stat]
        neu
      %^    spin
          bord
        [ole=bord nel=*(list ?) [x=*@ud y=*@ud]]
      |=  [cur=(list ?) stat]
      |-
      ?~  cur  [`(list ?)`(flop nel) [ole ~ [0 +(y)]]]
      =+  fren=(friends x y ole)
      ?:  ?=(%.y i.cur)
        ?:  (lth fren 2)  $(cur t.cur, x +(x), nel [%| nel])                    ::  overexposed
        ?:  (gth fren 3)  $(cur t.cur, x +(x), nel [%| nel])                    ::  overcrowded
        $(cur t.cur, x +(x), nel [%& nel])                                      ::  goldilocks!
      ?:  =(3 fren)  $(cur t.cur, x +(x), nel [%& nel])                         ::  necromancy!
      $(cur t.cur, x +(x), nel [%| nel])
    ++  friends
      |=  [x=@ud y=@ud ole=board]
      =+  max-y=(dec y.size.gam)
      =+  max-x=(dec x.size.gam)
      ;:  add
        ?:(|(=(0 x) =(0 y)) 0 !(snag (dec x) (snag (dec y) ole)))               ::  up-left
        ?:(=(0 y) 0 !(snag x (snag (dec y) ole)))                               ::  up
        ?:(|(=(0 y) =(max-x x)) 0 !(snag +(x) (snag (dec y) ole)))              ::  up-right
        ?:(=(0 x) 0 !(snag (dec x) (snag y ole)))                               ::  left
        :: 0                                                                    ::  me
        ?:(=(max-x x) 0 !(snag +(x) (snag y ole)))                              ::  right
        ?:(|(=(0 x) =(max-y y)) 0 !(snag (dec x) (snag +(y) ole)))              ::  down-left
        ?:(=(max-y y) 0 !(snag x (snag +(y) ole)))                              ::  down
        ?:(|(=(max-y y) =(max-x x)) 0 !(snag +(x) (snag +(y) ole)))             ::  down-bad
      ==
    --
  --
::  +mate: insert pattern at point
::
++  mate
  |=  [gent=game lass=game hole=[x=@ud y=@ud]]
  ^-  game
  ::  trim gent
  =.  size.gent
    :-  
      ?.  (gth (add x.size.gent x.hole) x.size.lass)
        x.size.gent
      (sub x.size.lass x.hole)
    ?.  (gth (add y.size.gent y.hole) y.size.lass)
      y.size.gent
    (sub y.size.lass y.hole)
  ::  colonize
  =|  i=@ud
  =|  j=@ud
  |-  
  =*  outer  $
  ?:  (gth i (dec x.size.gent))
    lass
  =.  j  0
  |-  
  ?:  (gth j (dec y.size.gent))
    outer(i +(i))
  %=  $
    j  +(j)
  ::
      bord.lass
    %^    snap
        bord.lass
      (add x.hole i)
    %^    snap
        (snag (add i x.hole) bord.lass)
      (add j y.hole)
    (snag i (snag j bord.gent))
  ==
++  paint
  |=  [wash=game fore=game [x=@ud y=@ud]]
  =+  ex=(sub (div x.size.wash 2) ?:(=(0 x) x (dec x)))
  =/  ex-stop=@ud
    (add x.size.fore ex)
  =+  wy=(sub (div y.size.wash 2) ?:(=(0 y) y (dec y)))
  =/  wy-stop=@ud
    (add y.size.fore wy)
  =|  pointy=@ud
  |-
  ~&  >  [%wy %is wy %stop wy-stop %ex %is ex %stop ex-stop]
  ?:  =(wy-stop wy)
    `game`wash
   %=  $
    wy      +(wy)
    ex      ex
    pointy  +(pointy)
  ::
      bord.wash
    %^    into
        (oust [wy 1] bord.wash)
      wy
    =+  clean=(oust [ex x.size.fore] (snag wy bord.wash))
    =|  pointx=@ud
    |-
    ~&  >>>  [%ex %is ex]
    ?:  =(ex-stop ex)
      clean
    %=  $
      ex     +(ex)
      pointx  +(pointx)
        clean
      ~&  >>>  [%pointx pointx %pointy pointy]
      ~&  >    [%bord-fore bord.fore]
      ~&  >>  [%got (snag pointx (snag pointy bord.fore))]
      ~&  >   [%chg (into clean ex (snag pointx (snag pointy bord.fore)))]
      (into clean ex (snag pointx (snag pointy bord.fore)))
    ==
  ==
--
