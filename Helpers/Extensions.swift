//
//  Extensions.swift
//  Quiz
//
//  Created by c035 DIT UPM on 17/11/23.
//

import Foundation
//Para que cuando respondas de igual las mayusculas y los espacios

infix operator =+-= : ComparisonPrecedence

extension String {
    static func =+-=(s1:String, s2:String) -> Bool {
        var a = s1.lowercased().trimmingCharacters(in: .whitespaces)
        var b = s2.lowercased().trimmingCharacters(in: .whitespaces)
        return a==b
    }
}


