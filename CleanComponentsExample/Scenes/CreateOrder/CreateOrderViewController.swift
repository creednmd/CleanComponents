import UIKit
import CleanComponents

protocol CreateOrderDisplayLogic: class
{
  func displaySomething(viewModel: CreateOrder.Something.ViewModel)
}

final class CreateOrderViewController: CleanViewController, CreateOrderDisplayLogic
{
  lazy var interactor: CleanInteractor = {
    return CreateOrderInteractor(presenter: CreateOrderPresenter(viewController: self))
  }()

  lazy var router: CleanRouter = {
    let dataStore = self.interactor

    return CreateOrderRouter(viewController: self, dataStore: dataStore)
  }()


  private lazy var createOrderInteractor: CreateOrderBusinessLogic = {
    return interactor as! CreateOrderBusinessLogic
  }()

  
  private lazy var createOrderRouter: NSObjectProtocol & CreateOrderRoutingLogic = {
    return router as! NSObjectProtocol & CreateOrderRoutingLogic
  }()


  // MARK: Routing

  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if createOrderRouter.responds(to: selector) {
        createOrderRouter.perform(selector, with: segue)
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
    let request = CreateOrder.Something.Request()

    createOrderInteractor.doSomething(request: request)
  }


  func displaySomething(viewModel: CreateOrder.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }

}
