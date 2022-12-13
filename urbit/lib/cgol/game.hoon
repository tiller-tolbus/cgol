/-  *cgol
|%
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

::  +play: iterates the board n moves
::
++  ngen
  |%
  +$  stat  [ole=board nel=(list ?) [x=@ud y=@ud]]
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
      ;:  add
        ?:(|(=(0 x) =(0 y)) 0 !(snag (dec x) (snag (dec y) ole)))               ::  up-left
        ?:(=(0 y) 0 !(snag x (snag (dec y) ole)))                               ::  up
        ?:(|(=(0 y) =((dec x.size.gam) x)) 0 !(snag +(x) (snag (dec y) ole)))   ::  up-right
        ?:(=(0 x) 0 !(snag (dec x) (snag y ole)))                               ::  left
        :: 0                                                                    ::  me
        ?:(=((dec x.size.gam) x) 0 !(snag +(x) (snag y ole)))                   ::  right
        ?:(|(=(0 x) =((dec y.size.gam) y)) 0 !(snag (dec x) (snag +(y) ole)))   ::  down-left
        ?:(=((dec y.size.gam) y) 0 !(snag x (snag +(y) ole)))                   ::  down
        ?:  |(=((dec y.size.gam) y) =((dec x.size.gam) x))                      ::  down-bad
          0
        !(snag +(x) (snag +(y) ole))
      ==
    ++  exposed
      |=  [x=@ud y=@ud ole=board]
      =-  (lth - 2)
      ;:  add
        ?:(|(=(0 x) =(0 y)) 0 !(snag (dec x) (snag (dec y) ole)))               ::  up-left
        ?:(=(0 y) 0 !(snag x (snag (dec y) ole)))                               ::  up
        ?:(|(=(0 y) =((dec x.size.gam) x)) 0 !(snag +(x) (snag (dec y) ole)))   ::  up-right
        ?:(=(0 x) 0 !(snag (dec x) (snag y ole)))                               ::  left
        :: 0                                                                    ::  me
        ?:(=((dec x.size.gam) x) 0 !(snag +(x) (snag y ole)))                   ::  right
        ?:(|(=(0 x) =((dec y.size.gam) y)) 0 !(snag (dec x) (snag +(y) ole)))   ::  down-left
        ?:(=((dec y.size.gam) y) 0 !(snag x (snag +(y) ole)))                   ::  down
        ?:  |(=((dec y.size.gam) y) =((dec x.size.gam) x))                      ::  down-bad
          0
        !(snag +(x) (snag +(y) ole))
      ==
    ++  crowded
      |=  [x=@ud y=@ud ole=board]
      %|
    ++  resurrect
      |=  [x=@ud y=@ud ole=board]
      %|
    --
  --
--