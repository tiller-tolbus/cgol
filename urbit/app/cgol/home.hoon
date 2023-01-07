::
::  home - play cgol
::
::
/-  *cgol
/+  rudder, *cgol-sail
::
^-  (page:rudder [games lives] play)
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
      :_  'new game board constructed!'
      `@t`(cat 3 'cgol/play?game=' (scot %uv +.fig-hed))
    ==
  ;;  play-steer:stern
  %+  rash
    msg
  ;~  pose
    ;~  (glue bar)
      sym
    ::
      %+  cook
        |=(t=tape `@uv`(slav %uv (crip t)))
      (star ;~(pose aln dot))
    ==
  ==
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder play)
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
    [%make xy xy]
  ==
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@])
      ==
  ^-  reply:rudder
  =+  arg=(malt args)
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"cgol - home"
        ;style:"{(trip styl)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "container")
          ;div(class "banner", onclick "window.location.href = './cgol'")
            ;h3:"conway's game of life"
          ==
        ::
          ;div(class "outcome")
            ;+  ?~  msg  :/""
              ?:  gud.u.msg
                ;div#status.green:"{(trip txt.u.msg)}"
              ;div#status.red:"{(trip txt.u.msg)}"
          ==
        ::
          ;div(class "main")
            ;div(class "options")
              ;div(class "new-game")
                ;h3:"new game: "
                ;+  make-game:make
              ==
            ::
              ;div(class "load-game")
                ;h3:"continue existing game: "
              ::
                ;button(onclick "window.location.href = './cgol/load'")
                  ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                    ;path(fill "#fff", d "M7.792 35q-1.125 0-1.959-.833Q5 33.333 5 32.208V7.792q0-1.125.833-1.959Q6.667 5 7.792 5h24.416q1.125 0 1.959.833.833.834.833 1.959v24.416q0 1.125-.833 1.959-.834.833-1.959.833h-8.041v-2.792h8.041V10.542H7.792v21.666h8.041V35Zm10.833 0V23.708l-3.208 3.167-1.959-2L20 18.333l6.542 6.542-1.959 2-3.208-3.167V35Z");
                  ==
                ==
              ==
            ==
          ==
        ::
          ;div(class "footer")
            ;h3:"made with locally sourced artisinal hoon"
            ;h3:"by chorus one x quartus co"
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
        ;script:"{(trip scrp)}"
      ==
    ==
  ++  scrp
    '''
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

    document.getElementById("m-range").oninput = () => setRangeBackground("m-range", "m-output");
    '''
  ++  styl
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

    .options {
      display: flex;
      flex-direction: column;
      height: 40vh;
      justify-content: space-evenly;
      align-items: center;
    }

    .new-game {
      display: flex;
      color: #fff;
      font-size: 12px;
      align-items: center;
      justify-content: center;
      width: 60vmin;
      height: 10vh;
      background: rgba(0, 0, 0, 0.15);
      border: 1px solid rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      border-radius: 10px;
    }

    .load-game {
      display: flex;
      color: #fff;
      font-size: 12px;
      align-items: center;
      justify-content: center;
      width: 60vmin;
      height: 10vh;
      background: rgba(0, 0, 0, 0.15);
      border: 1px solid rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      border-radius: 10px;
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

    button {
      background: linear-gradient(to right, rgba(0, 128, 128, 0.1), rgba(0, 255, 255, 0.1));
      border: none;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2), 0 2px 10px rgba(0, 0, 0, 0.2);
      border-radius: 5px;
    }

    input[type="range"] {
      padding: 0;
      background: white;
      border: solid 4px #82CFD0;
      border-radius: 10px;
      height: 20px;
      width: 20vmin;
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
  --
--
