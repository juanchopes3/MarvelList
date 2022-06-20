//
//  UIViewController.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//


import UIKit

public extension UIViewController {
    
    static func loadXib<T: UIViewController>() -> T {
        let bundle = Bundle(for: T.self)
        return T(nibName: "\(self)", bundle: bundle)
    }
}

// MARK: - NibName as Controller name

extension UIViewController {
    static var nibName: String { String(describing: Self.self) }
}

