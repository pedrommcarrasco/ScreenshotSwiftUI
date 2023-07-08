//
//  ScreenshotMakerUIView.swift
//  
//
//  Created by Gualtiero Frigerio on 30/01/22.
//

import UIKit

/// This UIView implements  the ScreenshotMaker protocol
/// to take screenshots of its anchestor in a UIImage
/// This UIView is added via UIViewRepresentable to a SwiftUI View
public class ScreenshotMakerUIView: UIView, ScreenshotMaker {
    /// Takes the screenshot of the superview of this superview
    /// - Returns: The UIImage with the screenshot of the view
    public func screenshot() -> UIImage? {
        guard let containerView = self.superview?.superview,
              let containerSuperview = containerView.superview else { return nil }

        return UIGraphicsImageRenderer(bounds: containerView.frame).image { (context) in
            let clippingPath = UIBezierPath(roundedRect: containerView.frame, cornerRadius: 50)
            clippingPath.addClip()
//            context.cgContext.addPath(clippingPath)
//            context.cgContext.clip(using: .evenOdd)
            containerSuperview.layer.render(in: context.cgContext)
            
            
//            et rounded = UIBezierPath(roundedRect: rect, cornerRadius: radius)
//                        rounded.addClip()
        }
    }
}
