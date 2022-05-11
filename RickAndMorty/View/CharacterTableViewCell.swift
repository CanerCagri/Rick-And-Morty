//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    var characterImageView = UIImageView()
    
    var nameLabel : UILabel = {
        var label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    var speciesLabel : UILabel = {
        var label = UILabel()
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    var genderLabel : UILabel = {
        var label = UILabel()
        label.textColor = .brown
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(characterImageView)
        characterImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        characterImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 130).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(speciesLabel)
        speciesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
        speciesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 130).isActive = true
        speciesLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        speciesLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(genderLabel)
        genderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 320).isActive = true
        genderLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        genderLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
