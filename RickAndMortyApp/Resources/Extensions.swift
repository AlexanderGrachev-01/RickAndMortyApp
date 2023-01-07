//
//  Extensions.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 08.01.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach{
            addSubview($0)
        }
    }
}
