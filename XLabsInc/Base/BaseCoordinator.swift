import UIKit

protocol Sessionable {}

class EmptySession: Sessionable {}

protocol BaseCoordinatorType: BaseCoordinatorAction {
    associatedtype Event
    typealias EventHandler = ((Event) -> Void)
    
    func bind(_ object: AnyObject, _ handler: @escaping EventHandler)
    func unbind(_ object: AnyObject)
    func post(_ event: Event)
}

protocol BaseCoordinatorAction {
    func canProcess(request: CoordinatorRequestType) -> Bool
    func handleRequest(_ request: CoordinatorRequestType)
    func executeRequest(_ request: CoordinatorRequestType)
}

class BaseCoordinator<E: Eventable>: NSObject, BaseCoordinatorType {
    typealias Event = E
    
    private var eventHandlers: [ObjectIdentifier: [EventHandler]] = [:]
    var currentViewController: UIViewController?
    var childCoordinators = [NSObject]()
    var nextCoordinator: BaseCoordinatorAction? {
        childCoordinators.last as? BaseCoordinatorAction
    }
        
    override init() {
        super.init()
    }
    
    func start(with presenter: UIViewController) {}
    
    func bind(_ object: AnyObject, _ handler: @escaping EventHandler) {
        let identifier = ObjectIdentifier(object)
        var existingEventHandlers = eventHandlers[identifier] ?? []
        existingEventHandlers.append(handler)
        eventHandlers[identifier] = existingEventHandlers
    }
    
    func unbind(_ object: AnyObject) {
        let identifier = ObjectIdentifier(object)
        eventHandlers.removeValue(forKey: identifier)
    }
    
    func post(_ action: E) {
        eventHandlers.values.flatMap { $0 }.forEach { element in
            DispatchQueue.main.async {
                element(action)
            }
        }
    }
    
    func childStarted(_ coordinator: NSObject) {
        childCoordinators.append(coordinator)
    }
    
    func childCompleted(_ coordinator: NSObject) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
        self.unbind(coordinator)
    }
    
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   actions: [AlertAction],
                   style: UIAlertController.Style = .alert,
                   sourceView: UIView? = nil,
                   presenter: UIViewController? = nil) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            controller.addAction(action.alertAction)
        }
        
        if controller.popoverPresentationController != nil {
            controller.popoverPresentationController?.sourceView = sourceView
        }
        
        (presenter ?? currentViewController)?.present(controller, animated: true, completion: nil)
    }
    
    func showDefaultAlert(with message: String? = nil) {
        guard let message = message else { return }
        let okAction = AlertAction(title: "OK",
                              completion: nil,
                              style: .default)
        showAlert(message: message,
                  actions: [okAction],
                  presenter: UIViewController.topMostController())
    }
    
    func showNoInternetConnectionAlert(completion: (() -> Void)? = nil) {
        let okAction = AlertAction(title: "OK",
                              completion: {
                                if let completion = completion {
                                    completion()
                                }
                              },
                              style: .default)
        showAlert(message: "No internet connection",
                  actions: [okAction])
    }
    
    func openPushSettings() {
        if let bundleIdentifier = Bundle.main.bundleIdentifier,
           let appSettings = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
            DispatchQueue.main.async {
                if UIApplication.shared.canOpenURL(appSettings) {
                    UIApplication.shared.open(appSettings)
                }
            }
        }
    }
    
    func canProcess(request: CoordinatorRequestType) -> Bool {
        false
    }
    
    func handleRequest(_ request: CoordinatorRequestType) {
        guard canProcess(request: request) else {
            nextCoordinator?.handleRequest(request)
            return
        }
        
        executeRequest(request)
    }
    
    func executeRequest(_ request: CoordinatorRequestType) {
        fatalError("This method should be overridden in a subclass.")
    }
}
