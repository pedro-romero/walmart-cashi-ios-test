//
//  walmart_cashiTests.swift
//  walmart cashiTests
//
//  Created by Pedro Romero on 01/10/24.
//

import XCTest
@testable import walmart_cashi

final class walmart_cashiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_sumOfEvenNumbers_emptyArray() throws {
        let numbers: [Int] = []
        
        let sum = EvenNumbers.sumOfEvenNumbers(numbers)
        
        XCTAssertEqual(sum, 0)
    }
    
    func test_sumOfEvenNumbers_allOdds() throws {
        let numbers: [Int] = [1, 3, 5, 7, 9]
        
        let sum = EvenNumbers.sumOfEvenNumbers(numbers)
        
        XCTAssertEqual(sum, 0)
    }
    
    func test_sumOfEvenNumbers_firsTenNumbers() throws {
        let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        let sum = EvenNumbers.sumOfEvenNumbers(numbers)
        
        XCTAssertEqual(sum, 30)
    }
    
    func test_sumOfEvenNumbers_negativeNumbers() throws {
        let numbers: [Int] = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]
        
        let sum = EvenNumbers.sumOfEvenNumbers(numbers)
        
        XCTAssertEqual(sum, -30)
    }
    
    func test_sumOfEvenNumbers_positiveAndNegativeNumbers() throws {
        let numbers: [Int] = [1, -2, 3, -4, -5, 6, -7, 8, -9, -10]
        
        let sum = EvenNumbers.sumOfEvenNumbers(numbers)
        
        XCTAssertEqual(sum, -2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
