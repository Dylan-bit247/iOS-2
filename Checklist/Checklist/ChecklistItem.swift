//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Dylan Macdonald on 10/7/21.
//

import Foundation


struct ChecklistItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var isChecked: Bool = false
}
