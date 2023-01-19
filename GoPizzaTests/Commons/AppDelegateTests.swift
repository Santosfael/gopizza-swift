//
//  AppDelegateTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 16/01/23.
//

import XCTest
@testable import GoPizza
final class AppDelegateTests: XCTestCase {
    private var sut: AppDelegate!

    override func setUp() async throws {
        sut = AppDelegate()
    }

    override func tearDown() async throws {
        sut = nil
    }

    func testDidFinishLaunchingReturnsTrue() {
            let application = UIApplication.shared
            let launchOptions = [UIApplication.LaunchOptionsKey: Any]()
            let result = sut.application(application, didFinishLaunchingWithOptions: launchOptions)

            XCTAssertTrue(result)
        }
}
