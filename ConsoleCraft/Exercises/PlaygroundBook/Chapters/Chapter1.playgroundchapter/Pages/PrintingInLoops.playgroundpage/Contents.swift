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

//#-end-hidden-code

/*:
 
 # Printing In Loops
 
 Printing in loops is a very powerful tool.
 
 For example, the following print statement, embedded in a for-loop will print the same message 12 times:
 
    for _ in 1 ... 12 {
        print("I like to repeat myself...")
    }
 
 will print to the console the message:
 
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
    I like to repeat myself...
 
 Everything inside the double-quotation marks will be printed to the console twelve times.  If we wanted to change the number of times the message was printed to 17, we would simply change the 12 at the end of the for-loop statement to a 17.
 
 --------------------------------------------------------
 
 Try it out yourself.  In the box below, create a for-loop to print the message: *There is no stopping me now!* 27 times to the console at the right.  Then tap the "Run My Code" button below the output console.
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
let correctAnswer = """
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!
There is no stopping me now!

"""

globalOutputString == correctAnswer

//if globalOutputString == correctAnswer {
//    print("YES")
//} else {
//    print("NO")
//}

let allInput = PlaygroundPage.current.text
PlaygroundPage.current.assessmentStatus = makeAssessment(   of: allInput,
                                                            withConsoleOutput: globalOutputString,
                                                            withCorrectAnswer:  correctAnswer,
                                                            withSolution: "````\nfor _ in 1 ... 27 {\n   print(\"There is no stopping me now!\")\n}\n````"
)


//#-end-hidden-code
