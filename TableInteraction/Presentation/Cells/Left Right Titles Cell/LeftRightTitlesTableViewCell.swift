//
//  LeftRightTitlesTableViewCell.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 30/10/22.
//  
//

import UIKit
import TableDirector

final class LeftRightTitlesTableViewCell: BaseTableViewCell {
    
    // MARK: - Setup
    override func setup(with rowModel: TableRowModel) {
        guard let model = rowModel as? LeftRightTitlesTableViewCellModel else {
            return
        }
        
        leftLabel.text = model.leftTitle
        rightLabel.text = model.rightTitle
    }
    
    // MARK: - Subviews
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .right
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup Subviews
    override func setupSubviews() {
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
        
        leftLabel.setContentHuggingPriority(
            .defaultHigh,
            for: .horizontal
        )
        
        NSLayoutConstraint.activate([
            leftLabel.leftAnchor.constraint(
                equalTo: contentView.leftAnchor,
                constant: 20
            ),
            leftLabel.rightAnchor.constraint(
                equalTo: rightLabel.leftAnchor,
                constant: -10
            ),
            leftLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 20
            ),
            leftLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -20
            )
        ])
        
        NSLayoutConstraint.activate([
            rightLabel.rightAnchor.constraint(
                equalTo: contentView.rightAnchor,
                constant: -20
            ),
            rightLabel.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            )
        ])
    }
}
