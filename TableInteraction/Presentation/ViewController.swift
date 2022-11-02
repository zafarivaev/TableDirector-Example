//
//  ViewController.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 04/09/22.
//

import UIKit
import TableDirector

class ViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        
        setupSubviews()
        setupSections()
    }
    
    // MARK: - Properties
    private lazy var tableDirector = TableDirector(
        tableView: tableView
    )
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var isSwitchOn: Bool = true
    
    // MARK: - Setup Subviews
    private func setupSubviews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(
                equalTo: view.leftAnchor
            ),
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.rightAnchor.constraint(
                equalTo: view.rightAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
    
    // MARK: - Sections
    func setupSections() {
        tableDirector.sections = [
            createFirstSection(),
            createSecondSection()
        ]
    }
    
    func createFirstSection() -> TableSection {
        return TableSection(
            headerModel: TitleHeaderViewModel(
                title: "Header 1"
            ),
            rowModels: [
                createLeftRightCellModel(
                    leftTitle: "Left 1",
                    rightTitle: "Right 1"
                ),
                createLeftRightCellModel(
                    leftTitle: "Left 2",
                    rightTitle: "Right 2"
                ),
                createLeftRightCellModel(
                    leftTitle: "Left 3",
                    rightTitle: "Right 3"
                )
            ]
        )
    }
    
    func createLeftRightCellModel(
        leftTitle: String,
        rightTitle: String
    ) -> LeftRightTitlesTableViewCellModel {
        return LeftRightTitlesTableViewCellModel(
            leftTitle: leftTitle,
            rightTitle: rightTitle,
            onSelection: {
                print(leftTitle, rightTitle)
            }
        )
    }
    
    func createSecondSection() -> TableSection {
        return TableSection(
            headerModel: TitleHeaderViewModel(
                title: "Header 2"
            ),
            rowModels: [
                TitleSwitchTableViewCellModel(
                    title: "Is Enabled",
                    isOn: isSwitchOn,
                    onSwitchValueChanged: { [weak self] isOn in
                        self?.isSwitchOn = isOn
                    }
                )
            ]
        )
    }
}

