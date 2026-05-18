//
//  Item.swift
//  C1 Pressure Calm Application
//
//  Created by Jeany Aurellia on 18/05/26.
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
