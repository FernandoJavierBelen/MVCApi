//
//  HomeVC.swift
//  MVCApi
//
//  Created by Fernado Belen on 29/09/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    var list = [Contact]()
    var httpClient = HTTPClient()
    
    lazy var indiatorView: UIActivityIndicatorView = {
       let indicatorView = UIActivityIndicatorView()
        indicatorView.backgroundColor = .white
        indicatorView.hidesWhenStopped = true
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Contacts"
        setupView()
        self.indiatorView.startAnimating()
        httpClient.request(urlString: "https://androidhive.info/contacts/", method: "GET", completion: {(list: Contacts?, success: Bool) in
            if success, let list = list?.contacts {
                self.list = list
                self.tableView.reloadData()
            }
            self.indiatorView.stopAnimating()
        })
    }
    
    func setupView(){
        addViewHerarchy()
        addConstrains()
        addProperties()
    }
    
    func addViewHerarchy(){
        view.addSubview(tableView)
        view.addSubview(indiatorView)
    }
    
    func addConstrains(){
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                    
                                     indiatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     indiatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    func addProperties(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DataCell.self, forCellReuseIdentifier: "DataCell")
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataCell
        cell.contact = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
}
