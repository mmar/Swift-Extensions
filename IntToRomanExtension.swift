//
//  IntToRomanExtension.swift
//  Swift Extensions
//
//  Created by Matusalem Marques on 2017/10/25.
//
//    MIT License
//
//    Copyright (c) 2017 Matusalem Marques
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import Foundation

extension Int {
    /// Gets the roman numeral representation of the value.
    ///
    /// The representation is guaranteed to be correct only for positive values smaller than 40,000.
    ///
    /// Uses the latin letters I, V, X, L, C, D, M as recommended in the
    /// [Unicode Specification, chapter 22, page 798](http://www.unicode.org/versions/Unicode10.0.0/ch22.pdf#G46463),
    ///  and the symbols U+2181 and U+2182.
    /// - Returns: A `String` containing the roman numeral representation of this value or
    ///            `nil` if the value is negative or zero.
    /// - Warning: This method may use very large amounts of memory for very large values.
    func toRoman() -> String? {
        guard self > 0 else { return nil }
        return repeatElement("I", count: self).joined()
            .replacingOccurrences(of: "IIIII", with: "V")
            .replacingOccurrences(of: "IIII", with: "IV")
            .replacingOccurrences(of: "VV", with: "X")
            .replacingOccurrences(of: "VIV", with: "IX")
            .replacingOccurrences(of: "XXXXX", with: "L")
            .replacingOccurrences(of: "XXXX", with: "XL")
            .replacingOccurrences(of: "LL", with: "C")
            .replacingOccurrences(of: "LXL", with: "XC")
            .replacingOccurrences(of: "CCCCC", with: "D")
            .replacingOccurrences(of: "CCCC", with: "CD")
            .replacingOccurrences(of: "DD", with: "M")
            .replacingOccurrences(of: "DCD", with: "CM")
            .replacingOccurrences(of: "MMMMM", with: "\u{2181}")
            .replacingOccurrences(of: "MMMM", with: "M\u{2181}")
            .replacingOccurrences(of: "\u{2181}\u{2181}", with: "\u{2182}")
            .replacingOccurrences(of: "\u{2181}M\u{2181}", with: "M\u{2182}")
    }
}
