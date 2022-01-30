//
//  ScreenshotMakerUIView.swift
//  
//
//  Created by Gualtiero Frigerio on 30/01/22.
//

import UIKit

public class ScreenshotMakerUIView: UIView, ScreenshotMaker {
    /// Takes the screenshot of the superview of this superview
    /// - Returns: The UIImage with the screenshot of the view
    public func screenshot() -> UIImage? {
        guard let containerView = self.superview?.superview,
              let containerSuperview = containerView.superview else { return nil }
        let renderer = UIGraphicsImageRenderer(bounds: containerView.frame)
        return renderer.image { (context) in
            containerSuperview.layer.render(in: context.cgContext)
        }
    }
}
