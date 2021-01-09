//
//  UKrakenTests.swift
//  UKrakenTests
//
//  Created by Stevhen on 09/01/21.
//

import XCTest
@testable import UKraken

class UKrakenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDateFormatterDateOrigin() throws {
        
        let dateString = Utils.dateFormatterDateOrigin("2021-01-08T11:55:26-05:00")
        let result = dateString == "Jan 08, 2021"
        
        XCTAssertEqual(result, true)
    }
    
    func testDateFormatterDateOriginFailDecode() throws {

        let dateString = Utils.dateFormatterDateOrigin("14 12 2020")
        let result = dateString == "There was an error decoding the string"
        
        XCTAssertEqual(result, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
