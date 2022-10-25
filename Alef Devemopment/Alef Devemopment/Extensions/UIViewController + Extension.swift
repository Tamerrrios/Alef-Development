//
//  UIViewController + Extension.swift
//  Alef Devemopment
//
//  Created by Temur Juraev on 25.10.2022.
//

import UIKit


@objc public extension UIViewController {
    func setupSubView() {
        constructHierarchy()
        activateConstraints()
    }
    
    func constructHierarchy() {}
    func activateConstraints() {}
}
