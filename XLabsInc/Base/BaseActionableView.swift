import UIKit

class BaseActionableView<P, ViewModel: BaseActionViewModelProtocol>: UIView {
    var viewModel: P? {
        didSet {
            (oldValue as? ViewModel)?.unbind(self)
            configureBindings(with: viewModel as? ViewModel)
        }
    }

    init(with viewModel: ViewModel? = nil) {
        self.viewModel = viewModel as? P
        super.init(frame: .zero)
        setupUI()
        configureBindings(with: viewModel)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    deinit {
        (viewModel as? ViewModel)?.unbind(self)
    }

    func configureBindings(with viewModel: ViewModel?) {}
    func setupUI() {}
}
