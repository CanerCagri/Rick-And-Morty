//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = CharacterViewModel()
    var label = UILabel()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        tableView.delegate = self
        tableView.dataSource = self
        
        print("test")
        loadSettings()
    }
    
    func loadSettings() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        view.addSubview(tableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.delegate = self
        viewModel.loadData()
        
       
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
      
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.characters.count)
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellItem = viewModel.characters[indexPath.row]
        cell.textLabel?.text = cellItem.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
  
}
