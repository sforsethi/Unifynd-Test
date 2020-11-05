//
//  FirstModel.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 05/11/20.
//

import Foundation

// MARK: - AddOnModelElement
struct AddOnModelElement: Codable {
    let title, subtitle: String
}

typealias AddOnModel = [[AddOnModelElement]]
