```
░█▀▄▀█ ─█▀▀█ ░█▀▀▀█ ▀▀█▀▀ ░█▀▀▀ ░█▀▀█ ░█▀▄▀█ ▀█▀ ░█▄─░█ ░█▀▀▄
░█░█░█ ░█▄▄█ ─▀▀▀▄▄ ─░█── ░█▀▀▀ ░█▄▄▀ ░█░█░█ ░█─ ░█░█░█ ░█─░█
░█──░█ ░█─░█ ░█▄▄▄█ ─░█── ░█▄▄▄ ░█─░█ ░█──░█ ▄█▄ ░█──▀█ ░█▄▄▀
```
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General info
This project is a Ruby implementation of the classic game Mastermind.

## Technologies
Project is created with:
* Ruby version: 2.5.3

## Setup
To run this game, save a copy of this repository locally. Then, run it using ruby in the MacOS application 'Terminal':
(note: '$' is not typed)

```
$ cd ../mastermind
$ gem install json
$ gem install colorize
$ ruby mastermind.rb
```

## Features
List of features ready and TODOs for future development
* Fully playable game
* Game provides feedback on number of correct colors, correct positions, incorrect lengths of guesses, number of turns, and total game time
* The player can select one of three difficulty levels
* Play data is recorded in an external file, which is used to compare current game to average performance
* Game maintains and can display a high score list
* Game displays ascii art titles and colorful text

To-do list:
* Create executable script to allow user to run 'mastermind' directly from their Terminal
* Additional refactoring

## Status
Project is: _completed_

## Contact
Created by
* [@joemecha](https://github.com/joemecha)
* [@ryanstemmle](https://github.com/r-stemmle)

~ feel free to contact us! ~

![Mastermind title image](/img/mastermind_graphic.jpg "Mastermind image")
