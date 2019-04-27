//
//  CreateOrder2ViewController.swift
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

protocol ListOrdersDisplayLogic: class
{
  func displaySomething(viewModel: CreateOrder.Something.ViewModel)
}

final class ListOrdersViewController: CleanViewController, CreateOrderDisplayLogic
{
  lazy var interactor: CleanInteractor = {
    return ListOrdersInteractor(presenter: ListOrdersPresenter(viewController: self))
  }()

  lazy var router: CleanRouter = {
    let dataStore = self.interactor

    return ListOrdersRouter(viewController: self, dataStore: dataStore)
  }()


  private lazy var listOrdersInteractor: CreateOrderBusinessLogic = {
    return interactor as! CreateOrderBusinessLogic
  }()


  private lazy var listOrdersRouter: NSObjectProtocol & CreateOrderRoutingLogic = {
    return router as! NSObjectProtocol & CreateOrderRoutingLogic
  }()


  // MARK: Routing

  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if listOrdersRouter.responds(to: selector) {
        listOrdersRouter.perform(selector, with: segue)
      }
    }
  }

  // MARK: View lifecycle

  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }

  // MARK: Do something

  //@IBOutlet weak var nameTextField: UITextField!

  func doSomething()
  {
//    let request = CreateOrder.Something.Request()
  }

  func displaySomething(viewModel: CreateOrder.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
