//
//  TableController.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit

private let reuseIdentifier = "tableCell"

class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var TableControllerDelegate?
    
    
    override func viewDidLoad() {
        print("viewDidLoad TableController")
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
    }
    
  
}
