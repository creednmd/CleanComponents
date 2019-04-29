
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
  func makeCleanViewController(name sceneName: String, module moduleName: String?, bundle sceneBundle: Bundle?) -> (UIViewController & CleanViewController)
  func makeCleanInteractor(name sceneName: String, module moduleName: String?, presenter: CleanPresenter) -> CleanInteractor
  func makeCleanPresenter(name sceneName: String, module moduleName: String?, viewController: CleanViewController?) -> CleanPresenter
  func makeCleanRouter(name sceneName: String, module moduleName: String?, viewController: CleanViewController?, dataStore: CleanDataStore) -> CleanRouter
  func makeCleanWorker(name sceneName: String, module moduleName: String?) -> CleanWorker
}


/// Base protocol for a Clean Swift Scene.
public protocol CleanSceneProtocol {
  var viewController: (UIViewController & CleanViewController)? { get set }
  var interactor: CleanInteractor? { get set }
  var presenter: CleanPresenter? { get set }
  var router: CleanRouter? { get set }
  var workers: [CleanWorker]? { get set }
}


/// Base protocols for the Clean Swift components.
public protocol CleanViewController: AnyObject{
  var interactor: CleanInteractor { get }
  var router: CleanRouter { get }
}


public protocol CleanInteractor {
  var presenter: CleanPresenter { get }
  var worker: CleanWorker? { get }

  init(presenter: CleanPresenter)
}


public protocol CleanPresenter {
  var viewController: CleanViewController? { get set }

  init(viewController: CleanViewController?)
}


public protocol CleanRouter {
  var viewController: CleanViewController? { get set }
  var dataStore: CleanDataStore { get }

  init(viewController: CleanViewController?, dataStore: CleanDataStore)
}


public protocol CleanWorker {

  init()
}


public typealias CleanDataStore = CleanInteractor



//  public lazy var interactor: CleanInteractor = {
//    return T(presenter: V(viewController: self))
//  }()
//
//  public lazy var router: CleanRouter = {
//    let dataStore = (self.interactor as CleanDataStore)
//
//    return U(viewController: self, dataStore: dataStore)
//  }()



