|%
+$  xord  [%x @sd]
+$  yord  [%y @sd]
+$  name  [%name @t]
+$  auth  [%author @t]
+$  comm  [%comment @t]
+$  hedd  [%head head]
+$  roww  [%row rows]
+$  parz  $%(xord yord name auth comm hedd roww)
+$  rows  (list $@(%new cell))
+$  cell  $%([%dead @ud] [%live @ud])
+$  head  [x=@ud y=@ud r=(unit cord)]
+$  urle
  $:  %0
      author=@t
      comments=@t
      name=@t
      =head
      =rows
  ==
::
++  parse
  |%
  ++  test
    |=  dat=tape
    %+  scan
      dat
    ;~(pose ;~(sfix any zap) any)
  ++  any
    %+  more
      ;~(plug gap (easy ~))
    ;~(pose aut nam men pos hed run)
  ++  nam
    (cook |=(t=tape [%name (crip t)]) ;~(pfix (jest '#N ') (star prn)))
  ++  aut
    (cook |=(t=tape [%author (crip t)]) ;~(pfix (jest '#O ') (star prn)))
  ++  men
    %+  cook
      |=(t=tape [%comment (crip t)])
    ;~(pfix ;~(pose (jest '#c ') (jest '#C ')) (star prn))
  ++  pos
    ;~  pfix
      ;~(pose (jest '#P ') (jest '#R '))
    ::
      ;~((glue ace) exs why)
    ==
  ++  exs
    ;~  pose
      (cook |=(x=@ud [%x `@s`(mul 2 x)]) dem)
      (cook |=(x=@ud [%x `@s`(dec (mul 2 x))]) ;~(pfix hep dem))
    ==
  ++  why
    ;~  pose
      (cook |=(x=@ud [%y `@s`(mul 2 x)]) dem)
      (cook |=(x=@ud [%y `@s`(dec (mul 2 x))]) ;~(pfix hep dem))
    ==
  ::
  ++  hed
    %+  cook
      |=(h=head [%head h])
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
  ::
  ++  run
    |^  (cook |=(r=rows [%row r]) (plus ;~(pose new ran)))
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
        ?:(=('b' hav) [%dead 1] [%live 1])
      ?:(=('b' +.hav) [%dead -.hav] [%live -.hav])
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