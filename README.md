# Gif of Life - A Game of Life Simulation

![alt tag](https://github.com/rockarts/gif-of-life/blob/master/lib/images/logo.gif)

## Environment Requirements

Built using Ruby 2.0.0 and Gosu. To run the app, go to the lib directory and run the command: 
ruby gif_of_life.rb

## Music
- Music: Main song is Sanity Not Included by http://ozzed.net available on the album Nackskott http://ozzed.net/music/Nackskott.shtml

## Task
 
You are going to create a Gif pronunciation simulator. To do so, please implement the following methods:

### Simulator#initialize(seating_arrangement)

- `seating_arrangement` is an array of array which represents the people in the initial seating arrangement

- Each element in the inner array is one of: `:hard`, `:soft`, or `:none`

### Simulator#verdict

- If the majority of opinionated people think it is a hard g it returns `:hard`

- If the majority of opinionated people think it is a soft g it returns `:soft`

- If the opinions are equal then return :push

### Simulator#state

- Returns an array of arrays that represents the people in the current seating arrangement

- Each element in the inner array is one of: `:hard`, `:soft`, or `:none`

### Simulator#next

- Updates the opinions of all of the people in the seating arrangement based on the rules below

#### Rules

- If a person with an opinion has fewer than 2 opinionated neighbours then they stop having an opinion since there is not enough people to argue with. 

- If a person with an opinion has more than 3 opinionated neighbours then they stop having an opinion since their opinion is drowned out by their neighbours. 

- If a person without an opinion has exactly 3 opinionated neighbours and at least 2 of them think "Gif" is pronounced with a hard G then they form an opinion that it is pronounced with a hard G

- If a person without an opinion has exactly 3 opinionated neighbours and at least 2 of them think "Gif" is pronounced with a soft G then they form an opinion that it is pronounced with a soft G

#### Assumptions 
- There will be an NxM seating arrangement
- A neighbour is an adjacent person in the seating arrangement (including diagonals)
- There are hard edges in the seating arrangement. (No wrapping around)
- Each person can either think Gif is pronounced with a hard G, a soft G, or they can not have an opinion
- All state transitions happen simultaneously

## Tests

- There is a spec (`spec/simulator_spec.rb`) that outlines some basic scenarios to help you get started. We'd love it if you added some more tests. 

- This can be run via `bundle exec rspec spec/simulator_spec.rb`
