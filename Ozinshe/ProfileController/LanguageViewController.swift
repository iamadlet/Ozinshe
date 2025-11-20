//
//  LanguageViewController.swift
//  Ozinshe
//
//  Created by Адлет Жумагалиев on 17.10.2025.
//

import UIKit
import SnapKit

protocol LanguageProtocol {
    func languageDidChange()
}

class LanguageViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    
    var delegate: LanguageProtocol?
    
    let languageArray = [["English", "en"], ["Қазақша", "kk"], ["Русский", "ru"]]
    
    lazy var backView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let homeView = UIView()
        homeView.backgroundColor = UIColor(named: "#D1D5DB")
        homeView.layer.cornerRadius = 5
        
        let languageLabel = UILabel()
        languageLabel.text = "Language"
        languageLabel.textColor = UIColor(named: "#111827")
        languageLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        view.addSubviews(homeView, languageLabel)
        
        homeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(21)
            make.centerX.equalToSuperview()
            make.width.equalTo(64)
            make.height.equalTo(5)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.top.equalTo(homeView.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(24)
        }
        
        return view
    }()
    
    lazy var langTableView = {
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        //Регистрация Table View Cell
        tableView.register(LanguageTableViewCell.self, forCellReuseIdentifier: "LanguageCell")
        
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tapGest()
        
        langTableView.delegate = self
        langTableView.dataSource = self
        
    }
    
    // MARK: - Add Subviews & Constraints
    func setupUI() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        view.addSubview(backView)
        backView.addSubview(langTableView)
        
        backView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(353)
        }
        
        langTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(119)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(32)
        }
    }
    
    // MARK: - Add UITapGestureRecognizer
    func tapGest() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
//        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
//    @objc func handleDismiss() {
//        switch sender.state {
//        case .changed:
//            viewTranslation = sender.translation(in: view)
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                self.backView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
//            })
//        case .ended:
//            if viewTranslation.y < 100 {
//                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                    self.backView.transform = CGAffineTransform.identity
//                })
//            } else {
//                dismiss(animated: true, completion: nil)
//            }
//        default:
//            break
//        }
//    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: backView))! {
            return false
        }
        
        return true
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
