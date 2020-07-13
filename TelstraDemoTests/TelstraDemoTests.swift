//
//  TelstraDemoTests.swift
//  TelstraDemoTests
//
//  Created by Monika Jadhav on 04/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import XCTest
@testable import TelstraDemo

class TelstraDemoTests: XCTestCase {

    var factsViewModel = FactsViewModel()

    override func setUp() {
    }
    
    func testfetchFactsData() {
        let expectation = self.expectation(description: "Success api response received.")
        factsViewModel.fetchFactsData { (result) in
            switch(result) {
            case .success(let result):
                XCTAssertNotNil(result)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
}

