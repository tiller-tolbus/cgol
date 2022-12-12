|%
+$  cell  $%([%dead @ud] [%live @ud])
+$  rows  (list $@(%new cell))
+$  head  [x=@ud y=@ud r=(unit cord)]
::
++  parse
  |%
  ++  pre
    %+  rust
      """
      #N Acorn
      """
    %+  more
      ;~(plug gah (easy ~))
    ;~  pose
      ;~(pfix (jest '#N ') (star prn))
    ==
    :: %-  plus
  ::  +hed:
  ::
  ::    encodes a header as a $head
  ::    try "x = 6, y = 2, rule = R2/S23"
  ::
  ++  hed
    |=  dat=tape
    ^-  head
    %+  scan
      dat
    ;~  pose
      %+  cook
        |=([x=@ud y=@ud r=tape] [x=x y=y r=`(crip r)])
      ;~  (glue com)
        ;~(pfix (jest 'x = ') dem)
        ;~(pfix (jest ' y = ') dem)
        ;~(pfix (jest ' rule = ') (star prn))
      ==
    ::
      %+  cook
        |=([x=@ud y=@ud] [x=x y=y r=~])
      ;~  (glue com)
        ;~(pfix (jest 'x = ') dem)
        ;~(pfix (jest ' y = ') dem)
      ==
    ==
  ::  +run:
  ::
  ::    encodes a run as a $rows
  ::    try "b2ob$\0abobo!"
  ::      
  ++  run
    |=  dat=tape
    |^  ^-  rows
      %-  zing
      (scan dat ;~(pose ;~(sfix mor zap) mor))
    ::
    ++  mor
      (more ;~(plug gah (easy ~)) (plus ;~(pose new ran)))
    ++  uno
      ;~(pose (jest 'b') (jest 'o'))
    ++  dos
      ;~(plug dem uno)
    ++  new
      (cook |=(t=@t ?>(=('$' t) %new)) (jest '$'))
    ++  ran
      %-  cook
      :_  ;~(pose uno dos)
      |=  hav=$@(@t [@ud @t])
      ^-  cell
      ?@  hav
        ?:(=('b' hav) [%dead 0] [%live 0])
      ?:(=('b' hav) [%dead -.hav] [%live -.hav])
    --
    :: ;~  pose
    ::   :: this needs to stop parsing
    ::   ;~(sfix parse-run ;~(plug zap (star next)))
    ::   parse-run
    :: ==
  :: ++  parse-run
  ::   ;~  pose
  ::     (cook |=(t=@t ?>(=('$' t) %new)) (jest '$'))
  ::   ::
  ::     %+  cook
  ::       |=  hav=$@(@t [@ud @t])
  ::       =/  alive  =('b' ?@(hav hav +.hav))
  ::       ?@(hav [0 alive] [-.hav alive])
  ::     ;~(pose alf ;~(plug dem alf))
  ::   ==
  --
:: ++  enjs
::   |%
::   ++  run
::     |=  rle=(list $@(%new [many=@ud live=?]))
::     ^-  json
::     ::  turn into 'bo$1b1o$2b2o!'
::     =|  stg=tape
::     |-  ?~  rle  s+(crip (flop ['!' stg]))
::     %=  $
::       rle  t.rle
::     ::
::         stg
::       ?@  i.rle  ['$' stg]
::       :_  stg
::       ?:  =(0 many.i.rle)
::         ?:(live.i.rle 'b' 'o')
::       %+  cat  3
::       [(scot %ud many.i.rle) ?:(live.i.rle 'b' 'o')]
::     ==
::   --
:: ++  dejs
::   =,  dejs:format
::   |%
::   ++  rle
::     ^-  $-(json (list $@(%new [many=@ud live=?])))
::     (cu |=(t=@t (rash t run:parse)) so)
::   --
--