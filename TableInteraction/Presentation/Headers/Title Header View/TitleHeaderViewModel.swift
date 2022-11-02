//
//  TitleHeaderViewModel.swift
//  TableInteraction
//
//  Created by Zafar Ivaev on 30/10/22.
//

import Foundation
import TableDirector

public struct TitleHeaderViewModel: TableHeaderFooterModel {
    public var identifier: String = TitleHeaderView.reuseIdentifier
    public let title: String
}
