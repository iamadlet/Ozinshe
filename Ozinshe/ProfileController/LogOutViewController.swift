//
//  LogOutViewController.swift
//  Ozinshe
//
//  Created by Адлет Жумагалиев on 18.10.2025.
//

import UIKit
import SnapKit

class LogOutViewController: UIViewController {

    lazy var backView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let homeView = UIView()
        homeView.backgroundColor = UIColor(named: "#D1D5DB")
        homeView.layer.cornerRadius = 5
        
        let logOutLabel = UILabel()
        logOutLabel.text = "Log out"
        logOutLabel.textColor = UIColor(named: "#111827")
        logOutLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        let logOutSubtitleLabel = UILabel()
        logOutSubtitleLabel.text = "Are you sure you want to log out?"
        logOutSubtitleLabel.textColor = UIColor(named: "#9CA3AF")
        logOutSubtitleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        view.addSubviews(homeView, logOutLabel, logOutSubtitleLabel)
        
        homeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(21)
            make.centerX.equalToSuperview()
            make.width.equalTo(64)
            make.height.equalTo(5)
        }
        
        logOutLabel.snp.makeConstraints { make in
            make.top.equalTo(homeView.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(24)
        }
        
        logOutSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logOutLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
        }
        
        return view
    }()
    
    lazy var logOutButton = {
        let button = UIButton()
        
        button.setTitle("Yes, log out", for: .normal)
        button.backgroundColor = UIColor(named: "#7E2DFC")
        button.titleLabel?.font = UIFont(name: "SFProDisplay-SemiBold", size: 16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var cancelLogOutButton = {
        let button = UIButton()
        
        button.setTitle("No", for: .normal)
        button.backgroundColor = UIColor(named: "#FFFFFF")
        button.titleLabel?.font = UIFont(name: "SFProDisplay-SemiBold", size: 16)
        button.setTitleColor(UIColor(named: "#5415C6"), for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(cancelLogOutButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func logOutButtonTapped() {
        
    }
    
    @objc func cancelLogOutButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        view.addSubview(backView)
        backView.addSubviews(logOutButton, cancelLogOutButton)
        
        backView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(353)
        }
        
        cancelLogOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(cancelLogOutButton.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
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
