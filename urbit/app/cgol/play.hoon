::
::  play - play game
::
/-  *cgol
/+  rudder, *cgol-sail, c-w=cgol-wing
::
^-  (page:rudder [games lives] action)
|_  [bol=bowl:gall odo=order:rudder sat=[gam=games liv=lives]]
++  final
  |=  [suc=? msg=brief:rudder]
  =/  args=(map @t @t)
    (malt +:(purse:rudder url.request.odo))
  ?.  suc  (build ~(tap by args) `[%| msg])
  =;  fig-hed=play-steer:stern
    ?+  -.fig-hed  !!
        %made
      :-  %next
      :_  ~
      `@t`(cat 3 'play?game=' (scot %uv id.fig-hed))
    ::
        %live
      :-  %next
      :_  ?.  =(0 lef.fig-hed)
            (crip "a generation has passed - {(scow %ud lef.fig-hed)} to go")
          'the simulation has completed'
      ^-  @t
      %+  rap  3
      :~  'play?game='
          (scot %uv id.fig-hed)
        ::
          '&left='
          (scot %ud lef.fig-hed)
        ::
          ?:(=(0 lef.fig-hed) '&auto=false' '&auto=true')
      ==
    ==
  ;;  play-steer:stern
  %+  rash
    msg
  ;~  pose
    ;~  (glue bar)
      (jest 'made')
    ::
      %+  cook
        |=(t=tape `@uv`(slav %uv (crip t)))
      (star ;~(pose aln dot))
    ==
  ::
    ;~  (glue bar)
      (jest 'live')
    ::
      %+  cook
        |=(t=tape `@uv`(slav %uv (crip t)))
      (star ;~(pose aln dot))
    ::
      %+  cook
        |=(t=tape `@ud`(slav %ud (crip t)))
      (star ;~(pose aln dot))
    ==
  ==
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder action)
  =+  err='500: something went wrong'
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  (~(has by args) 'act')           err
  ?>  authenticated.odo
  =+  act=(~(got by args) 'act')
  ?+    act  (rap 3 ~[err ' - ' act])
      %make-game
    ?~  siz=(~(get by args) 'range')   err
    =+  xy=(slav %ud u.siz)
    `action`[%make xy xy]
  ::
      %play-game
    ?~  sep=(~(get by args) 'cycles')  err
    ?~  ud=(~(get by args) 'id')       err
    ?~  ux=(~(get by args) 'x')        err
    ?~  wu=(~(get by args) 'y')        err
    =;  bin=board
      ^-  action
      :^    %webp
          `@uv`(slav %uv (need ud))
        `@ud`(slav %ud (need sep))
      bin
    =+  ax=`@ud`(slav %ud (need ux))
    =+  wa=`@ud`(slav %ud (need wu))
    =|  bun=board
    =|  lst=(list ?)
    =|  ex=@ud
    =|  wy=@ud
    |-  ^-  _bun
    ?:  =(ax ex)
      ?:  =(wa +(wy))  (flop [(flop lst) bun])
      $(lst ~, ex 0, wy +(wy), bun [(flop lst) bun])
    %=    $
      ex  +(ex)
    ::
        lst
      :_  lst
      ::
      %-  ~(has by args)
      (crip "cell-{(scow %ud ex)}-{(scow %ud wy)}")
    ==
  ==
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@])
      ==
  ^-  reply:rudder
  =+  arg=(malt args)
  =/  gam=(unit game)
    ?~  g=(~(get by arg) 'game')  ~
    (~(get by gam.sat) (slav %uv u.g))
  ::
  =/  gud=(unit @uv)
    ?~(i=(~(get by arg) 'game') ~ `(slav %uv u.i))
  ::
  =/  lef=(unit @ud)
    ?~(l=(~(get by arg) 'left') ~ ``@ud`(slav %ud u.l))
  ::
  =/  aut=(unit ?)
    ?~(a=(~(get by arg) 'auto') ~ `?:(=('true' u.a) %& %|))
  ::
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"cgol - play"
        ;style:"{(trip styl)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;script:"{(trip .^(@t %cx /(scot %p our.bol)/cgol/(scot %da now.bol)/app/cgol/cgol-min/js))}"
        ;div(class "container")
          ;div(class "banner", onclick "window.location.href = './'")
            ;h3:"conway's game of life"
          ==
        ::
          ;div(class "main")
            ;div(class "outcome")
              ;+  ?~  msg  :/""
                ?:  gud.u.msg
                  ;div#status.green:"{(trip txt.u.msg)}"
                ;div#status.red:"{(trip txt.u.msg)}"
            ==
          :::
            ;div(class "game")
              ;+  ~(show-game make gam lef aut gud)
            ==
          ==
        ::
          ;div(class "footer")
            ;h3:"made with locally sourced artisanal hoon"
            ;h3:"by chorus.one x quartus.co"
          ==
        ==
      ==
    ::
      ;div(class "area")
        ;ul(class "circles")
          ;li;
          ;li;
          ;li;
          ;li;
          ;li;
          ;li;
          ;li;
          ;li;
          ;li;
          ;li;
          ;li;
        ==
      ==
    ::
      ;script:"{(trip .^(@t %cx /(scot %p our.bol)/cgol/(scot %da now.bol)/app/cgol/cgol-min/js))}"
      ;script:"{(trip scrp)}"
    ==
  ++  scrp
    '''
    function setInputValueFromQueryParam() {
      // get the value of the "left" and "auto" query parameters
      const leftParam = new URLSearchParams(window.location.search).get("left");
      const autoParam = new URLSearchParams(window.location.search).get("auto");
      // parse the "left" parameter as an integer
      const leftValue = parseInt(leftParam, 10);
      // if the "left" parameter is a valid number
      if (!isNaN(leftValue)) {
        // get the range input element with the ID "p-cycles"
        const range = document.getElementById("p-cycles");
        // calculate the background gradient value based on the "left" parameter
        const value = (leftValue-range.min)/(range.max-range.min)*100;
        // get the output element with the ID "p-output"
        const out = document.getElementById("p-output");
        // set the value of the range input and the output element
        range.value = leftValue;
        out.value = ("0" + leftValue).slice(-2);
        // set the background gradient of the range input
        range.style.background = 'linear-gradient(to right, #82CFD0 0%, #82CFD0 ' + value + '%, #fff ' + value + '%, white 100%)';
      }
      // if the "auto" parameter is set to "true", and "left" is not 0, wait 3 seconds and click the button
      if (autoParam === "true" && leftValue !== 0) {
        setTimeout(() => {
          document.getElementById("auto-play").click();
        }, 0);
      }
    }

    // call the setInputValueFromQueryParam() function when the page loads
    window.onload = setInputValueFromQueryParam;

    function setRangeBackground(rangeId, outputId) {
      // get the range input and output elements by their IDs
      const range = document.getElementById(rangeId);
      const output = document.getElementById(outputId);
      // calculate the background gradient value based on the current value of the range input
      const value = (range.value-range.min)/(range.max-range.min)*100;
      // set the background gradient of the range input
      range.style.background = 'linear-gradient(to right, #82CFD0 0%, #82CFD0 ' + value + '%, #fff ' + value + '%, white 100%)';
      // set the value of the output element
      output.value = ("0" + range.value).slice(-2);
    }

    document.getElementById("p-cycles").oninput = () => setRangeBackground("p-cycles", "p-output");
    '''
  ++  styl
    %+  cat  3
    :_  gradient
    '''
    * {
      margin: 0.2em;
      padding: 0.2em;
      font-family: monospace;
    }

    .red {
      display: flex;
      color: brightred;
      width: 35vw;
      height: 2vh;
      background: linear-gradient(to bottom, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8));
      border: 1px solid rgba(0, 0, 0, 0.2);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      border-radius: 10px;
      justify-content: center;
    }

    .green {
      display: flex;
      color: lightgreen;
      width: 35vw;
      height: 2vh;
      background: linear-gradient(to bottom, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8));
      border: 1px solid rgba(0, 0, 0, 0.2);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      border-radius: 10px;
      justify-content: center;
    }

    button {
      background: linear-gradient(to right, rgba(0, 128, 128, 0.1), rgba(0, 255, 255, 0.1));
      border: none;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2), 0 2px 10px rgba(0, 0, 0, 0.2);
      border-radius: 5px;
    }

    .toolbar {
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(0, 0, 0, 0.15);
      border: 1px solid rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      border-radius: 10px;
    }

    .toolbar h3 {
      font-size: 12px;
      color: #fff;
    }

    .banner {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 48vw;
      height: 5vh;
      background-color: #5bc0de;
      /* slime mold green color */
      color: white;
      font-size: 32px;
      font-weight: bold;
      border: 5px solid;
      border-image: linear-gradient(to left, #23a7dd, #76ee90) 1;
      text-shadow: -2px 2px 1px #03e070;
      cursor: pointer;
    }

    .banner h3 {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 100%;
      margin: 0;
      padding: 0;
      font-size: max(2vh, 3vw);
    }

    .container {
      display: flex;
      flex-direction: column;
      width: 100%;
      position: absolute;
      justify-content: center;
      align-items: center;
    }

    .area {
      position: absolute;
      background: linear-gradient(to left, #76ee90, #23a7dd);
      width: 100%;
      height: 100vh;
      z-index: -100;
    }

    .circles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: -1;
    }

    .circles li {
      position: absolute;
      display: block;
      list-style: none;
      width: 20px;
      height: 20px;
      background: rgba(255, 255, 255, 0.2);
      animation: animate 25s linear infinite;
      bottom: -150px;
      z-index: -1;
    }

    .circles li:nth-child(1) {
      left: 25%;
      width: 80px;
      height: 80px;
      animation-delay: 0s;
    }


    .circles li:nth-child(2) {
      left: 10%;
      width: 20px;
      height: 20px;
      animation-delay: 2s;
      animation-duration: 12s;
    }

    .circles li:nth-child(3) {
      left: 70%;
      width: 20px;
      height: 20px;
      animation-delay: 4s;
    }

    .circles li:nth-child(4) {
      left: 40%;
      width: 60px;
      height: 60px;
      animation-delay: 0s;
      animation-duration: 18s;
    }

    .circles li:nth-child(5) {
      left: 40%;
      width: 60px;
      height: 60px;
      animation-delay: 0s;
      animation-duration: 18s;
    }

    .circles li:nth-child(6) {
      left: 65%;
      width: 20px;
      height: 20px;
      animation-delay: 0s;
    }

    .circles li:nth-child(7) {
      left: 75%;
      width: 110px;
      height: 110px;
      animation-delay: 3s;
    }

    .circles li:nth-child(8) {
      left: 35%;
      width: 200px;
      height: 200px;
      animation-delay: 0s;
      animation-duration: 18s;
    }

    .circles li:nth-child(9) {
      left: 50%;
      width: 25px;
      height: 25px;
      animation-delay: 15s;
      animation-duration: 45s;
    }

    .circles li:nth-child(10) {
      left: 20%;
      width: 15px;
      height: 15px;
      animation-delay: 2s;
      animation-duration: 35s;
    }

    .circles li:nth-child(11) {
      left: 85%;
      width: 150px;
      height: 150px;
      animation-delay: 0s;
      animation-duration: 11s;
    }


    @keyframes animate {
      0% {
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
      }

      100% {
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
      }
    }

    .game-space form {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .game-board {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: space-between;
      width: 55vmin;
      height: 55vmin;
      margin: 0;
      padding: 0;
    }

    .main {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    .game-row {
      display: flex;
      flex-wrap: nowrap;
      justify-content: space-between;
      width: 100%;
      height: 100%;
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    .game-row input[type="checkbox"] {
      /* Set the dimensions of the checkbox */
      flex: 1;
      /* Set the background color and border */
      background-color: white;
      border: .25px solid grey;
      /* Make the whole element clickable */
      cursor: pointer;
      /* Hide the default checkmark */
      appearance: none;
      /* Include the border width in the dimensions of the element */
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    .game-controls {
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: center;
      height: 5vh;
      background: rgba(0, 0, 0, 0.15);
      border: 1px solid rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      border-radius: 10px;
    }

    input[type="range"] {
      padding: 0;
      background: white;
      border: solid 4px #82CFD0;
      border-radius: 10px;
      height: 20px;
      width: 30vmin;
      outline: none;
      transition: background 450ms ease-in;
      -webkit-appearance: none;
    }

    input[type="range"]::-webkit-slider-thumb {
      -webkit-appearance: none;
      width: 18px;
      height: 18px;
      border-radius: 10px;
      background-color: palegreen;
      overflow: visible;
      cursor: pointer;
    }

    .make-function form {
      display: flex;
      align-items: center;
      justify-content: center;
    }

    output {
      display: flex;
      color: #fff;
      font-size: 10px;
    }

    output[id="m-output"]:before {
      content: "board size: ";
      font-weight: bold;
    }

    output[id="p-output"]:before {
      content: "generations: ";
      font-weight: bold;
    }

    .play-function {
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .play-function h3 {
      font-size: 12px;
      color: #fff;
    }

    .footer {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      position: fixed;
      bottom: 0;
      width: 80vw;
      height: 5vh;
      color: white;
      box-shadow: 0 0 2rem 0 rgba(0, 74, 56, 63%); 
      border-radius: 5px;
      background-color: rgba(11, 82, 85, 40%);
      backdrop-filter: blur(5px);
    }

    .footer h3 {
      font-size: 14px;
    }
    '''
  ++  gradient
    ^-  cord
    %-  crip
    ?~  gam  ""
    =+  sat=[r=0x76 g=0xee b=0x90]
    =+  sop=[r=0x23 g=0xa7 b=0xdd]
    =/  r-hop=@ux
      =-  ?.(=(0 -) - 0x1)
      (div (sub r.sat r.sop) +(x.size.u.gam))
    =/  g-hop=@ux
      =-  ?.(=(0 -) - 0x1)
      (div (sub g.sat g.sop) +(x.size.u.gam))
    =/  b-hop=@ux
      =-  ?.(=(0 -) - 0x1)
      (div (sub b.sop b.sat) +(x.size.u.gam))
    =|  x=@ud  :: x.size.u.gam
    =|  y=@ud  :: y.size.u.gam
    =|  o=tape
    =+  co=(x-co:co 2)
    |-
    ?:  =(x x.size.u.gam)
      ?:  =(y y.size.u.gam)  o
      $(x 0, y +(y))
    =+  a1=`@ux`(cut 3 [0 1] (sub r.sat (mul x r-hop)))
    =+  b1=`@ux`(cut 3 [0 1] (sub g.sat (mul x g-hop)))
    =+  c1=`@ux`(cut 3 [0 1] (add b.sat (mul x b-hop)))
    =+  a2=`@ux`(cut 3 [0 1] (sub r.sat (mul +(x) r-hop)))
    =+  b2=`@ux`(cut 3 [0 1] (sub g.sat (mul +(x) g-hop)))
    =+  c2=`@ux`(cut 3 [0 1] (add b.sat (mul +(x) b-hop)))
    %=  $
      x     +(x)
    ::
        o
      =-  (welp o -)
      ::  linear-gradient(0deg, #{:(welp a1 b1 c1)}, #{:(welp a2 b2 c2)});
      """

      input[name="cell-{(scow %ud x)}-{(scow %ud y)}"]:checked \{
        background: linear-gradient(90deg, #{:(welp (co a1) (co b1) (co c1))}, #{:(welp (co a2) (co b2) (co c2))});
      }
      """
    ==
  --
--