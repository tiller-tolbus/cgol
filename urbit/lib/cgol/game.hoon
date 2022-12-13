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
  ?~  ran  (flop brd)
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
:: ++  play
::   ^-  $-(game game)
::   |=  [game=game n=@ud]
::   =,  game
::   |^
::     |-  =(0 n) [%0 size step bord]
::     $(bord (next bord), n (dec n), step +(step))
::   ++  next
::     |=  bord=board
::     =
::   ++  sire
::     |=[]
::   ++  kill
::   --
::
--