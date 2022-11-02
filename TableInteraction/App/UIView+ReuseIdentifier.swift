//
//  UIView+ReuseIdentifier.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 02/11/22.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
