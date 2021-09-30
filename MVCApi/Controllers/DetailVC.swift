//
//  DetailVC.swift
//  MVCApi
//
//  Created by Fernado Belen on 29/09/2021.
//

import UIKit

class DetailVC: UIViewController {

    var contact: Contact
    
    lazy var tableViewDetail: UITableView = {
        let tableViewDetail = UITableView()
        tableViewDetail.translatesAutoresizingMaskIntoConstraints = false
        tableViewDetail.estimatedRowHeight = UITableView.automaticDimension
        tableViewDetail.separatorStyle = .none
        return tableViewDetail
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.title = "Detail Contact"
    }
    
    private func setupView(){
        addViewHerarchy()
        addViewConstraints()
        addProperties()
    }
    
    private func addViewHerarchy(){
        view.addSubview(tableViewDetail)
    }
    
    private func addViewConstraints(){
        NSLayoutConstraint.activate([tableViewDetail.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableViewDetail.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableViewDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableViewDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    private func addProperties(){
        tableViewDetail.dataSource = self
        tableViewDetail.delegate = self
        tableViewDetail.register(DataDetailCell.self, forCellReuseIdentifier: "DataDetailCell")
    }
    
    init(with contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataDetailCell", for: indexPath) as! DataDetailCell
        cell.contact = self.contact
        return cell
    }
}

extension DetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
