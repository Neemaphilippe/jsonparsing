//
//  RandomUserViewController.swift
//  JSon
//
//  Created by Pursuit on 8/28/19.
//  Copyright © 2019 Nphilippe. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    var random = [PeopleInfo]() {
        didSet {
            randomUserTableView.reloadData()
        }
        
    }
    
    @IBOutlet weak var randomUserTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomUserTableView.dataSource = self
        randomUserTableView.delegate = self
        loadData()
        
    }
    
    
    private func loadData(){
        guard let pathToJsonFile = Bundle.main.path(forResource: "randomusers", ofType: "json")else {return}
        let url = URL(fileURLWithPath: pathToJsonFile)
            do {
            let data = try Data(contentsOf: url)
               random = try RandomUserData.getRandomUsers(data: data)
            }
            catch {
            print(error)
            }
    }


}

extension RandomUserViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return random.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = randomUserTableView.dequeueReusableCell(withIdentifier: "randomcell", for: indexPath)
        var personInfo = random[indexPath.row]
        cell.textLabel?.text = "\(personInfo.name.first) \(personInfo.name.last)"
        cell.detailTextLabel?.text = personInfo.email
        return cell
    }
    
}
