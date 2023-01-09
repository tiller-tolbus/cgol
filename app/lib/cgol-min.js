"use strict";

function _slicedToArray(arr, i) { return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _unsupportedIterableToArray(arr, i) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
function _iterableToArrayLimit(arr, i) { var _i = null == arr ? null : "undefined" != typeof Symbol && arr[Symbol.iterator] || arr["@@iterator"]; if (null != _i) { var _s, _e, _x, _r, _arr = [], _n = !0, _d = !1; try { if (_x = (_i = _i.call(arr)).next, 0 === i) { if (Object(_i) !== _i) return; _n = !1; } else for (; !(_n = (_s = _x.call(_i)).done) && (_arr.push(_s.value), _arr.length !== i); _n = !0); } catch (err) { _d = !0, _e = err; } finally { try { if (!_n && null != _i["return"] && (_r = _i["return"](), Object(_r) !== _r)) return; } finally { if (_d) throw _e; } } return _arr; } }
function _arrayWithHoles(arr) { if (Array.isArray(arr)) return arr; }
var selectorStrings = {
  gameBoard: "body > div.container > div.main > div.game > div > form > div.game-board",
  checkBox: "input[type=checkbox]",
  generations: "#p-output",
  cell: function cell(_ref) {
    var _ref2 = _slicedToArray(_ref, 2),
      x = _ref2[0],
      y = _ref2[1];
    return "#c-".concat(x, "-").concat(y);
  },
  slider: "#p-cycles"
};
var selectors = {
  gameBoard: function gameBoard() {
    return document.querySelector(selectorStrings.gameBoard);
  },
  generations: function generations() {
    return document.querySelector(selectorStrings.generations);
  },
  generationsNum: function generationsNum() {
    var _document$querySelect;
    return parseInt((_document$querySelect = document.querySelector(selectorStrings.generations)) === null || _document$querySelect === void 0 ? void 0 : _document$querySelect.innerText);
  },
  cell: function cell(_cell2) {
    return document.querySelector(selectorStrings.cell(_cell2));
  },
  slider: function slider() {
    return document.querySelector(selectorStrings.slider);
  }
};
var getNumRows = function getNumRows() {
  return selectors.gameBoard().children.length;
};
var getNumColumns = function getNumColumns() {
  return selectors.gameBoard().children[0].children.length;
};
var isValidPoint = function isValidPoint(_ref3, gameBoard) {
  var _ref4 = _slicedToArray(_ref3, 2),
    x = _ref4[0],
    y = _ref4[1];
  return x >= 0 && x < gameBoard.length && y >= 0 && y < gameBoard[0].length;
};
var getSurroundingCells = function getSurroundingCells(_ref5) {
  var _ref6 = _slicedToArray(_ref5, 2),
    x = _ref6[0],
    y = _ref6[1];
  return [[x - 1, y - 1], [x - 1, y], [x - 1, y + 1], [x, y - 1], [x, y + 1], [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]];
};
var decrementGenerations = function decrementGenerations() {
  var generations = selectors.generations();
  var generationsNum = parseInt(generations.innerText);
  if (generationsNum > 0) {
    generations.innerText = generationsNum - 1;
  }
};
var getValidSurroundingCells = function getValidSurroundingCells(gameBoard, cell) {
  return getSurroundingCells(cell).filter(function (_cell) {
    return isValidPoint(_cell, gameBoard);
  });
};
var initBoard = function initBoard() {
  var rows = getNumRows();
  var columns = getNumColumns();
  return new Array(rows).fill(null).map(function (_, x) {
    return new Array(columns).fill(null).map(function (_, y) {
      return selectors.cell([x, y]).checked;
    });
  });
};
var getLiveNeighbors = function getLiveNeighbors(gameBoard, cell) {
  var validSurroundingCells = getValidSurroundingCells(gameBoard, cell);
  return validSurroundingCells.reduce(function (count, _ref7) {
    var _ref8 = _slicedToArray(_ref7, 2),
      x = _ref8[0],
      y = _ref8[1];
    return gameBoard[x][y] ? count + 1 : count;
  }, 0);
};
var computeNextGeneration = function computeNextGeneration(gameBoard) {
  return gameBoard.map(function (row, x) {
    return row.map(function (cell, y) {
      var liveNeighbors = getLiveNeighbors(gameBoard, [x, y]);
      return cell ? liveNeighbors === 2 || liveNeighbors === 3 : liveNeighbors === 3;
    });
  });
};
var update = function update(gameBoard) {
  return computeNextGeneration(gameBoard);
};
var draw = function draw(gameBoard) {
  return gameBoard.forEach(function (row, x) {
    return row.forEach(function (cell, y) {
      selectors.cell([x, y]).checked = cell;
    });
  });
};
var getFrac = function getFrac(range, val) {
  return (val - range.min) / (range.max - range.min) * 100;
};
var getOutputVal = function getOutputVal(val) {
  return ("0" + val).slice(-2);
};
var getBackground = function getBackground(val) {
  return "linear-gradient(to right, #82CFD0 0%, #82CFD0 " + val + "%, #fff " + val + "%, white 100%)";
};
var getSliderVal = function getSliderVal(range) {
  return {
    value: getFrac(range, range.value),
    output: getOutputVal(range.value)
  };
};
var setGenerations = function setGenerations() {
  // const range = document.getElementById("p-cycles");
  // const output = document.getElementById("p-output");
  var range = selectors.slider();
  var output = selectors.generations();
  var slider = getSliderVal(range);
  range.value = parseInt(range.value) - 1;
  output.value = parseInt(slider.output) - 1;
  range.style.background = getBackground(slider.value);
};
var gameLoop = function gameLoop(gameBoard, generations) {
  draw(gameBoard);
  var nextGeneration = update(gameBoard);
  if (--generations > -1) {
    setTimeout(function () {
      setGenerations();
      gameLoop(nextGeneration, generations);
    }, 50);
  }
};
var startGame = function startGame() {
  var numOfGenerations = selectors.generationsNum();
  var gameBoard = initBoard();
  gameLoop(gameBoard, numOfGenerations);
};
var startLightningMode = function startLightningMode(evt) {
  if (evt) {
    evt.preventDefault();
  }
  startGame();
};
if (typeof module !== "undefined" && typeof module.exports !== "undefined") {
  module.exports = {
    selectors: selectors,
    getNumRows: getNumRows,
    getNumColumns: getNumColumns,
    getValidSurroundingCells: getValidSurroundingCells,
    getLiveNeighbors: getLiveNeighbors,
    initBoard: initBoard,
    draw: draw,
    computeNextGeneration: computeNextGeneration,
    update: update,
    gameLoop: gameLoop,
    startGame: startGame,
    startLightningMode: startLightningMode
  };
} else {
  window.cgol = {
    selectors: selectors,
    getNumRows: getNumRows,
    getNumColumns: getNumColumns,
    getValidSurroundingCells: getValidSurroundingCells,
    getLiveNeighbors: getLiveNeighbors,
    initBoard: initBoard,
    draw: draw,
    computeNextGeneration: computeNextGeneration,
    update: update,
    gameLoop: gameLoop,
    startGame: startGame,
    startLightningMode: startLightningMode
  };
}
