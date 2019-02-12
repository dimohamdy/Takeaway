//
//  Storyboard+Extension.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/2/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case main = "Main"
}

extension UIViewController {
    class func instantiateFromStoryboard<T>(_ stroybaord: AppStoryboard = .main) -> T {
        let storyboard = UIStoryboard(name: stroybaord.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
    }
}

extension UIStoryboard {
    class func instantiateInitialViewController(_ board: AppStoryboard) -> UIViewController {
        let story = UIStoryboard(name: board.rawValue, bundle: nil)
        return story.instantiateInitialViewController()!
    }
}
