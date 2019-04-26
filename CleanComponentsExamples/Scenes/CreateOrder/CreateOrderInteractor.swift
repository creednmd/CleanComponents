//
//  CreateOrderInteractor.swift
//  CleanComponents
//
//  Created by Andy Warwick on 24/04/2019.
//  Copyright (c) 2019 Andrew Warwick. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import CleanComponents

protocol CreateOrderBusinessLogic
{
  func doSomething(request: CreateOrder.Something.Request)
}

protocol CreateOrderDataStore
{
  //var name: String { get set }
}

final class CreateOrderInteractor: CleanInteractor, CreateOrderBusinessLogic, CreateOrderDataStore
{
  var presenter: CleanPresenter?
  var worker: CleanWorker?

  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CreateOrder.Something.Request)
  {
//    worker = CreateOrderWorker()
//    worker?.doSomeWork()

//    let response = CreateOrder.Something.Response()
//    presenter?.presentSomething(response: response)
  }
}
