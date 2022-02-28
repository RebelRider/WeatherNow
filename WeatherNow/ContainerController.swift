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
        lblc.font = lblc.font.withSize(28)
        lblc.setSize(width: 266, height: 44)
        lblc.backgroundColor = .brown
        return lblc
    }()
    
    private let locationMenuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal")?
                            .withTintColor(.green, renderingMode: .alwaysOriginal)
                            .resized(to: CGSize(width: 25, height: 25)), for: .normal)
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease")?
                            .withTintColor(.green, renderingMode: .alwaysOriginal)
                            .resized(to: CGSize(width: 25, height: 25)), for: UIControl.State.highlighted)
        button.addTarget(self, action: #selector(showLocationMenuController), for: .touchUpInside)
        
        return button
    }()
    
    private let temperatureLabel: UILabelWithPadding = {
        let lblt = UILabelWithPadding()
        lblt.text = "+25k"
        lblt.font = lblt.font.withSize(33)
        lblt.setSize(width: 111, height: 44)
        return lblt
    }()
    
    private let cloudyImageContainer: UIImageView = {
        var view = UIImageView()
        let img = UIImage(systemName: "cloud.drizzle.fill")!
                    .withTintColor(.white, renderingMode: .alwaysOriginal)
                    .resized(to: CGSize(width: 66, height: 66))
        let imgView = UIImageView(image: img)
        view.addSubview(imgView)
        return view
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
        reconfigureUI()
    }
    
    
    func reconfigureUI() {
        
    }

    func configureUI() {
        print("configuring UI")
        
        
        let stackH1 = UIStackView(arrangedSubviews: [cityLabel, locationMenuButton])
        stackH1.axis = .horizontal
        stackH1.distribution = .equalSpacing
        stackH1.spacing = 17
        stackH1.backgroundColor = .systemBlue
        
        let stackH2 = UIStackView(arrangedSubviews: [temperatureLabel, cloudyImageContainer])
        stackH2.axis = .horizontal
        stackH2.distribution = .equalCentering
        stackH2.spacing = 22
        stackH2.backgroundColor = .systemTeal
        
        headView.addSubview(stackH1)
        headView.addSubview(stackH2)
        stackH1.anchr(top: headView.topAnchor,
                    left: headView.leftAnchor,
                    right: headView.rightAnchor,
                    paddingTop: 33,
                    paddingLeft: 5,
                    paddingRight: 5)
        stackH2.anchr(top: stackH1.bottomAnchor,
                      paddingTop: 0,
                      paddingLeft: 45,
                      paddingRight: 25)
        headView.insetsLayoutMarginsFromSafeArea = true
        
        
        
        view.addSubview(headView)
        headView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 555)
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: headView.bounds.maxY, width: self.view.bounds.width, height: self.view.bounds.height)
        
    }
    
    @objc func showLocationMenuController() {
        print("DEBUG: show Location Menu Controller")
        let contrller = LocationInputController()
        navigationController?.pushViewController(contrller, animated: true)
    }
    

}
