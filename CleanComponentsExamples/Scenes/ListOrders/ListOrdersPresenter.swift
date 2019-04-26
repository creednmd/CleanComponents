//
//  ListOrdersPresenter.swift
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

protocol ListOrdersPresentationLogic
{
  func presentSomething(response: ListOrders.Something.Response)
}

final class ListOrdersPresenter: CleanPresenter, ListOrdersPresentationLogic
{
  weak var viewController: CleanViewController?
  
  // MARK: Do something
  
  func presentSomething(response: ListOrders.Something.Response)
  {
//    let viewModel = ListOrders.Something.ViewModel()
//    viewController?.displaySomething(viewModel: viewModel)
  }
}
