//
//  ChangePasswordViewController.swift
//  Ozinshe
//
//  Created by Адлет Жумагалиев on 18.10.2025.
//

import UIKit
import SnapKit

class ChangePasswordViewController: UIViewController {
    
    // MARK: - New Password Elements
    lazy var grayView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#9CA3AF")
        view.layer.opacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        return view
    }()
    
    lazy var newPasswordLabel = {
        let label = UILabel()
        
        label.text = "Password"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "#11827")
        
        return label
    }()
    
    lazy var newPasswordTextField = {
        let textField = UITextField()
        
        textField.placeholder = "Enter new password"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(named: "#11827")
        textField.layer.borderColor = UIColor(named: "#9CA3AF")?.withAlphaComponent(0.5).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    lazy var showPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Show"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
    
    // MARK: - Repeat password elements
    lazy var repeatPasswordLabel = {
        let label = UILabel()
        label.text = "Repeat password"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(named: "#11827")
        return label
    }()
    
    lazy var repeatPasswordTextField = {
        let textField = UITextField()
        textField.placeholder = "Repeat new password"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(named: "#11827")
        textField.layer.borderColor = UIColor(named: "#9CA3AF")?.withAlphaComponent(0.5).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.leftView = repeatPaddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var repeatShowPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Show"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let repeatPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
    
    // MARK: - Save Changes Button
    lazy var saveChangesButton = {
        let button = UIButton()
        
        button.setTitle("Save Changes", for: .normal)
        button.backgroundColor = UIColor(named: "#7E2DFC")
        button.titleLabel?.font = UIFont(name: "SFProDisplay-SemiBold", size: 16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(saveChangesButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func showPasswordButtonTapped() {
        newPasswordTextField.isSecureTextEntry = !newPasswordTextField.isSecureTextEntry
    }
    
    @objc func saveChangesButtonTapped() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        self.title = "Change Password"
        navigationController?.navigationBar.tintColor = UIColor(named: "#111827")
        setupUI()
    }
    

    func setupUI() {
        view.addSubviews(grayView, newPasswordLabel, newPasswordTextField, showPasswordButton, repeatPasswordLabel, repeatPasswordTextField, repeatShowPasswordButton, saveChangesButton)
        
        grayView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(1)
        }
        
        newPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(21)
            make.leading.equalToSuperview().inset(24)
        }
        
        newPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(newPasswordLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.trailing.equalTo(newPasswordTextField.snp.trailing).inset(16)
            make.centerY.equalTo(newPasswordTextField)
        }
        
        repeatPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(newPasswordTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(24)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        repeatShowPasswordButton.snp.makeConstraints { make in
            make.trailing.equalTo(repeatPasswordTextField.snp.trailing).inset(16)
            make.centerY.equalTo(repeatPasswordTextField)
        }
        
        saveChangesButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(56)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
