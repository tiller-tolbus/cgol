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
::
:: ++  bgen
::   |%
::   ++  play
::     |=  [bam=bame n=@ud]
::     |^  ^-  game
::       |-  ?:  =(0 n) [%0 size.bam step.bam bin.bam]
::       $(bin.gam (volv bin.gam), n (dec n), step.gam +(step.gam))
::     ++  volv
::       |=  rab=bin

::   --
     
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
    |=  [gent=game lass=game tile=[x=@ud y=@ud]]
    ^-  game
    ::  trim gent
    =.  size.gent
      :-  
        ?.  (gth (add x.size.gent x.tile) x.size.lass)
          x.size.gent
          (sub x.size.lass x.tile)
        ?.  (gth (add y.size.gent y.tile) y.size.lass)
          y.size.gent
          (sub y.size.lass y.tile)
    ::  
    =/  i=@ud  0
    =/  j=@ud  0
    |-  
    =*  inner  $
    ?:  (gth i (dec x.size.gent))
      lass
    =/  j  0
    |-  
    ?:  (gth j (dec y.size.gent))
      inner(i +(i))
    %=    $
        j  +(j)
        bord.lass
      ^-  (list (list ?))
      %^  snap
        bord.lass
        (add x.tile i)
        %^  snap
          %+  snag 
            (add i x.tile)  bord.lass
          (add j y.tile)
          %+  snag
            ~&  j
            i  (snag j bord.gent)
    ==
--
