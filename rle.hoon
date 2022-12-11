|%
++  parse
  |%
  ++  header
    %+  rush
      'x = 6, y = 2'
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
  ++  run
    %-  plus
    ;~  pose
      :: this needs to stop parsing
      ;~(sfix parse-run zap)
      parse-run
    ==
  ++  parse-run
    ;~  pose
      (cook |=(t=@t ?>(=('$' t) %new)) (jest '$'))
    ::
      %+  cook
        |=  hav=$@(@t [@ud @t])
        =/  alive  =('b' ?@(hav hav +.hav))
        ?@(hav [0 alive] [-.hav alive])
      ;~(pose alf ;~(plug dem alf))
    ==
  --
++  enjs
  |%
  ++  run
    |=  rle=(list $@(%new [many=@ud live=?]))
    ^-  json
    ::  turn into 'bo$1b1o$2b2o!'
    =|  stg=tape
    |-  ?~  rle  s+(crip (flop ['!' stg]))
    %=  $
      rle  t.rle
    ::
        stg
      ?@  i.rle  ['$' stg]
      :_  stg
      ?:  =(0 many.i.rle)
        ?:(live.i.rle 'b' 'o')
      %+  cat  3
      [(scot %ud many.i.rle) ?:(live.i.rle 'b' 'o')]
    ==
  --
++  dejs
  =,  dejs:format
  |%
  ++  rle
    ^-  $-(json (list $@(%new [many=@ud live=?])))
    (cu |=(t=@t (rash t run:parse)) so)
  --
--
