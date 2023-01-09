"use strict";

const CLICK_AUTO_ON_COMPLETE = true;
const AUTO_CLICK_DELAY = 0;
const ADVANCE_ONE_GENERATION_BEFORE_AUTO_CLICK = false;

const selectorStrings = {
  gameBoard: "body > div.container > div.main > div.game > div > form > div.game-board",
  checkBox: "input[type=checkbox]",
  generations: "#p-output",
  cell: ([x, y]) => `#c-${x}-${y}`,
  slider: "#p-cycles",
  autoPlay: "#auto-play",
};
const selectors = {
  gameBoard: () => document.querySelector(selectorStrings.gameBoard),
  generations: () => document.querySelector(selectorStrings.generations),
  generationsNum: () => {
    return parseInt(document.querySelector(selectorStrings.generations)?.innerText);
  },
  cell: cell => document.querySelector(selectorStrings.cell(cell)),
  slider: () => document.querySelector(selectorStrings.slider),
  autoPlay: () => document.querySelector(selectorStrings.autoPlay),
};
const getNumRows = () => selectors.gameBoard().children.length;
const getNumColumns = () => selectors.gameBoard().children[0].children.length;
const isValidPoint = ([x, y], gameBoard) =>
  Boolean(x >= 0 && x < gameBoard.length && y >= 0 && y < gameBoard[0].length);
const getSurroundingCells = ([x, y]) => [
  [x - 1, y - 1],
  [x - 1, y],
  [x - 1, y + 1],
  [x, y - 1],
  [x, y + 1],
  [x + 1, y - 1],
  [x + 1, y],
  [x + 1, y + 1],
];
const getValidSurroundingCells = (gameBoard, cell) =>
  getSurroundingCells(cell).filter(_cell => isValidPoint(_cell, gameBoard));
const getLiveNeighbors = (gameBoard, cell) => {
  const validSurroundingCells = getValidSurroundingCells(gameBoard, cell);
  return validSurroundingCells.reduce(
    (count, [x, y]) => (gameBoard[x][y] ? count + 1 : count),
    0
  );
};
const computeNextGeneration = gameBoard => {
  return gameBoard.map((row, x) =>
    row.map((cell, y) => {
      const liveNeighbors = getLiveNeighbors(gameBoard, [x, y]);
      return cell ? liveNeighbors === 2 || liveNeighbors === 3 : liveNeighbors === 3;
    })
  );
};
const update = gameBoard => computeNextGeneration(gameBoard);
const draw = gameBoard =>
  gameBoard.forEach((row, x) =>
    row.forEach((cell, y) => {
      selectors.cell([x, y]).checked = cell;
    })
  );
const getFrac = (range, val) => ((val - range.min) / (range.max - range.min)) * 100;
const getOutputVal = val => ("0" + val).slice(-2);
const getBackground = val =>
  "linear-gradient(to right, #82CFD0 0%, #82CFD0 " +
  val +
  "%, #fff " +
  val +
  "%, white 100%)";

const getSliderValues = range => ({
  value: getFrac(range, range.value),
  output: getOutputVal(range.value),
});
const handleSaveViaAutoPlay = nextGeneration => {
  setTimeout(() => {
    if (ADVANCE_ONE_GENERATION_BEFORE_AUTO_CLICK) {
      draw(nextGeneration);
    }
    selectors.autoPlay().click();
  }, AUTO_CLICK_DELAY);
};
const setGenerations = () => {
  const range = selectors.slider();
  const output = selectors.generations();
  const slider = getSliderValues(range);
  range.value = parseInt(range.value) - 1;
  output.value = parseInt(slider.output) - 1;
  range.style.background = getBackground(slider.value);
};
const initBoard = () => {
  const rows = getNumRows();
  const columns = getNumColumns();
  return new Array(rows)
    .fill(null)
    .map((_, x) =>
      new Array(columns).fill(null).map((_, y) => selectors.cell([x, y]).checked)
    );
};
const gameLoop = (gameBoard, generations) => {
  draw(gameBoard);
  const nextGeneration = update(gameBoard);
  if (--generations > -1) {
    setTimeout(() => {
      setGenerations();
      gameLoop(nextGeneration, generations);
    }, 50);
  } else if (CLICK_AUTO_ON_COMPLETE) {
    handleSaveViaAutoPlay(nextGeneration);
  }
};
const startGame = () => {
  const numOfGenerations = selectors.generationsNum();
  const gameBoard = initBoard();
  gameLoop(gameBoard, numOfGenerations);
};
const startLightningMode = evt => {
  if (evt) evt.preventDefault();
  startGame();
};
if (typeof module !== "undefined" && typeof module.exports !== "undefined") {
  module.exports = {
    selectors,
    getNumRows,
    getNumColumns,
    getValidSurroundingCells,
    getLiveNeighbors,
    initBoard,
    draw,
    computeNextGeneration,
    update,
    gameLoop,
    startGame,
    startLightningMode,
  };
} else {
  window.cgol = {
    selectors,
    getNumRows,
    getNumColumns,
    getValidSurroundingCells,
    getLiveNeighbors,
    initBoard,
    draw,
    computeNextGeneration,
    update,
    gameLoop,
    startGame,
    startLightningMode,
  };
}
