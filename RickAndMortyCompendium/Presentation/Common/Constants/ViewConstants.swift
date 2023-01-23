//
//  ViewConstants.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

struct ViewContants {
    
    struct fonts {
        static let heyComic = "Hey Comic"
    }
    
    struct corner {
        static let right: CACornerMask = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        static let down: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    struct cornerRadius {
        static let sixteen: CGFloat = 20
        static let eight: CGFloat = 8
    }
    
}
