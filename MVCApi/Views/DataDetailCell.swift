//
//  DataDetailCell.swift
//  MVCApi
//
//  Created by Fernado Belen on 29/09/2021.
//

import UIKit

class DataDetailCell: UITableViewCell {
    
    var contact: Contact! {
        didSet{
            lblName.text = contact.name
            lblEmail.text = contact.email
        }
    }
    
    private lazy var lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblEmail: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // etiquetas
    private lazy var lblFullName: UILabel = {
        let label = UILabel()
        label.text = String.lblFullName
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblEmialTitle: UILabel = {
        let label = UILabel()
        label.text = String.lblEmailTitle
        label.textColor = .gray
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
        NSLayoutConstraint.activate([lblName.topAnchor.constraint(equalTo: topAnchor, constant: 40),
                                     lblName.leadingAnchor.constraint(equalTo: lblFullName.trailingAnchor, constant: 20),
                                     lblName.heightAnchor.constraint(equalToConstant: 40),
                                     lblEmail.topAnchor.constraint(equalTo: lblName.topAnchor, constant: 40),
                                     lblEmail.leadingAnchor.constraint(equalTo: lblEmialTitle.trailingAnchor, constant: 55),
                                     lblEmail.heightAnchor.constraint(equalToConstant: 40),
                                     
                                     lblFullName.topAnchor.constraint(equalTo: topAnchor, constant: 40),
                                     lblFullName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     lblFullName.heightAnchor.constraint(equalToConstant: 40),
                                     
                                     lblEmialTitle.topAnchor.constraint(equalTo: lblFullName.bottomAnchor, constant: 10),
                                     lblEmialTitle.leadingAnchor.constraint(equalTo: lblFullName.leadingAnchor, constant: 0),
                                     lblEmialTitle.heightAnchor.constraint(equalToConstant: 20)])
    }
}
fileprivate extension String {
    static var lblFullName = "Full Name: "
    static var lblEmailTitle = "Email: "
}
