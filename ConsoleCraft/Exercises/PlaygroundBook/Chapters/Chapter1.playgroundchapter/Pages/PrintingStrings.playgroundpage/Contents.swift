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
 
 # Print Statements
 
 Swift print statements let you to print messages to the output console.  You can print simple messages to note something to yourself.
 
 For example, the following print statement:
 
    print("Hello there, you awesome Swift programmer!")
 
 will print to the console the message:
 
    Hello there, you awesome Swift programmer!
 
 Everything inside the double-quotation marks will print to the console as the message.  We call this type of message a *String* message.  A *String* in Swift is a sequence of characters and it is defined as the string of characters contained within a set of double quotation marks ("some string").
 
 --------------------------------------------------------
 
 Try it out yourself.  In the box below, enter a Swift `print` statement to print the message: *You are awesome!* to the console at the right.  Then tap the "Run My Code" button below the output console.
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
    print("Source: " + PlaygroundPage.current.text)
}
//if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
//    let consoleMessage = PlaygroundValue.string(PlaygroundPage.current.text)
//    proxy.send(consoleMessage)
//    print("Console: " + consoleMessage)
//}



let allInput = PlaygroundPage.current.text
PlaygroundPage.current.assessmentStatus = makeAssessment(of: allInput)


//#-end-hidden-code
