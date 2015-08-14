//  LevenshteinSwift.swift
//
//  Created by Cory Alder on 28 Feb 2015
//  Copyright 2015 Davander Mobile Corp. All rights reserved.
//
//  This code is based on the Objective-C "NSString+Levenshtein" Created by Mark Aufflick.
//  Which was based loosely on the NSString(Levenshtein) code by Rick Bourner
//  rick@bourner.com <http://www.merriampark.com/ldobjc.htm>
//
//  Improvements and suggestions welcome.

/*

Copyright (c) 2009, Mark Aufflick
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
* Neither the name of the Mark Aufflick nor the
names of contributors may be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MARK AUFFLICK ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MARK AUFFLICK BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

import Foundation

let LEV_INF_DISTANCE = Int.max

extension String {
    func asciiLevenshteinDistance(string: String) -> Int {
        return (self as NSString).asciiLevenshteinDistance(string: (string as NSString))
    }
    
    func asciiLevenshteinDistance(string: String, skippingCharset charset: NSCharacterSet?) -> Int {
        return (self as NSString).asciiLevenshteinDistance(string: (string as NSString), skippingCharset: charset)
    }
}

extension NSString {
    
    func asciiLevenshteinDistance(string stringB: NSString?) -> Int {
        return asciiLevenshteinDistance(string: stringB, skippingCharset: nil)
    }
    
    func asciiLevenshteinDistance(string stringBOrig: NSString!, skippingCharset charset: NSCharacterSet?) -> Int {
        
        if stringBOrig == nil {
            return LEV_INF_DISTANCE
        }
        
        var stringB: NSString = stringBOrig
        var stringA: NSString! = nil
        
        if charset != nil {
            
            stringA = (self.componentsSeparatedByCharactersInSet(charset!) as NSArray).componentsJoinedByString("")
            stringB = (stringB.componentsSeparatedByCharactersInSet(charset!) as NSArray).componentsJoinedByString("")
        } else {
            stringA = self
        }
        
        let dataA = stringA.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
        let dataB = stringB.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
        
        if dataA == nil || dataB == nil {
            return LEV_INF_DISTANCE
        }
        
        var cstringA = UnsafePointer<UInt8>(dataA!.bytes)
        var cstringB = UnsafePointer<UInt8>(dataB!.bytes)
        
        var k: Int = 0
        var i: Int = 0
        var j: Int = 0
        
        var n = dataA!.length
        var m = dataB!.length
        
        if( n++ != 0 && m++ != 0 ) {
            
            var d = Array(count:m * n, repeatedValue:0)
            
            for k = 0; k < n; k++ {
                d[k] = k
            }
            
            for k = 0; k < m; k++ {
                d[ k * n ] = k
            }
            
            for i = 1; i < n; i++ {
                for j = 1; j < m; j++ {
                    
                    let cost = cstringA[i-1] == cstringB[j-1] ? 0 : 1
                    
                    let v1 = d[ (j - 1) * n + i ] + 1
                    let v2 = d[ j * n + i - 1 ] + 1
                    let v3 = d[ (j - 1) * n + i - 1 ] + cost
                    
                    d[ j * n + i ] = min(min(v1,v2),v3)
                }
            }
        
            return d[ n * m - 1 ]
        }
        
        return 0
    }
    
}


