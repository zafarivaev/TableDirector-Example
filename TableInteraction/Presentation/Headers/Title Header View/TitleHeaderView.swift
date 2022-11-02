//
//  TitleHeaderView.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 30/10/22.
//

import UIKit
import TableDirector

final class TitleHeaderView: BaseHeaderFooterView {
    
    // MARK: - Setup
    override func setup(with headerFooterModel: TableHeaderFooterModel) {
        guard let model = headerFooterModel as? TitleHeaderViewModel else {
            return
        }
        
        titleLabel.text = model.title
    }
    
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup Subviews
    override func setupSubviews() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(
                equalTo: leftAnchor,
                constant: 20
            ),
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 20
            ),
            titleLabel.rightAnchor.constraint(
                equalTo: rightAnchor,
                constant: -20
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -20
            )
        ])
    }
}
