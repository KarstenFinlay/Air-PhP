```
                                                 *******
                                 ~             *---*******
                                ~             *-----*******
                         ~                   *-------*******
                        __      _   _!__     *-------*******
                   _   /  \_  _/ \  |::| ___ **-----********   ~
                 _/ \_/^    \/   ^\/|::|\|:|  **---*****/^\_
              /\/  ^ /  ^    / ^ ___|::|_|:|_/\_******/  ^  \
             /  \  _/ ^ ^   /    |::|--|:|---|  \__/  ^     ^\___
           _/_^  \/  ^    _/ ^   |::|::|:|-::| ^ /_  ^    ^  ^   \_
          /   \^ /    /\ /       |::|--|:|:--|  /  \        ^      \
         /     \/    /  /        |::|::|:|:-:| / ^  \  ^      ^     \
   _Q   / _Q  _Q_Q  / _Q    _Q   |::|::|:|:::|/    ^ \   _Q      ^   \
  /_\)   /_\)/_/\\)  /_\)  /_\)  |::|::|:|:::|          /_\)       ^  \
_O|/O___O|/O_OO|/O__O|/O__O|/O__________________________O|/O___________\
////////////////////////////////////////////////////////////////////////
```
# AirPhP
AirPhP is collaborative challenge set by [Makers Academy](www.makers.tech) during week 5 of the bootcamp. It is a web application that echos the basic functionality of [AirBnB](www.airbnb.com).

## User Stories

### MUSTS
```
As a property owner
So that I can list my property
I want to be able to create a new listing
```
```
As a traveller
So that i can pick a property to stay at
I want to be able to see all the listings
```
```
As a traveller
So that I can stay at a property
I want to be able request to hire a listing
```
---
### SHOULDS

```
As a property owner
So that I can add details about my listing
I want to add a description to the listing
```
```
As a property owner
So that my property can be searched
I want to add a name to the listing
```
```
As a property owner
So that a traveller knows how much my property costs
I want to add a cost rate per night to the listing
```
```
As a property owner
So that I can decide whether to proceed with the booking
I want to approve rental requests
```
```
As a traveller
So that I only see available properties
I want listings to exclude booked listing
```
```
As a property owner
So that I can have multiple listings
I want to create multiple listings
```
```
As a property owner
So that I can list my property
I want to register as a user for AirPhP
```
```
As a traveller
So that I can book a property
I want to register as a user for AirPhP
```
## Installation

Use the Ruby package manager [Bundler](https://bundler.io/) to setup your environment after cloning the repository.

```bash
git clone git@github.com:KarstenFinlay/Air-PhP.git

gem install bundle

bundle
```

## Usage

```ruby
require './lib/app.rb'

```

## Approach
We followed a strict [TDD](https://bit.ly/3q65B8q) approach to satisfying the requirements of this challenge. A systematic and iterative cycle of interpreting a series of user stories and developing feature tests/unit tests/feature implmentation/refactoring.

We started off by reviewing the headline specifications and compiled an initial set of [user stories](#userstories) which we further segmented into the [musts](#MUSTS) and [shoulds](#SHOULDS)

## Suggested Improvements
This section outlines known/identified areas of improvement/optimisation that serve as input to future development of this project.

- Suggested imporovement 1.

- Suggested improvement 2.


##  Acknowledgements/Appreciations
- Thanks to [ASCII Art Archive](www.asciiart.eu) for hosting the images we used for our banner.
<<<<<<< HEAD

## Datebase Setup

Step 1. run ```psql```
Step 2. ```CREATE DATABASE airphp```
Step 3. ```\c airphp```
Step 4. Run contents of file db/migrations/01_Create_listings_table.sql
=======
>>>>>>> b0afd47... Updated README.md - MUST user stories amended
