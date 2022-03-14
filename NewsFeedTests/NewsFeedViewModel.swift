//
//  NewsFeedViewModel.swift
//  NewsFeedTests
//
//  Created by Rahul Bansal on 14/03/22.
//

import XCTest
@testable import NewsFeed

class NewsFeedViewModel: XCTestCase {

    func test_NewsFeedApiResource_With_ValidRequest_Returns_SuccessResponse(){

        // ARRANGE
        let request = NewsFeedService()
        
        let expectation = self.expectation(description: "ValidRequest_Returns_SuccessResponse")

        // ACT
        request.fetchNewsHeadlines(country: "us") { status, data, error in
            // ASSERT
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            XCTAssertEqual(status, true)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 15, handler: nil)

    }
    
    func test_NewsFeedApiResource_With_InvalidRequest_Returns_FailResponse(){

        // ARRANGE
        let request = NewsFeedService()
        
        let expectation = self.expectation(description: "ValidRequest_Returns_FailResponse")

        // ACT
        request.fetchNewsHeadlines(country: "") { status, data, error in
            // ASSERT
            XCTAssertNotNil(error)
            XCTAssertNil(data)
            XCTAssertEqual(status, false)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 15, handler: nil)

    }

}
