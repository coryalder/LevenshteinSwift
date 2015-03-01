//
//  LevenshteinExampleTests.swift
//  LevenshteinExampleTests
//
//  Created by Cory Alder on 2015-02-28.
//  Copyright (c) 2015 Davander Mobile Corporation. All rights reserved.
//

import UIKit
import XCTest

class LevenshteinExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLevenshteinCalculation() {
        
        let test_data: [(String, String, String, Int)] = [
            ("classic", "kitten", "sitting", 3),
            ("same", "kitten", "kitten", 0),
            ("empty", "", "", 0),
            ("a", "meilenstein", "levenshtein", 4),
            ("b", "levenshtein", "frankenstein", 6),
            ("c", "confide", "deceit", 6),
            ("d", "CUNsperrICY", "conspiracy", 8),
        ]
        
        for tuple in test_data {
            let testname = tuple.0
            let expected = tuple.3
            
            let result = (tuple.1 as NSString).asciiLevenshteinDistanceWithString(tuple.2 as NSString) == expected
            
            XCTAssert(result, "\(testname) test failed")
        }
    }
    
}
