# cgol

**cgol** is a single-player game of cells on a grid. The objective is to have fun and learn about Life. 

# Installation

## Users
Install `%cgol` from `~dister-dozzod-doldys`. 
- **Web**: Enter `~dister-dozzod-doldys` into the top bar on Grid. Click **cgol** and then **Install 
App**. 
- **Terminal**: `|install ~dister-dozzod-doldys %cgol`

## Developers
* Clone the repo. `git clone https://github.com/tiller-tolbus/cgol.git`
* Prepare a developer ship. See [Development Ships](https://developers.urbit.org/guides/core/environment#development-ships).
* Enter the Dojo on your developer ship. 
* On Urbit, enter `|new-desk %cgol` and `|mount %cgol`. 
* On your local machine, enter `cp -r <repo>/urbit/* <pier>/cgol/`.
  * `<repo>` is the path to the repository you cloned.
  * `<pier>` is the path to the developer ship you created.
* On Urbit, enter `|commit %cgol` and `|install our %cgol`.

# User Guide

## Homepage

![Homepage](https://tiller-tolbus.nyc3.digitaloceanspaces.com/cgol/homepage.jpg)

The homepage is the first thing you will see when you open the app. If you get lost, you can click on the title button at the top to return to the homepage. 

You can immediately begin a game by pressing the arrow button following **New Game**. The drag bar determines the size of the grid. A larger grid contains more cells, and thereby more Life, but it will run more slowly. 

Under **Active Games**, you can see games that you have previously run. You can continue where you left off, or remove them to save precious memory. Active games are given Urbit ID phoneme notation, so that you can memorize the ID of a running game if you choose. 

**Import Pattern** allows you to enter an RLE pattern from [LifeWiki](https://conwaylife.com/wiki) into your library. Pattern files look [like this](https://conwaylife.com/patterns/bulletheptomino.rle).

**Saved Patterns** allows you to browse a library of imported patterns, and play from them if you like. 

## Play Game

![Play](https://tiller-tolbus.nyc3.digitaloceanspaces.com/cgol/play.jpg)

On the **play** screen you can see a grid and a bar beneath it. You can collor in tiles on the grid according to the configuration you like. Then, drag the bar to indicate how long you would like to simulate Conway's Game of Life. Finally, press the circled arrow to play the game. 

You can continue to simulate the pattern even after it's done, by resetting the bar and pressing the arrow again, or by coming back later and finding it in your **Active Games**. 

# Credits

`%cgol` was a collaborative effort between `~rabsef-bicrym` and `~tiller-tolbus`, representing [Quartus Co](https://www.quartus.co/) and [Chorus One](https://www.chorus.one) respectively. You can show your appreciation by sending each of us flattering messages on Urbit. 
