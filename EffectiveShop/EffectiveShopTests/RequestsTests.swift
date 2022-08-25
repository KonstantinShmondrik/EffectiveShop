//
//  RequestsTests.swift
//  EffectiveShopTests
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import XCTest
import Alamofire
@testable import EffectiveShop

class RequestsTests: XCTestCase {

    var requestFactory: RequestFactory!
    
    let expectation = XCTestExpectation(description: "Perform request.")
    let timeoutValue = 10.0
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        
    }
    
    func testShouldPerformGetMainRequest() {
        let factory = requestFactory.makeMainRequestFactory()
        factory.getMain() { [weak self] response in
            switch response.result {
            case .success: break
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformGetProductDetailsRequest() {
        let factory = requestFactory.makeProductDetailsRequestFactory()
        factory.getProductDetails() { [weak self] response in
            switch response.result {
            case .success: break
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformGetMyCartRequest() {
        let factory = requestFactory.makeMyCartRequestFactory()
        factory.getMyCart() { [weak self] response in
            switch response.result {
            case .success: break
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    
    
}
