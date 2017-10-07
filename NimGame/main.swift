//
//  main.swift
//  NimGame
//
//  Created by Fnu Frangky on 10/6/17.
//  iOS Programming
//  Lab 1
//  Copyright © 2017 Fnu Frangky. All rights reserved.
//

import Foundation


//Each pile is given a random amount of chiips in the range of 5-10
var pileA = Int(arc4random_uniform(6) + 5)
var pileB = Int(arc4random_uniform(6) + 5)
var pileC = Int(arc4random_uniform(6) + 5)
var totalPile = pileA + pileB + pileC
print(totalPile)

//declare global variables
var pileChoice = ""
var remove: Int

//Boolean var to decide to play either the basic or row version of the game;
var styleChoice = false;

//This is being declared for ease in loops. it is clearer in the if/selse
var pileInt = 0

//WELCOME MSG
print("WELCOME TO THE NIM GAME")

//Player 1 enters their name
print("\nPlayer 1, please enter your name ")
let player1 = readLine()
print(player1!)

//Player 2 enters their name
print("\nPlayer 2, please enter your name ")
let player2 = readLine()
print(player2!)

//asks the player what style game they want to play
print("Would you like to play the basic or the row version? ")
var style = readLine()

while (style?.lowercased() != "basic" && style?.lowercased() != "row") {
    print("Please enter either \"basic\" or \"row\": ")
    style = readLine()
}

//if this is true, then the styleChoice variable goes to true and the basic version is selected
styleChoice = style?.lowercased() == "basic"

//in this, we will initialize the first player to odd number and the second player to even numbers.
//So player 1 goes first with this new variable
var playerOrder = 1;

while totalPile != 0 {
    if styleChoice {
        print("\nA: \(pileA) \tB: \(pileB) \tC: \(pileC) \n")
    } //end if
    else {
        //These 3 loops display each pile with asterisk instead of numbers.
        //the number representation is also being used for ease of access.
        print("\nA: ",terminator:"")
        for _ in 0..<pileA {
            print("*",terminator:"")
        }
        print("\nB: ",terminator:"")
        for _ in 0..<pileB {
            print("*",terminator:"")
        }
        print("\nC: ",terminator:"")
        for _ in 0..<pileC {
            print("*",terminator:"")
        }
        print("\n")
    } // end else
    
    //this if/else switches between player 1 and 2, which is why mod 2 is used
    if playerOrder%2 != 0 {
        repeat {
            print("\(player1!), choose pile 'A', 'B', 'C': ")
            //using a char for the pile choice since strings are immutable
            pileChoice = (readLine()?.uppercased())!
        } while (pileChoice != "A" && pileChoice != "B" && pileChoice != "C")
        
        //This makes it easier to see if a user entered an invalid amount of
        //chips to remove in the selected pile.
        switch pileChoice {
        case "A":
            pileInt = pileA
        case "B":
            pileInt = pileB
        default:
            pileInt = pileC
        } // end switch
    
    
    //This checks to see if the pile is empty or not
    while pileInt == 0 {
        print("Please choose a different pile since \(pileChoice) has no chips left: ")
        pileChoice = (readLine()?.uppercased())!
        
        //Again, another check to see if a valid pile is chosen.
        while (pileChoice != "A" && pileChoice != "B" && pileChoice != "C") {
            print("There is no pile \(pileChoice)! Please choose either 'A', 'B', or 'C': ")
            pileChoice = (readLine()?.uppercased())!
        }// end while
        
        switch pileChoice {
        case "A":
            pileInt = pileA
        case "B":
            pileInt = pileB
        default:
            pileInt = pileC
        } //end switch
    } // end while pileInt == 0
    
    //This asks the player to select an amount of chips to remove.
    print("How many to remove from pile \(pileChoice)? ");
    remove = Int(readLine()!)!
    
    //Checks to see if there are that many chips in the selected pile.
    //If not, it asks the player to choose another number.
    //This also checks to see if the input is 0 or negative (which is not allowed)
    //I used one while loop for conciseness
    while remove > pileInt || remove <= 0 {
        if (remove > pileInt) {
            print("There are no \(remove) chips in pile \(pileChoice). Please choose another number: ")
            remove = Int(readLine()!)!
        } else if remove <= 0 { //if remove is a negative num
            print("Please choose a number greater than 0: ");
            remove = Int(readLine()!)!
        }
    }// end while remove > pileInt
    
    //This updates the pile amount
    switch pileChoice {
    case "A":
        pileA = pileA - remove;
    case "B":
        pileB = pileB - remove;
    default:
        pileC = pileC - remove;
    }
    
    //Change player
    playerOrder += 1;
    } //end if
    else { //player2's turn
        repeat {
            print("\(player2!), choose pile 'A', 'B', 'C': ")
            //using a char for the pile choice since strings are immutable
            pileChoice = (readLine()?.uppercased())!
        } while (pileChoice != "A" && pileChoice != "B" && pileChoice != "C")
        
        //This makes it easier to see if a user entered an invalid amount of
        //chips to remove in the selected pile.
        switch pileChoice {
        case "A":
            pileInt = pileA
        case "B":
            pileInt = pileB
        default:
            pileInt = pileC
        } // end switch
        
        //This asks the player to select an amount of chips to remove.
        print("How many to remove from pile \(pileChoice)? ");
        remove = Int(readLine()!)!
        
        //Checks to see if there are that many chips in the selected pile.
        //If not, it asks the player to choose another number.
        //This also checks to see if the input is 0 or negative (which is not allowed)
        //I used one while loop for conciseness
        while remove > pileInt || remove <= 0 {
            if (remove > pileInt) {
                print("There are no \(remove) chips in pile \(pileChoice). Please choose another number: ")
                remove = Int(readLine()!)!
            } else if remove <= 0 { //if remove is a negative num
                print("Please choose a number greater than 0: ");
                remove = Int(readLine()!)!
            }
        }// end while remove > pileInt
        
        //This updates the pile amount
        switch pileChoice {
        case "A":
            pileA = pileA - remove;
        case "B":
            pileB = pileB - remove;
        default:
            pileC = pileC - remove;
        }
        
        //Change player
        playerOrder += 1;
    }// end player 2's turn
    
    //totalPile is updated again, since it cannot be updated above
    totalPile = pileA + pileB + pileC;
    
    //Checks to see if there is 1 chip left
    if totalPile == 1 {
        //playerOrder check is used again to see which player is up, and therefore the loser.
        if playerOrder % 2 != 0 {
            print("\n\(player1!), you must take the last remaining chip, so you lose. \(player2!.uppercased()) WINS!\n")
            totalPile = 0
        } else {
            print("\n\(player2!), you must take the last remaining chip, so you lose. \(player1!.uppercased()) WINS!\n")
            totalPile = 0
        }
    }
    //This checks to see if the last player took the last chip mistakenly (or maybe on purpose...)
    else if totalPile == 0 {
        if playerOrder % 2 != 0 {
            print("\nWell that was a dumb move...you just took all of the remaining chips. \(player1!.uppercased()) WINS!\n")
        } else {
            print("\nWell that was a dumb move...you just took all of the remaining chips. \(player2!.uppercased()) WINS!\n")
        }
    }
} // end while








