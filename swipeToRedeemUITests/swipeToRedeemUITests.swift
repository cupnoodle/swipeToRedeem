//
//  swipeToRedeemUITests.swift
//  swipeToRedeemUITests
//
//  Created by Axel Kee on 16/06/2016.
//  Copyright © 2016 Sweatshop. All rights reserved.
//  Big thanks to http://masilotti.com/ui-testing-cheat-sheet

import XCTest

class swipeToRedeemUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        XCUIDevice.sharedDevice().orientation = .Portrait
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
    func testDragCursorToHalf() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        let cursor = app.otherElements["swipeCursor"]
        
        let startDragPoint = cursor.coordinateWithNormalizedOffset(CGVector(dx: 0.5, dy: 0.01))
        let endDragPoint = startDragPoint.coordinateWithOffset(CGVector(dx: 50.0, dy: 0.10))
        
        startDragPoint.pressForDuration(0.5, thenDragToCoordinate: endDragPoint)
        sleep(2)
        
        let redeemTextPredicate = NSPredicate(format: "label BEGINSWITH 'Redeemed on'")
        let redeemLabel = app.staticTexts.elementMatchingPredicate(redeemTextPredicate)
        
        // Check if the Redeem label has appeared
        // label should not appear as cursor didnt moved to end
        //
        XCTAssert(!redeemLabel.hittable)
        
    }
    
    func testDragCursorToEnd() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()

        let cursor = app.otherElements["swipeCursor"]
        
        let startDragPoint = cursor.coordinateWithNormalizedOffset(CGVector(dx: 0.5, dy: 0.01))
        let endDragPoint = startDragPoint.coordinateWithOffset(CGVector(dx: 300.0, dy: 0.10))
        
        startDragPoint.pressForDuration(0.5, thenDragToCoordinate: endDragPoint)
        sleep(2)
        
        let redeemTextPredicate = NSPredicate(format: "label BEGINSWITH 'Redeemed on'")
        let redeemLabel = app.staticTexts.elementMatchingPredicate(redeemTextPredicate)
        
        // Check if the Redeem label has appeared
        // label should appear as cursor moved to end
        XCTAssert(redeemLabel.hittable)
        
    }
    
}
