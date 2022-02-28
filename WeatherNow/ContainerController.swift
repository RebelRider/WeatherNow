//
//  ContainerController.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit

class ContainerController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = days[indexPath.row]
        return cell
    }
    
    
    private let isExpanded = true
    private lazy var headView: UIView = {
        let hv = UIView()
        hv.backgroundColor = .green
        return hv
    }()
    
    private let cityLabel: UILabelWithPadding = {
        let lblc = UILabelWithPadding()
        lblc.text = "New York"
        lblc.font = UIFont(name: "Verdana", size: 14)
        lblc.setSize(width: 111, height: 33)
        return lblc
    }()
    
    private let temperatureLabel: UILabelWithPadding = {
        let lblt = UILabelWithPadding()
        lblt.text = "+25k"
        lblt.font = UIFont(name: "Verdana", size: 14)
        lblt.setSize(width: 111, height: 33)
        return lblt
    }()
    
    
    
    
    var days =     ["Monday", "Tuesday", "Friday", "Sunday", "Monday", "Tuesday", "Friday", "Sunday"]

    private let reuseIdentifier = "cell"
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .brown
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        configureUI()
    }
    
    
  

    func configureUI() {
        print("configuring UI")
        
        let stack = UIStackView(arrangedSubviews: [cityLabel, temperatureLabel])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 22
        stack.backgroundColor = .systemBlue
        
        
        
        headView.addSubview(stack)
        stack.anchr(top: headView.topAnchor,
                    left: headView.leftAnchor,
                    right: headView.rightAnchor,
                    paddingTop: 33,
                    paddingLeft: 11,
                    paddingRight: 11)
        headView.insetsLayoutMarginsFromSafeArea = true
        
        
        
        view.addSubview(headView)
        headView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 555)
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: headView.bounds.maxY, width: self.view.bounds.width, height: self.view.bounds.height)
        
    }
    

}
