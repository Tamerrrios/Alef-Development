//
//  ViewController.swift
//  Alef Devemopment
//
//  Created by Temur Juraev on 25.10.2022.
//

import UIKit


class HomeVC: UIViewController {
    
    let viewModel: HomeViewModel
    
    //MARK: - UI Setup
    
    private(set) lazy var  descriptionLabel: UILabel = {
       let view = UILabel()
        view.text = "Персональные данные"
        
        return view
    }()
    
    
    private(set) lazy var  contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        
       return view
    }()
    
    private(set) lazy var  childInfoLabel: UILabel = {
       let view = UILabel()
        view.text = "Дети (макс.5)"
        
        return view
    }()
    
    private(set) lazy var personNameTF: UITextField = {
       let view = UITextField()
        view.placeholder = "Имя"
        view.borderStyle = .line
        
        return view
    }()
    
    private(set) lazy var personAgeTF: UITextField = {
       let view = UITextField()
        view.placeholder = "Возраст"
        view.borderStyle = .line
        
       return view
    }()
    
    private(set) lazy var addButton: UIButton = {
       let view = UIButton()
        view.setTitle("Добавить ребенка", for: .normal)
        view.backgroundColor = UIColor.white
        view.setTitleColor(UIColor(cgColor: CGColor(red: 90.0/255.0, green: 200.0/255.0, blue: 250.0/255.0, alpha: 1.0)), for: .normal)
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.layer.borderColor = CGColor(red: 90.0/255.0, green: 200.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 18
        view.addTarget(self, action: #selector(addtapped), for: .touchUpInside)
        
        return view
    }()
    
    private(set) lazy var clearButton: UIButton = {
       let view = UIButton()
        view.setTitle("Очистить", for: .normal)
        view.backgroundColor = UIColor.white
        view.setTitleColor(UIColor(cgColor: CGColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)), for: .normal)
        view.layer.borderColor = CGColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        view.layer.borderWidth =  4
        view.layer.cornerRadius = 18
        view.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        return view
    }()
    
    private(set) lazy var tableView: UITableView = {
       let view = UITableView()
        view.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        
        
        return view
    }()
    
    private(set) lazy var verticalStack: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        
        
        return view
    }()
    
    private(set) lazy var horizontallStack: UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        
        
        return view
    }()
    
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - Init
    init(viewModel: HomeViewModel) {
       self.viewModel = viewModel
       super.init(nibName: nil, bundle: nil)
   }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        constructHierarchy()
        activateConstraints()
        tableView.isHidden = true
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - UIAlert Setup
    
    private func clearPage() {
        let mainAlert = UIAlertController(title: nil, message: "Вы действительно хотите очистить все данные?", preferredStyle: .actionSheet)
        let clearAction = UIAlertAction(title: "Сбросить данные", style: .default) { _ in
            self.personNameTF.text = nil
            self.personAgeTF.text = nil
            NotificationCenter.default.post(name: NSNotification.Name("delete"), object: nil)
            self.tableView.isHidden = true
            self.addButton.isHidden = false
        }
        let deleteAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            self.dismiss(animated: true)
        }

        mainAlert.addAction(clearAction)
        mainAlert.addAction(deleteAction)
        
        present(mainAlert, animated: true)
    }
    
    @objc func addtapped() {
        tableView.isHidden = false
        viewModel.countOfChild.append(1)
        tableView.reloadData()
        viewModel.hidenAddButton {
            self.addButton.isHidden = true
        }
        
    }
    @objc func clearButtonTapped() {
        clearPage()
        viewModel.countOfChild = []
    }
}


//MARK: - TableView setup

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countOfChild.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
