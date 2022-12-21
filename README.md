# CGOL

`%cgol` is an Urbit application for fun and learning. 

As a user, you can install it on your Urbit and explore the vast landscape of possibilities within Conway's Game of Life. You can also share your creations and browse the creations of others. 

As a developer, you can understand how to build simple applications entirely in Hoon. We've laid out this project to be a fun and newbie-friendly way to get started building Urbit applications and putting your Hoon skills to the test. 

# Installation

## Users
Install `%cgol` from `~dister-dozzod-doldys`. 
- **Web**: Enter `~dister-dozzod-doldys` into the top bar on Grid. Click **CGOL** and then **Install 
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
