//
//  BaseHeaderFooterView.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 04/09/22.
//

import UIKit

open class BaseHeaderFooterView: UITableViewHeaderFooterView {
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    open func setupSubviews() {
        fatalError("Method must be overriden")
    }
    
    open func setup(with headerFooterModel: TableHeaderFooterModel) {
        fatalError("Method must be overriden")
    }
}
