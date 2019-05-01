//
//  UnitTests.swift
//  UnitTests
//
//  Created by Andy Warwick on 25/04/2019.
//  Copyright © 2019 Andrew Warwick. All rights reserved.
//

import XCTest
import UIKit

@testable import CleanComponents

class UnitTests: XCTestCase {
  static let testScene = "Test"
  static let testBundle = Bundle(for: TestViewController.self)
  static let testModule = UnitTests.testBundle.bundleURL.deletingPathExtension().lastPathComponent


  func test_CleanComponentFactory_makeCleanViewControllerReturnsCorrectObjects() {
    // Given
    let scenefactory = CleanFactory()

    // When
    let sut = scenefactory.makeCleanViewController(name: UnitTests.testScene, module: UnitTests.testModule, bundle: UnitTests.testBundle)

    // Then
    XCTAssert(sut.self is TestViewController, "SUT is not of correct type.")
    XCTAssert(sut.interactor.self is TestInteractor, "SUT.interactor is not of correct type.")
    XCTAssert(sut.router.self is TestRouter, "SUT.router is not of correct type.")
  }


  func test_CleanComponentFactory_makeCleanInteractorReturnsCorrectObjects() {
    // Given
    let scenefactory = CleanFactory()
    let presenter = scenefactory.makeCleanPresenter(name: UnitTests.testScene, module: UnitTests.testModule)

    // When
    let sut = scenefactory.makeCleanInteractor(name: UnitTests.testScene, module: UnitTests.testModule, presenter: presenter)

    // Then
    XCTAssert(sut.self is TestInteractor, "SUT is not of correct type.")
    XCTAssert(sut.presenter.self is TestPresenter, "SUT.presenter is not of correct type.")
    XCTAssert((sut.presenter as? TestPresenter) === (presenter as? TestPresenter), "SUT.presenter is not the correct object.")
  }


  func test_CleanComponentFactory_makeCleanPresenterReturnsCorrectObjects() {
    // Given
    let scenefactory = CleanFactory()
    let viewController = scenefactory.makeCleanViewController(name: UnitTests.testScene, module: UnitTests.testModule, bundle: UnitTests.testBundle)

    // When
    let sut = scenefactory.makeCleanPresenter(name: UnitTests.testScene, module: UnitTests.testModule, viewController: viewController)

    // Then
    XCTAssert(sut.self is TestPresenter, "SUT is not of correct type.")
    XCTAssert(sut.viewController.self is TestViewController, "SUT.viewController is not of correct type.")
    XCTAssert((sut.viewController as? TestViewController) === (viewController as? TestViewController), "SUT.viewController is not the correct object.")
  }


  func test_CleanComponentFactory_makeCleanWorkerReturnsCorrectObjectType() {
   // When
    let sut = CleanFactory().makeCleanWorker(name: UnitTests.testScene, module: UnitTests.testModule)

    // Then
    XCTAssert(sut.self is TestWorker, "SUT is not of correct type.")
  }


  // MARK: Helpers

  private func makeSUT() -> CleanScene {
    let sceneFactory = CleanFactory()

    let scene = sceneFactory.makeCleanScene(name: UnitTests.testScene, module: UnitTests.testModule)

    return scene
  }

}


// Test Scene classes

final class TestViewController: UIViewController, CleanViewController {
  lazy var interactor: CleanInteractor = {
    return TestInteractor(presenter: TestPresenter(viewController: self))
  }()

  lazy var router: CleanRouter = {
    let dataStore = self.interactor

    return TestRouter(viewController: self, dataStore: dataStore)
  }()

}


final class TestInteractor: CleanInteractor {
  var presenter: CleanPresenter
  var workers: [CleanWorker] = []

  var worker: CleanWorker? {
    return workers.isEmpty ? nil : workers.first
  }

  init(presenter: CleanPresenter) {
    self.presenter = presenter
  }

}


final class TestPresenter: CleanPresenter, Equatable {
  var viewController: CleanViewController?

  init(viewController: CleanViewController?) {
    self.viewController = viewController
  }

  static func == (lhs: TestPresenter, rhs: TestPresenter) -> Bool {
    return lhs === rhs
  }

}


final class TestRouter: CleanRouter {
  var viewController: CleanViewController?
  var dataStore: CleanDataStore

  init(viewController: CleanViewController? = nil, dataStore: CleanDataStore) {
    self.viewController = viewController
    self.dataStore = dataStore
  }
}


final class TestWorker: CleanWorker {

}
