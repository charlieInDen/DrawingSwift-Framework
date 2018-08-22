//
//  Color.swift
//  DrawingSwift
//
//  Created by Nishant Sharma on 8/22/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import Foundation
// Can’t use the shorthand syntax for UIColor raw values
enum Color {
    case red
    case green
    case blue
    case clear
}

// But it’s no problem with manual RawRepresentable conformance
extension Color: RawRepresentable {
    typealias RawValue = UIColor
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case UIColor.red: self = .red
        case UIColor.green: self = .green
        case UIColor.blue: self = .blue
        case UIColor.clear: self = .clear
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .red: return UIColor.red
        case .green: return UIColor.green
        case .blue: return UIColor.blue
        case .clear: return UIColor.clear
        }
    }
}
