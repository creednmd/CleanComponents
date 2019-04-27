import UIKit
import CleanComponents

protocol CreateOrderPresentationLogic
{
  func presentSomething(response: CreateOrder.Something.Response)
}

final class CreateOrderPresenter: CleanPresenter, CreateOrderPresentationLogic
{
  weak var viewController: CleanViewController?

  init(viewController: CleanViewController?) {
    self.viewController = viewController
  }

  // MARK: Do something
  
  func presentSomething(response: CreateOrder.Something.Response)
  {
//    let viewModel = CreateOrder.Something.ViewModel()
//    viewController?.displaySomething(viewModel: viewModel)
  }
}
