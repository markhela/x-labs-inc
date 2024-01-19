//
//  AddViewController.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import UIKit
import SnapKit

class AddViewController: BaseViewController<AddViewModelProtocol, AddViewModel> {

    private let feedbackGenerator: UIImpactFeedbackGenerator = {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        feedbackGenerator.prepare()
        return feedbackGenerator
    }()

    // MARK: - Subviews
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    private let bodyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Text"
        textField.borderStyle = .roundedRect
        return textField
    }()
    private lazy var addButton: GradientBorderButton = {
        let button = GradientBorderButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.blue.withAlphaComponent(0.5), for: .highlighted)
        button.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Setup
    override func setupUI() {
        navigationItem.title = "Add"
        view.backgroundColor = .systemBackground

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)

        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        view.addSubview(bodyTextField)
        bodyTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.leading.equalTo(32)
            make.trailing.equalTo(-32)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: - private functions
private extension AddViewController {
    
    @objc
    func addAction() {
        feedbackGenerator.impactOccurred()
        let addDTO = AddDTO(title: titleTextField.text ?? "",
                            body: bodyTextField.text ?? "",
                            userId: 1)
        viewModel?.sendData(dto: addDTO)
    }

    @objc
    func tapAction() {
        titleTextField.resignFirstResponder()
        bodyTextField.resignFirstResponder()
    }
}
