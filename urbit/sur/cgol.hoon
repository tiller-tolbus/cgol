|%
::  rle parser helpers
+$  xyrd  [%start @s @s]
+$  name  [%name @t]
+$  auth  [%author @t]
+$  comm  [%comment @t]
+$  hedd  [%head head]
+$  roww  [%row rows]
+$  parz  $%(xyrd name auth comm hedd roww)
::
+$  rows  (list $@(%new cell))
+$  cell  $%([%dead @ud] [%live @ud])
+$  head  [x=@ud y=@ud r=(unit @t)]
+$  urle
  $:  %0
      name=(unit @t)
      author=(unit @t)
      comments=(unit @t)
      start=(unit [x=@s y=@s])
      =head
      =rows
  ==
::
+$  id     @uv
+$  games  (map id game)
+$  lives  (map cord urle)
+$  board  (list (list ?))
::
+$  game
  $:  %0
      size=[x=@ud y=@ud]
      step=@ud
      bord=board
  ==
::
+$  poke
  $%  [%rem-life nam=@t ~]
      [%add-life nam=@t rle=tape]
    ::
      [%save-game run=tape]
      [%drop-game =id]
  ==
--