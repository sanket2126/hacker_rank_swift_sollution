//: [Previous](@previous)

import Foundation

//MARK: You will be given a list of 32 bit unsigned integers. Flip all the bits (1->0 and 0->1) and return the result as an unsigned integer.

extension BinaryInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        var counter = 0

        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
            counter += 1
            if counter % 4 == 0 {
                binaryString.insert(contentsOf: "", at: binaryString.startIndex)
            }
        }

        return binaryString
    }
}

func flippingBits(n: Int) -> Int {
    let i32 = Int32(truncating: n as NSNumber)
    let f1 = i32.binaryDescription.replacingOccurrences(of: "1", with: "2")
    let f2 = f1.replacingOccurrences(of: "0", with: "1").replacingOccurrences(of: "2", with: "0")

    let inverted = Int(f2, radix: 2)
    return inverted ?? 0
}

/*
 INPUT
 2147483647
 1
 0
 
 OUTPUT
 2147483648
 4294967294
 4294967295
 
 Take 1 for example, as unsigned 32-bits is 00000000000000000000000000000001 and doing the flipping we get 11111111111111111111111111111110 which in turn is 4294967294
 */
