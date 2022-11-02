//
//  TitleSwitchTableViewCell.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 30/10/22.
//  
//

import UIKit
import TableDirector

final class TitleSwitchTableViewCell: BaseTableViewCell {
    
    // MARK: - Setup
    override func setup(with rowModel: TableRowModel) {
        guard let model = rowModel as? TitleSwitchTableViewCellModel else {
            return
        }
        self.model = model
        
        titleLabel.text = model.title
        stateSwitch.isOn = model.isOn
    }
    
    // MARK: - Action
    @objc func stateSwitchHandler(_ sender: UISwitch) {
        if let model = model,
           let onSwitchValueChanged = model.onSwitchValueChanged {
            onSwitchValueChanged(sender.isOn)
        }
    }
    
    // MARK: - Properties
    private var model: TitleSwitchTableViewCellModel?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stateSwitch: UISwitch = {
        let stateSwitch = UISwitch()
        stateSwitch.addTarget(
            self,
            action: #selector(stateSwitchHandler),
            for: .valueChanged
        )
        stateSwitch.translatesAutoresizingMaskIntoConstraints = false
        return stateSwitch
    }()
    
    // MARK: - Setup Subviews
    override func setupSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(stateSwitch)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(
                equalTo: contentView.leftAnchor,
                constant: 20
            ),
            titleLabel.rightAnchor.constraint(
                equalTo: stateSwitch.leftAnchor,
                constant: -20
            ),
            titleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 20
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -20
            )
        ])
        
        NSLayoutConstraint.activate([
            stateSwitch.rightAnchor.constraint(
                equalTo: contentView.rightAnchor,
                constant: -10
            ),
            stateSwitch.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            )
        ])
    }
}
