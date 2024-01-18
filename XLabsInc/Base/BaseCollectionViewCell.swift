import UIKit

class BaseCollectionViewCell<P, ViewModel: BaseActionViewModelProtocol>: UICollectionViewCell {
    var viewModel: P? {
        didSet {
            (oldValue as? ViewModel)?.unbind(self)
            configureBindings(with: viewModel as? ViewModel)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    deinit {
        (viewModel as? ViewModel)?.unbind(self)
    }

    override func prepareForReuse() {
        (viewModel as? ViewModel)?.unbind(self)
        viewModel = nil
    }

    func configure(with viewModel: P) {
        self.viewModel = viewModel
    }

    func configureBindings(with viewModel: ViewModel?) {}
    func setupUI() {}
}
