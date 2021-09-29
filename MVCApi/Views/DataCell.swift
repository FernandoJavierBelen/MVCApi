//
//  DataCell.swift
//  MVCApi
//
//  Created by Fernado Belen on 29/09/2021.
//

import UIKit

class DataCell: UITableViewCell {

    var contact: Contact! {
        didSet{
            lblName.text = contact.name
            lblEmail.text = contact.email
        }
    }
    
    private lazy var lblName: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblEmail: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Etiquetas
    
    private lazy var lblFullName: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.text = String.lblFullName
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var lblEmialTitle: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.text = String.lblEmailTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addViewHerarchy()
        addConstraints()
    }
    
    func addViewHerarchy(){
        addSubview(lblName)
        addSubview(lblEmail)
        addSubview(lblFullName)
        addSubview(lblEmialTitle)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([lblName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                                     lblName.leadingAnchor.constraint(equalTo: lblFullName.trailingAnchor, constant: 20),
                                     lblName.heightAnchor.constraint(equalToConstant: 20),
                                     lblEmail.topAnchor.constraint(equalTo: lblName.topAnchor, constant: 40),
                                     lblEmail.leadingAnchor.constraint(equalTo: lblEmialTitle.trailingAnchor, constant: 55),
                                     lblEmail.heightAnchor.constraint(equalToConstant: 20),
                                    
                                     lblFullName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                                     lblFullName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     lblFullName.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblEmialTitle.topAnchor.constraint(equalTo: lblFullName.bottomAnchor, constant: 20),
                                     lblEmialTitle.leadingAnchor.constraint(equalTo: lblFullName.leadingAnchor, constant: 0),
                                     lblEmialTitle.heightAnchor.constraint(equalToConstant: 20)])
    }
}

fileprivate extension String {
    static var lblFullName = "Full Name: "
    static var lblEmailTitle = "Email: "
}
