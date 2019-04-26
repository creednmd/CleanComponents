
/// Base protocol for a Clean Swift Scene.
public protocol CleanSceneProtocol {
  var viewController: CleanViewController? { get set }
  var interactor: CleanInteractor? { get set }
  var presenter: CleanPresenter? { get set }
  var router: CleanRouter? { get set }
  var workers: [CleanWorker]? { get set }
}


/// Base protocols for the Clean Swift components.
public typealias CleanViewController = UIViewController & CleanVC
public typealias CleanDataStore = CleanInteractor


public protocol CleanVC: AnyObject {
  var interactor: CleanInteractor? { get set }
  var router: CleanRouter? { get set }

  init()
}


public protocol CleanInteractor {
  var presenter: CleanPresenter? { get set }
  var worker: CleanWorker? { get set }

  init()
}


public protocol CleanPresenter {
  var viewController: CleanViewController? { get set }

  init()
}


public protocol CleanRouter {
  var viewController: CleanViewController? { get set }
  var dataStore: CleanDataStore? { get set }

  init()
}


public protocol CleanWorker {

  init()
}


/// The abstract factory protocol declares a set of methods that return Clean Swift components and scenes.
/// Each app can either create multiple concrete CleanFactoryProtocol instances, one for each scene type,
/// or use one base CleanFactory concrete instance that uses NSClassFromString to create named scenes.
/// Note that for each concrete instance, the method signatures return an abstract object, while inside each
/// method a concrete product is instantiated.
public typealias CleanFactoryProtocol = CleanSceneFactory & CleanComponentFactory


public protocol CleanSceneFactory {
  func makeCleanScene(name sceneName: String, module moduleName: String?) -> CleanScene
}


public protocol CleanComponentFactory {
  func makeCleanViewController(name sceneName: String, module moduleName: String?) -> CleanViewController
  func makeCleanInteractor(name sceneName: String, module moduleName: String?) -> CleanInteractor
  func makeCleanPresenter(name sceneName: String, module moduleName: String?) -> CleanPresenter
  func makeCleanRouter(name sceneName: String, module moduleName: String?) -> CleanRouter
  func makeCleanWorker(name sceneName: String, module moduleName: String?) -> CleanWorker
}

