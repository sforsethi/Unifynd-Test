//
//  SecondModel.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 06/11/20.
//

import Foundation

// MARK: - QoutesModelElement
struct QoutesModelElement: Codable {
    let title: String
}

typealias QoutesModel = [QoutesModelElement]
