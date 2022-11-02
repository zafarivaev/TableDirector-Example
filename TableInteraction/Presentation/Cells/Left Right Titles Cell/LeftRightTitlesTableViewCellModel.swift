//
//  LeftRightTitlesTableViewCellModel.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 30/10/22.
//  
//

import UIKit
import TableDirector

public struct LeftRightTitlesTableViewCellModel: TableRowModel {
    public let identifier = LeftRightTitlesTableViewCell.reuseIdentifier
    
    public let leftTitle: String
    public let rightTitle: String
    public var onSelection: (() -> Void)?
}
