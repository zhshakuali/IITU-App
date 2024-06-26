//
//  Extensions.swift
//  IITU App
//
//  Created by Жансая Шакуали on 30.03.2024.
//

import Foundation
import UIKit

extension UIView {
    
    var width1: CGFloat {
        
        return frame.size.width
    }
    
    var height1: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width1
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + height1
    }
}
