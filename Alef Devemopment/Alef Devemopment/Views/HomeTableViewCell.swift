//
//  HomeTableViewCell.swift
//  Alef Devemopment
//
//  Created by Temur Juraev on 25.10.2022.
//

import UIKit
import SnapKit


final public class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    private(set) lazy var childNameTF: UITextField = {
       let view = UITextField()
        view.placeholder = "Имя"
        view.borderStyle = .line
        
        return view
    }()
    
    private(set) lazy var childAgeTF: UITextField = {
       let view = UITextField()
        view.placeholder = "Возраст"
        view.borderStyle = .line
        
       return view
    }()
    
    private(set) lazy var deleteButton: UIButton = {
       let view = UIButton()
        view.setTitle("Удалить", for: .normal)
        view.setTitleColor(UIColor(red: 90.0/250.0, green: 200.0/250.0, blue: 250.0/250.0, alpha: 1.0), for: .normal)
        view.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        
        return view
    }()
    
    private(set) lazy var verticalStack: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        
        
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(childNameTF)
        verticalStack.addArrangedSubview(childAgeTF)
        contentView.addSubview(deleteButton)
        setupContraints()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("delete"), object: nil, queue: nil) { _ in
            self.childAgeTF.text = nil
            self.childNameTF.text = nil
        }
    }
    
     required  init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteTapped() {
        childNameTF.text = nil
        childAgeTF.text = nil
    }
    
    func setupContraints() {
        verticalStack.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.right.equalTo(deleteButton.snp.left)
            make.height.equalTo(80)
            make.width.equalTo(200)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.right.equalTo(-50)
        }
    }
}
