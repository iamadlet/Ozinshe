//
//  LanguageTableViewCell.swift
//  Ozinshe
//
//  Created by Адлет Жумагалиев on 18.10.2025.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    let identifier = "LanguageCell"
    
    let languageLabel = {
        let label = UILabel()
        
        label.text = "English"
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        label.textColor = UIColor(named: "#111827")
        
        return label
    }()
    
    let divider = {
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "#D1D5DB")
        
        return view
    }()
    
    let checkImage = {
        let image = UIImageView()
        
        image.image = UIImage(named: "Check")
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubviews(languageLabel, divider, checkImage)
        
        languageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        checkImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        divider.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
