//
//  ArrayExtension.swift
//  pet
//
//  Created by Isa Melsov on 23/11/24.
//

import Foundation

// MARK - Расширение для Array

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
