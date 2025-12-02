//
//  Item.swift
//  Brain Check
//
//  Created by Leonardo Amato Regis de Farias on 12/2/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
