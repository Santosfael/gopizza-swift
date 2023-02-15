//
//  SceneDelegateTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 16/01/23.
//

import XCTest
@testable import GoPizza

final class SceneDelegateTests: XCTestCase {
    private var sut: SceneDelegate!
    private var window: UIWindow!
    private var scene: UIScene!

    override func setUpWithError() throws {
        sut = SceneDelegate()
        window = UIWindow()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        sut = nil
        window = nil
    }

    func test_scene_willConnectTo_setsWindowRootViewController() {
        let navigationControlle = UINavigationController()
        let coordinatorStub =  CoordinatorProtocolStub(navigationControlle)
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let viewController = LoginViewController(coordinator: coordinatorStub)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window = UIWindow(windowScene: windowScene)
        sut.window?.rootViewController = UINavigationController(rootViewController: viewController)
        XCTAssertEqual(sut.window?.rootViewController, navigationController)
    }
}
