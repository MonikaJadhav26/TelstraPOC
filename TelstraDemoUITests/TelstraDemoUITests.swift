//
//  TelstraDemoUITests.swift
//  TelstraDemoUITests
//
//  Created by Monika Jadhav on 04/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import XCTest

class TelstraDemoUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testImagesTableViewCellIsExist() {
           let imagesTableView = app.tables.matching(identifier: Constants.imageTableViewIndentifier)
           let firstCell = imagesTableView.cells.element(matching: .cell, identifier: "CellIndentifier_0")
           let existencePredicate = NSPredicate(format: "exists == 1")
           let expectationEval = expectation(for: existencePredicate, evaluatedWith: firstCell, handler: nil)
           let mobWaiter = XCTWaiter.wait(for: [expectationEval], timeout: 5)
           XCTAssert(XCTWaiter.Result.completed == mobWaiter, "Test Case Failed.")
           firstCell.tap()
       }
    
    func testImagesTableViewInteraction() {
        let imagesTableView = app.tables[Constants.imageTableViewIndentifier]
        XCTAssertTrue(imagesTableView.exists, "Images TableView Exists")
        let imagesTableViewCells = imagesTableView.cells
        if imagesTableViewCells.count > 0 {
            let count: Int = (imagesTableViewCells.count - 1)
            let promise = expectation(description: "Wait for table cells")
            for i in stride(from: 0, to: count , by: 1) {
                let imagesCell = imagesTableViewCells.element(boundBy: i)
                XCTAssertTrue(imagesCell.exists, "\(i) cell exists")
                imagesCell.tap()
                if i == (count - 1) {
                    promise.fulfill()
                }
            }
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(true, "All images cells exists")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}
