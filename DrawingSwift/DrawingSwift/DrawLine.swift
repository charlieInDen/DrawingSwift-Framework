//
//  DrawLine.swift
//  DrawingSwift
//
//  Created by Nishant Sharma on 8/22/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import Foundation
enum DrawLine {
    case kDefaultLineWidth
    case kDefaultLineAlpha
}
extension DrawLine: RawRepresentable {
    typealias RawValue = Float
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case 10.0: self = .kDefaultLineWidth
        case 1.0: self = .kDefaultLineAlpha
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .kDefaultLineWidth: return 10.0
        case .kDefaultLineAlpha: return 1.0
        }
    }
}
