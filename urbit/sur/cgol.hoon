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
+$  bin    @ub
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
+$  bame
  $:  %0
      size=[x=@ud y=@ud]
      step=@ud
      =bin
  ==
::
+$  action  $%(life play)
::
+$  life
  $%  [%kill nam=@t ~]
      [%save nam=@t ~]
      [%rite nam=@t ~]
      [%read nam=@t rle=tape]
  ==
::
+$  play
  $%
      [%make x=@ud y=@ud]
      [%load =id]
      [%play =id steps=@ud]
      [%drop =id]
  ==
--