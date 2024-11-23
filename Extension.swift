//
//  Extension.swift
//  pet
//
//  Created by Isa Melsov on 21/11/24.
//

import Foundation
import UIKit

extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        guard let attributedText = label.attributedText else { return false }
        
        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: label.bounds.size)
        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        let locationOfTouchInLabel = location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textOffset = CGPoint(
            x: (label.bounds.size.width - textBoundingBox.size.width) / 2 - textBoundingBox.origin.x,
            y: (label.bounds.size.height - textBoundingBox.size.height) / 2 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textOffset.x,
            y: locationOfTouchInLabel.y - textOffset.y
        )
        let indexOfCharacter = layoutManager.characterIndex(
            for: locationOfTouchInTextContainer,
            in: textContainer,
            fractionOfDistanceBetweenInsertionPoints: nil
        )
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}

//#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
//public typealias UIViewController = UIHostingController<Content>
//#else
//public typealias UIViewController = UIHostingController<Content>
//#endif