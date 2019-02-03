//
//  AssessmentUtilities.swift
//  Book_Sources
//
//  Created by WILLIAM CHAPMAN on 2/1/19.
//

import PlaygroundSupport
import Foundation

/*                          ASSESSMENT RESULTS                         */
//public enum AssessmentResults {
//    case pass(message: String)
//    case fail(hints: [String], solution: String?)
//}

//  produces an array of Strings containing each of the user input lines of code
//  ***  FOR ALL SPACES REMOVED VERSION, SEE BELOW  ***
public func findUserCodeInputs(from input: String) -> [String] {
    var inputs: [String] = []
    let scanner = Scanner(string: input)
    
    while scanner.scanUpTo("//#-editable-code", into: nil) {
        var userInput: NSString? = ""
        scanner.scanUpTo("\n", into: nil)
        scanner.scanUpTo("//#-end-editable-code", into: &userInput)
        
        if userInput != nil {
            inputs.append(String(userInput!))
        }
    }
    
    return inputs
}

//  produces a string of the user inputs with all the spaces removed
public func findUserCodeInputsCompressed(from input: String) -> String {
    var inputs = ""
    let scanner = Scanner(string: input)
    
    while scanner.scanUpTo("//#-editable-code", into: nil) {
        var userInput: NSString? = ""
        scanner.scanUpTo("\n", into: nil)
        scanner.scanUpTo("//#-end-editable-code", into: &userInput)
        
        if userInput != nil {
            inputs.append(String(userInput!).replacingOccurrences(of: " ", with: ""))
        }
    }
    
    return inputs
}

public func makeAssessment(of input: String) -> PlaygroundPage.AssessmentStatus {
    let userInputsOnly = findUserCodeInputs(from: input)
    // userInputsOnly
    
    // validate the input; return .fail if needed
    var goodJob = false
    for line in userInputsOnly {
        if line.contains("You are awesome!") { goodJob = true }
    }
    if goodJob {
        return .pass(message: "Good job!  //: [Next Topic](@next)")
    }
    return .fail(hints: ["Try again, please.  Be sure your console matches exactly!"], solution: "print(\"You are awesome!\")")
}

public func makeAssessment(of input: String, withConsoleOutput consoleOutput: String, withCorrectAnswer correctAnswer: String, withSolution solution: String) -> PlaygroundPage.AssessmentStatus {
    let userInputsOnly = findUserCodeInputs(from: input)
    
//    let currentAssessment: PlaygroundPage.AssessmentStatus = (.fail(hints: [""], solution: "")
//    print(consoleOutput)
//    print(correctAnswer)
    
    var goodJob = false
    if consoleOutput == correctAnswer {
        goodJob = true
    }
    // validate the input; return .fail if needed
    
    for line in userInputsOnly {
        if line == correctAnswer { goodJob = true }
    }
    if goodJob {
        return .pass(message: "Great work!  //: [Next Topic](@next)")
    }
    return .fail(hints: ["Try again, please.  Be sure your console matches exactly!"], solution: solution)
}

