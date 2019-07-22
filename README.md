# Dice
A Swift class for dice of any size with or without custom values

Feel free to use this in your work, as long as you attribute the author, as required by GNU General Public License v3.0


#Usage

Include the file in your project

```swift
// Only store each die in a variable
var d5 = DieType(faces: 5) // 5 sided die with values from 1 to 5
var customD5 = DieType(faces: 5, faceValues: [2, 3, 5, 7, 9]) // 5 sided die with the 5 first primes as values
var d6 = DieType() // a common 6 sided die
d5.rollDice(times: 3) 
var d5Rolls = d5.rolls // returns an array of 3 integers  
var d5RollSum = d5.sumRolls // returns the sum of the array
```
