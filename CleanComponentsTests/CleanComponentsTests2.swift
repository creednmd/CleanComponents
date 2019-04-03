//
//  CleanComponentsTests.swift
//  CleanComponentsTests
//
//  Created by Andy Warwick on 03/04/2019.
//  Copyright © 2019 Andrew Warwick. All rights reserved.
//

import XCTest
@testable import CleanComponents

class CleanComponentsTests2: XCTestCase {

  var cleanComponents: CleanComponents2!


  override func setUp() {
      cleanComponents = CleanComponents2()
  }


  func test_printName() {
    cleanComponents.printName()
  }


}
