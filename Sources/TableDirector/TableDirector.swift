//
//  TableDirector.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 04/09/22.
//

import UIKit

public final class TableDirector: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    public weak var tableView: UITableView?
    public var sections: [TableSection] = [] {
        didSet {
            let allRowModels = sections.flatMap { $0.rowModels }
            let allHeaderModels = sections.compactMap { $0.headerModel }
            let allFooterModels = sections.compactMap { $0.footerModel }
            
            allRowModels.forEach { rowModel in
                tableView?.register(classFromString(rowModel.identifier), forCellReuseIdentifier: rowModel.identifier)
            }
            
            allHeaderModels.forEach { headerModel in
                tableView?.register(classFromString(headerModel.identifier), forHeaderFooterViewReuseIdentifier: headerModel.identifier)
            }
            
            allFooterModels.forEach { footerModel in
                tableView?.register(classFromString(footerModel.identifier), forHeaderFooterViewReuseIdentifier: footerModel.identifier)
            }
            tableView?.reloadData()
        }
    }
    
    public var onCellSelection: ((IndexPath) -> ())?
    public var onCellWillDisplay: ((IndexPath) -> ())?

    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    // MARK: - Helper methods
    
    private func classFromString(_ className: String) -> AnyClass? {
        let namespace = Bundle.main.infoDictionary![
            "CFBundleExecutable"
        ] as! String
        let className: AnyClass? = NSClassFromString("\(namespace).\(className)")
        return className
    }
    
    // MARK: - Data Source methods
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rowModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let rowModel = section.rowModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: rowModel.identifier,
            for: indexPath
        ) as? BaseTableViewCell else {
            fatalError("Incorrectly configured cell")
        }
        cell.setup(with: rowModel)
        return cell
    }
    
    // MARK: - Delegate methods
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onCellSelection?(indexPath)
        if let onSelection = sections[indexPath.section]
            .rowModels[indexPath.row]
            .onSelection {
            onSelection()
        }
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        onCellWillDisplay?(indexPath)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let headerModel = sections[section].headerModel
        else {
            return nil
        }
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerModel.identifier) as? BaseHeaderFooterView else {
            return nil
        }
        headerView.setup(with: headerModel)
        return headerView
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard
            let footerModel = sections[section].footerModel
        else {
            return nil
        }
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerModel.identifier) as? BaseHeaderFooterView else {
            return nil
        }
        footerView.setup(with: footerModel)
        return footerView
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            if #available(iOS 14.0, *) {
                header.backgroundConfiguration = .listPlainHeaderFooter()
                header.backgroundConfiguration?.backgroundColor = .white
            } else {
                header.backgroundColor = .white
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if sections[section].headerModel != nil {
            return UITableView.automaticDimension
        }
        return 1
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if sections[section].footerModel != nil {
            return UITableView.automaticDimension
        }
        return 1
    }
}
