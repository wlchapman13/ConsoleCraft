//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  An auxiliary source file which is part of the book-level auxiliary sources.
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import PlaygroundSupport

@objc(Book_Sources_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    @IBOutlet weak var questionPromptLabel: UILabel!
    @IBOutlet weak var consoleView: ConsoleView!
    @IBOutlet weak var diagLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        questionPromptLabel.text = "Console output:"
    }
    
    /*
    public func liveViewMessageConnectionOpened() {
        // Implement this method to be notified when the live view message connection is opened.
        // The connection will be opened when the process running Contents.swift starts running and listening for messages.
    }
    */

    /*
    public func liveViewMessageConnectionClosed() {
        // Implement this method to be notified when the live view message connection is closed.
        // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
        // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
    }
    */
    
    public func receive(_ message: PlaygroundValue) {
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
        
        if case let .string(text) = message {
            //  eventually set up a UILabel to display the message that got sent, but for now,
            //  let's just change the background color
            self.view.backgroundColor = UIColor.blue
            self.diagLabel.text = text
            consoleView.text = ""
            consoleView.animateText(stringToPrint: text)

        }

    }
    
}
