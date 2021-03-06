
/// The base CleanFactory can be used to instantiate any standard type of Clean Swift Scene.
/// Default concrete factory methods are defined in CleanSceneFactory and CleanComponentFactory extensions.
public class CleanFactory: CleanFactoryProtocol {
  public init() {}
}


public struct CleanScene: CleanSceneProtocol {
  public var viewController: CleanViewController?
  public var interactor: CleanInteractor?
  public var presenter: CleanPresenter?
  public var router: CleanRouter?
  public var workers: [CleanWorker]?
}


public extension CleanSceneFactory {

  func makeCleanScene(name sceneName: String, module moduleName: String? = nil) -> CleanScene {

    let factory = CleanFactory()

    let viewController = factory.makeCleanViewController(name: sceneName, module: moduleName)
    var interactor = factory.makeCleanInteractor(name: sceneName, module: moduleName)
    var presenter = factory.makeCleanPresenter(name: sceneName, module: moduleName)
    var router = factory.makeCleanRouter(name: sceneName, module: moduleName)

    // Setup links between controllers to form VIP loop.
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController

    let scene = CleanScene(viewController: viewController,
                           interactor: interactor,
                           presenter: presenter,
                           router: router,
                           workers: [])

    return scene
  }

}


public extension CleanComponentFactory {

  func makeCleanViewController(name sceneName: String, module moduleName: String?) -> CleanViewController {
    // Instantiate view controller from storyboard with the same name as scene, and check type is correct.
    let storyboard = UIStoryboard(name: sceneName, bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
      fatalError("Unable to get initial view controller from \(sceneName) storyboard.") }

    // If we are setting the module name manually (to account for things like ‘-’ in the name), use that;
    // if not, generate it.
    let moduleName = getModule(named: moduleName)

    // Use AnyClass? here, as we don't want to set type before checking what we got from the storyboard.
    let viewControllerClassName = "\(moduleName).\(sceneName)ViewController"
    let viewControllerClass: AnyClass? = NSClassFromString(viewControllerClassName)

    guard viewController.isKind(of: viewControllerClass!) else {
      fatalError("View controller from \(sceneName) storyboard is of the wrong type.") }

    guard let cleanViewController = viewController as? CleanViewController else
      { fatalError("Unable to cast viewcontroller to CleanViewController.") }

    return cleanViewController
  }


  func makeCleanInteractor(name sceneName: String, module moduleName: String?) -> CleanInteractor {
    let moduleName = getModule(named: moduleName)

    guard let interactorClass = NSClassFromString("\(moduleName).\(sceneName)Interactor")
        as? CleanInteractor.Type else { fatalError("Unable to instantiate interactor of requested class.") }

    return interactorClass.init()
  }


  func makeCleanPresenter(name sceneName: String, module moduleName: String?) -> CleanPresenter {
    let moduleName = getModule(named: moduleName)

    guard let presenterClass = NSClassFromString("\(moduleName).\(sceneName)Presenter")
        as? CleanPresenter.Type else { fatalError("Unable to instantiate presenter of requested class.") }

    return presenterClass.init()
  }


  func makeCleanRouter(name sceneName: String, module moduleName: String?) -> CleanRouter {
   let moduleName = getModule(named: moduleName)

    guard let routerClass = NSClassFromString("\(moduleName).\(sceneName)Router")
        as? CleanRouter.Type else { fatalError("Unable to instantiate router of requested class.") }

    return routerClass.init()
  }


  func makeCleanWorker(name sceneName: String, module moduleName: String?) -> CleanWorker {
    let moduleName = getModule(named: moduleName)

    guard let workerClass = NSClassFromString("\(moduleName).\(sceneName)Worker")
        as? CleanWorker.Type else { fatalError("Unable to instantiate worker of requested class.") }

    return workerClass.init()
  }

}


// Helper Functions

private func getModule(named name: String? = nil) -> String {
  return name ?? Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
}


//class CreateOrderFactory: CleanFactory {
//  func makeCleanViewController(name sceneName: String, module moduleName: String?) -> CleanViewController {
//    let storyboard = UIStoryboard(name: "CreateOrder", bundle: nil)
//    let firstVC = storyboard.instantiateInitialViewController() as! CreateOrderViewController
//    return firstVC
//  }
//
//}
//
//
//class ListOrdersFactory: CleanFactory {
//  func makeCleanViewController(name sceneName: String, module moduleName: String?) -> CleanViewController {
//    let storyboard = UIStoryboard(name: "ListOrders", bundle: nil)
//    let firstVC = storyboard.instantiateInitialViewController() as! ListOrdersViewController
//    return firstVC
//  }
//
//}
