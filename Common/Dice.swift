//
//  Dice.swift
//  
//
//  Created by Tore L. Tangen on 03/05/15.
//
//  This work is licensed under a Creative Commons Attribution 4.0 International License.
//
//

import Darwin

public class DieType {
    // ----------------------------------
    //  Variables and constants
    // ----------------------------------
    public let faceValues: [Int]
    public let faces: Int
    public private(set) var rolls = [Int]()
    public private(set) var sumRolls = 0
    
    public var description: String {
        get {
            if faceValues==[] {
                return "d\(faces)"
            } else {
                return "d\(faces) with the face values of "+faceValues.sorted({$0<$1})
            }
        }
    }

    // ----------------------------------
    //  Initializers
    // ----------------------------------
    public init(faces: Int = 6) {
        self.faces = faces
        faceValues = []
    }
    
    public init(faces: Int = 6, faceValues: [Int]) {
        self.faces = faces
        self.faceValues = faceValues
    }
    
    // ----------------------------------
    //  Functions
    // ----------------------------------
    public func rollDice(times: Int = 1) {
        // ----------------------------------
        //  nested functions
        // ----------------------------------
        //  roll each die
        func rollDie() -> Int {
            return Int(1 + arc4random_uniform(UInt32(faces)))
        }
        
        //  check for conversion of faces
        func mustConvert() -> Bool {
            return !faceValues.isEmpty
        }
        
        // ----------------------------------
        //  main function
        // ----------------------------------
        //  reset rolls list
        rolls = []
        
        //  roll one or many?
        if times == 1 {
            //  roll one die
            rolls.append(rollDie())
            if mustConvert() {
                //  convert value
                rolls[0] = faceValues[rolls[0]]
            }
            //  sum rolled value
            sumRolls = rolls[0]
        } else {
            //  roll multiple dice
            for _ in 1...times {
                //  roll each die
                rolls.append(rollDie())
            }
            if mustConvert() {
                //  convert value
                for value in 0..<times {
                    rolls[value] = faceValues[rolls[value]]
                }
            }
            //  sum rolled value
            sumRolls = rolls.reduce(0, combine: {$0 + $1})
        }
    }
    
    
}