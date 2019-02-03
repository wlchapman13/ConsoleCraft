//#-hidden-code
import PlaygroundSupport
import Foundation

var globalOutputString = "" //  string variable to hold output

func print(_ items: Any...) {
    var stringOutput = ""
    for item in items {
        stringOutput.append(String(describing: item))
    }
    Swift.print(stringOutput, to: &globalOutputString)
}

func print(_ items: Any..., terminator: String = "/n") {
    Swift.print(items, terminator: terminator, to: &globalOutputString)
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

func assess(currentCode: String) -> PlaygroundPage.AssessmentStatus {
    
    let currentAssessment: PlaygroundPage.AssessmentStatus = (.fail(hints: [""], solution: ""))
    
    let solutionString = """
        let menuItem = 26
        let pizzaName = "Large Pepperoni"
        var cost = 17.99
        print("Menu item \\(menuItem) is a \\(pizzaName) pizza.  It costs $\\(cost).")

    """
    let correctOutput = "Menu item 26 is a Large Pepperoni pizza.  It costs $17.99.\n"
    var currentHint = ""
    
    let compressedUserInput = findUserCodeInputsCompressed(from: currentCode)
    
    if compressedUserInput.contains("varmenuItem=26") {
        currentHint = "menuItem should be a constant."
        return .fail(hints: [currentHint], solution: solutionString)
    }
    if compressedUserInput.contains("varpizzaName=\"LargePepperoni\"") {
        currentHint = "pizzaName should be a constant."
        return .fail(hints: [currentHint], solution: solutionString)
    }
    if compressedUserInput.contains("letcost=17.99") {
        currentHint = "cost should be a variable."
        return .fail(hints: [currentHint], solution: solutionString)
    }
    
    if !compressedUserInput.contains("letmenuItem=26") {
        currentHint = "You must include a constant menuItem assigned to a value of 26"
        return .fail(hints: [currentHint], solution: solutionString)
    }
    if !compressedUserInput.contains("letpizzaName=\"LargePepperoni\"") {
        currentHint = "You must include a constant pizzaName assigned to a value of \"Large Pepperoni\""
        return .fail(hints: [currentHint], solution: solutionString)
    }
    if !compressedUserInput.contains("varcost=17.99") {
        currentHint = "You must include a variable cost assigned to a value of 17.99"
        return .fail(hints: [currentHint], solution: solutionString)
    }
    
    if globalOutputString != correctOutput {
        currentHint = "Try again, please.  Be sure your console output matches exactly!"
        return .fail(hints: [currentHint], solution: solutionString)
    }
    
    return .pass(message: "Great work!  //: [Next Topic](@next)")
}

//#-end-hidden-code

/*:
 
 # Printing Values
 
 If you have constants or variables defined and want to print them embedded in a message, you will use *String Iterpolation*.
 
 For example, if we have the following constants and variables defined:
 
    var currentYear = 2019
    let birthMonth = "May"
    let birthDay = 23
 
 and we would like to print the message:
 
    My birthday this year will be on the 23rd day of May, 2019.
 
 we can use the following print statement:
 
    print("My birthday this year will be on the \(birthDay)rd day of \(birthMonth), \(currentYear).")
 
 Notice how using backslash-open-close parentheses "\(...)" to enclose a variable name in the above string being printed will cause the current value of the constants and variables to be embedded in the printed string in the appropriate places.
 
 --------------------------------------------------------
 
 Try it out yourself.  In the box below, create a variable called 'cost' and assign it the value of 17.99.  Next, create a constant called 'pizzaName' and assign it the value of "Large Pepperoni" and a constant called 'menuItem' and assign it the value 26.
 
 Use a print statement, the constants and variables you created and string interpolation to print the following message:
 
    Menu item 26 is a Large Pepperoni pizza.  It costs $17.99.
 
 Be very careful to get all the punctuation and upper- and lower-case characters correct.
 
 */

//#-editable-code
// Add your code here

//#-end-editable-code

/*:
 Tap the "Run My Code" button below the output console.
 */

//#-hidden-code

//  send the entire contents of the user-provided swift code to the live view
//  (i.e., PlaygroundPage.current.text)



// override the standard print function to write the output to a string (s)
//private func print(_ items: Any...) {
//    var stringItems = [String]()
//    for item in items {
//        stringItems.append(String(describing: item))
//    }
//    print(stringItems, to: &s)
//}



let page = PlaygroundPage.current
if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
    // let proxyMessage = PlaygroundValue.string(PlaygroundPage.current.text)
    let proxyMessage = PlaygroundValue.string(globalOutputString)
    
    proxy.send(proxyMessage)
    // print("Source: " + PlaygroundPage.current.text)
}
//if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
//    let consoleMessage = PlaygroundValue.string(PlaygroundPage.current.text)
//    proxy.send(consoleMessage)
//    print("Console: " + consoleMessage)
//}

globalOutputString
let correctAnswer = "Menu item 26 is a Large Pepperoni pizza.  It costs $17.99.\n"

globalOutputString == correctAnswer

//if globalOutputString == correctAnswer {
//    print("YES")
//} else {
//    print("NO")
//}

//let allInput = PlaygroundPage.current.text
//let compressedUserInput = findUserCodeInputsCompressed(allInput)

// let currentAssessment: PlaygroundPage.AssessmentStatus = (.fail(hints: [""], solution: ""))

//var goodJob = false
//for line in userInputsOnly {
//    if line.contains("You are awesome!") { goodJob = true }
//}
//if goodJob {
//    return .pass(message: "Good job!  //: [Next Topic](@next)")
//}

//PlaygroundPage.current.assessmentStatus = makeAssessment(   of: allInput,
//                                                            withConsoleOutput: globalOutputString,
//                                                            withCorrectAnswer:  correctAnswer,
//                                                            withSolution: "`print(\"Menu item \(menuItem) is a \(pizzaName) pizza.  It costs $\\(cost).\")`")

PlaygroundPage.current.assessmentStatus = assess(currentCode: PlaygroundPage.current.text)

//#-end-hidden-code
