//
//  ConsoleView.swift
//  Book_Sources
//
//  Created by WILLIAM CHAPMAN on 1/30/19.
//

import UIKit

class ConsoleView: UITextView, UITextViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    private func setupView() {
        font = UIFont(name: "CourierNewPS-BoldMT", size: 16.0)
        backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.8, alpha: 1.0)
        self.delegate = self
    }
    
    func animateText(stringToPrint: String) {
        
        let origText = stringToPrint
        let numberOfCharacters = stringToPrint.count
        print(numberOfCharacters)
        var i = 0
        let beginningIndex = stringToPrint.startIndex
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            
            let tempIndex = stringToPrint.index(beginningIndex, offsetBy: i)
            let newChar = origText[tempIndex]
            self.text.append(newChar)
            // self.simple_scrollToBottom()
            if self.textExceedBoundsOf(self) {
                //  move content view to bottom
                let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
                self.setContentOffset(bottomOffset, animated: false)
            }
            if i >= numberOfCharacters-1 {
                timer.invalidate()
            }
            i += 1
        }
    }
    
    func textExceedBoundsOf(_ textView: UITextView) -> Bool {
        return textView.contentSize.height > self.bounds.height
    }
    

}
