//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var viewModel = CharacterViewModel()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rick And Morty Characters"
       
        loadSettings()
    }
    
    func loadSettings() {
        tableView.separatorColor = UIColor.clear
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 0, y: 0, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.delegate = self
        viewModel.loadData()
    }
}

extension ViewController: CharacterViewModelDelegate {
    func handleViewModelOutput(_ output: [Character]) {
        viewModel.characters = output
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightRowAt()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        let cellRow = viewModel.characters[indexPath.row]
        let url = URL(string: cellRow.image ?? viewModel.kingFisherTools().0)
      
        cell.characterImageView.kf.indicatorType = .activity
        cell.characterImageView.kf.setImage(with: url, placeholder: nil, options: [.processor(viewModel.kingFisherTools().1), .scaleFactor(UIScreen.main.scale), .transition(.fade(2)), .cacheOriginalImage])
        cell.nameLabel.text = cellRow.name
        cell.genderLabel.text = cellRow.gender
        cell.speciesLabel.text = cellRow.species
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO : implement.
    }
}
