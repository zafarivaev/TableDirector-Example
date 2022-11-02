//
//  TableRowModel.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 04/09/22.
//

import Foundation

public protocol TableRowModel {
    var identifier: String { get }
    var onSelection: (() -> Void)? { get }
}

public extension TableRowModel {
    var onSelection: (() -> Void)? {
        return nil
    }
}
