//
//  TitleSwitchTableViewCellModel.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 30/10/22.
//  
//

import UIKit
import TableDirector

public struct TitleSwitchTableViewCellModel: TableRowModel {
    public var identifier = TitleSwitchTableViewCell.reuseIdentifier
    
    public let title: String
    public let isOn: Bool
    public var onSwitchValueChanged: ((Bool) -> Void)?
}
