//
//  BaseTableViewCell.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 04/09/22.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupSubviews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        setupSubviews()
    }
    
    open func setupSubviews() {
        fatalError("Method must be overriden")
    }
    
    open func setup(with rowModel: TableRowModel) {
        fatalError("Method must be overriden")
    }
}
