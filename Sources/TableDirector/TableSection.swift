//
//  TableSection.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 04/09/22.
//

import Foundation

public class TableSection {
    public var headerModel: TableHeaderFooterModel?
    public var rowModels: [TableRowModel]
    public var footerModel: TableHeaderFooterModel?
    
    public init(
        headerModel: TableHeaderFooterModel? = nil,
        rowModels: [TableRowModel],
        footerModel: TableHeaderFooterModel? = nil
    ) {
        self.headerModel = headerModel
        self.rowModels = rowModels
        self.footerModel = footerModel
    }
}
