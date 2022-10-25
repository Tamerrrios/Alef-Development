//
//  HomeViewModel.swift
//  Alef Devemopment
//
//  Created by Temur Juraev on 25.10.2022.
//

import Foundation

class HomeViewModel {
    
    //MARK: - Just example of ViewModel (MVVM)
    var countOfChild: [Int] = []
    
    func hidenAddButton(completion: @escaping() -> Void) {
        if countOfChild.count == 5 {
            completion()
        }
    }
}
