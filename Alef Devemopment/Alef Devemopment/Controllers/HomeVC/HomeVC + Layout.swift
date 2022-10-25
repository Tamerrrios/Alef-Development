//
//  HomeVC + Layout.swift
//  Alef Devemopment
//
//  Created by Temur Juraev on 25.10.2022.
//

import Foundation
import SnapKit

//MARK: - Using SnapKit for layout and added extansion for UIViewController 

extension HomeVC {
    
    override func constructHierarchy() {
        view.addSubview(descriptionLabel)
        view.addSubview(verticalStack)
        view.addSubview(horizontallStack)
        view.addSubview(contentView)
        view.addSubview(scrollView)
        verticalStack.addArrangedSubview(personNameTF)
        verticalStack.addArrangedSubview(personAgeTF)
        horizontallStack.addArrangedSubview(childInfoLabel)
        horizontallStack.addArrangedSubview(addButton)
        contentView.addSubview(tableView)
        view.addSubview(clearButton)
 
    }
    
    override func activateConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        horizontallStack.snp.makeConstraints { make in
            make.top.equalTo(verticalStack.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(horizontallStack.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(clearButton.snp.top).offset(20)
        }
        
        clearButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(80)
            make.right.equalTo(view.snp.right).offset(-80)
            make.bottom.equalTo(view.snp.bottom).offset(-50)
            make.height.equalTo(40)
        }

    }
}
