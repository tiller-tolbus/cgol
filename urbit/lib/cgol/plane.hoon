|%
+$  xyrd  [%start @s @s]
+$  name  [%name @t]
+$  auth  [%author @t]
+$  comm  [%comment @t]
+$  hedd  [%head head]
+$  roww  [%row rows]
+$  parz  $%(xyrd name auth comm hedd roww)
+$  rows  (list $@(%new cell))
+$  cell  $%([%dead @ud] [%live @ud])
+$  head  [x=@ud y=@ud r=(unit cord)]
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
++  parse
  |%
  ::  +par: main function
  ::
  ++  par
    |=  dat=tape
    (scan dat (cook hot ;~(pose ;~(sfix any zap) any)))
  ::  +hot: reform result
  ::
  ++  hot
    ^-  $-((list parz) urle)
    |=  pl=(list parz)
    =|  myrl=urle
    |-  ^-  urle
    ?~  pl  ?>(!=(*urle myrl) myrl)
    ?-    -.i.pl
      %head     $(pl t.pl, head.myrl +.i.pl)
      %name     $(pl t.pl, name.myrl `+.i.pl)
      %start    $(pl t.pl, start.myrl `+.i.pl)
      %author   $(pl t.pl, author.myrl `+.i.pl)
      %row      $(pl t.pl, rows.myrl (welp rows.myrl +.i.pl))
    ::
        %comment
      %=    $
        pl    t.pl
      ::
          comments.myrl
        ?~  comments.myrl  `+.i.pl
        `(rap 3 ~[u.comments.myrl '\0a' +.i.pl])
      ==
    ==
  ::  +any: read rle file
  ::
  ++  any
    %+  more
      ;~(plug gap (easy ~))
    ;~(pose aut nam men pos hed run)
  ::  +nam: read name row
  ::
  ++  nam
    %+  cook
      |=(t=tape [%name (crip t)])
    ;~(pfix (jest '#N ') (star prn))
  ::  +aut: read auth row
  ::
  ++  aut
    %+  cook
      |=(t=tape [%author (crip t)])
    ;~(pfix (jest '#O ') (star prn))
  ::
  ++  men
    %+  cook
      |=(t=tape [%comment (crip t)])
    ;~(pfix ;~(pose (jest '#c ') (jest '#C ')) (star prn))
  ++  pos
    |^
      %+  cook
        |=  coord=[x=@s y=@s]
        [%start x.coord y.coord]
      ;~  pfix
        ;~(pose (jest '#P ') (jest '#R '))
      ::
        ;~((glue ace) exs why)
      ==
    ++  exs
      ;~  pose
        (cook |=(x=@ud `@s`(mul 2 x)) dem)
        (cook |=(x=@ud `@s`(dec (mul 2 x))) ;~(pfix hep dem))
      ==
    ++  why
      ;~  pose
        (cook |=(x=@ud `@s`(mul 2 x)) dem)
        (cook |=(x=@ud `@s`(dec (mul 2 x))) ;~(pfix hep dem))
      ==
    --
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
  --
++  rle
  |%
  ++  name  |=(nam=(unit @t) ?~(nam ~ "#N {(trip u.nam)}\0a"))
  ++  auth  |=(aut=(unit @t) ?~(aut ~ "#O {(trip u.aut)}\0a"))
  ++  comm
    |=  cem=(unit @t)
    ^-  tape
    %-  zing
    ?~  cem  ~
    %+  rash  u.cem
    %+  more  ;~(plug gap (easy ~))
    (cook |=(t=tape `tape`:(welp "#C " t "\0a")) (star prn))
  ++  heed
    |=  hed=head
    ?~  r.hed
      "x = {(a-co:co x.hed)}, y = {(a-co:co y.hed)}\0a"
    "x = {(a-co:co x.hed)}, y = {(a-co:co y.hed)}, rule = {(trip u.r.hed)}\0a"
  ++  sart
    |=  sar=(unit [x=@sd y=@sd])
    ^-  tape
    ?~  sar  ~
    =+  ex=(old:si x.u.sar)
    =+  wy=(old:si y.u.sar)
    ;:  welp
      "#R "
    ::
      ?:  -.ex  (scow %ud +.ex)
      (snoc `tape`['-' (scow %ud +.ex)] ' ')
    ::
      %-  snoc  :_  '\0a'
      ?:(-.wy (scow %ud +.wy) ['-' (scow %ud +.wy)])
    ==
  ++  lyfe
    |=  lyf=rows
    =|  op=tape
    =|  co=@ud
    |-  ?~  lyf  (snoc (flop op) '!')
    ?@  i.lyf
      ?.  =(68 co)
        $(lyf t.lyf, co +(co), op ['$' op])
      $(lyf t.lyf, co 0, op ['\0a' '$' op])
    ?-    -.i.lyf
        %live
      ^-  tape
      ?:  =(1 +.i.lyf)
        ?.  =(68 co)
          $(lyf t.lyf, co +(co), op ['o' op])
        $(lyf t.lyf, co 0, op ['\0a' 'o' op])
      ?.  =(68 co)
        $(lyf t.lyf, co (add 2 co), op ['o' (scot %ud +.i.lyf) op])
      $(lyf t.lyf, co 0, op ['\0a' 'o' (scot %ud +.i.lyf) op])
    ::
        %dead
      ^-  tape
      ?:  =(1 +.i.lyf)
        ?.  =(68 co)
          $(lyf t.lyf, co +(co), op ['b' op])
        $(lyf t.lyf, co 0, op ['\0a' 'b' op])
      ?.  =(68 co)
        $(lyf t.lyf, co (add 2 co), op ['b' (scot %ud +.i.lyf) op])
      $(lyf t.lyf, co 0, op ['\0a' 'b' (scot %ud +.i.lyf) op])
    ==
  ::  +de-urle: urle -> rle
  ::
  ++  de-urle
    |=  ur=urle
    ^-  cord
    %-  crip  %-  zing
    ^-  (list tape)
    :~  (name name.ur)
        (auth author.ur)
        (comm comments.ur)
        (sart start.ur)
        (heed head.ur)
        (lyfe rows.ur)
    ==
  --
++  enjs
  |%
  ++  urle
    |%
    ++  as-file
      ^-  $-(^urle json)
      |=  ur=^urle
      s/(de-urle:rle ur)
    ++  as-urle
      ^-  $-(^urle json)
      |=  ur=^urle
      ^-  json
      %-  pairs:enjs:format
      :~  name+?~(name.ur ~ s/u.name.ur)
          author+?~(author.ur ~ s/u.author.ur)
          comments+?~(comments.ur ~ s/u.comments.ur)
      ::
        :-  %head
        %-  pairs:enjs:format
        :~  x+s/(scot %ud x.head.ur)
            y+s/(scot %ud y.head.ur)
            rule+?~(r.head.ur ~ s/u.r.head.ur)
        ==
      ::
        :-  %start
        ?~  start.ur  ~
        =+  ex=(old:si x.u.start.ur)
        =+  wy=(old:si y.u.start.ur)
        %-  pairs:enjs:format
        :~  x+s/?:(-.ex (scot %ud +.ex) (cat 3 '-' (scot %ud +.ex)))
            y+s/?:(-.wy (scot %ud +.wy) (cat 3 '-' (scot %ud +.wy)))
        ==
      ::
        :-  %rows
        =|  op=tape
        |-  ^-  json
        ?~  rows.ur  s/(crip (snoc (flop op) '!'))
        %=  $
          rows.ur  t.rows.ur
        ::
            op
          :_  op
          ?@  i.rows.ur
            '$'
          ?-    -.i.rows.ur
              %live
            ?:(=(1 +.i.rows.ur) 'o' (cat 3 'o' (scot %ud +.i.rows.ur)))
          ::
              %dead
            ?:(=(1 +.i.rows.ur) 'b' (cat 3 'b' (scot %ud +.i.rows.ur)))
          ==
        ==
      ==
    --
  --
--