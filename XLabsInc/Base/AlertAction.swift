import UIKit

extension AlertAction {
    enum Style {
        case `default`
        case cancel
        case destructive

        var alerActionStyle: UIAlertAction.Style {
            switch self {
            case .default: return .default
            case .cancel: return .cancel
            case .destructive: return .destructive
            }
        }
    }

    var alertAction: UIAlertAction {
        return UIAlertAction(title: title, style: style.alerActionStyle) {  _ in
            self.completion?()
        }
    }
}

class AlertAction {
    let title: String
    let completion: (() -> Void)?
    let style: Style

    init(title: String, completion: (() -> Void)?, style: AlertAction.Style) {
        self.title = title
        self.completion = completion
        self.style = style
    }
}

extension AlertAction {
    static var cancel: AlertAction {
        return AlertAction(title: "Cancel", completion: nil, style: .cancel)
    }

    static var okay: AlertAction {
        return AlertAction(title: "Ok", completion: nil, style: .default)
    }
}
