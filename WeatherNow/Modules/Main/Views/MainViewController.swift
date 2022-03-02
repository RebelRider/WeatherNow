//
//  MainViewController.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let headView = HeadView()
    
    //MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headView)
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        reconfigureUI()
    }
    
  
//MARK: - lower table

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

}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = days[indexPath.row]
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    //
}


private extension MainViewController {
    //MARK: - view configuration
    func reconfigureUI() {
        headView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - (self.view.bounds.height / 3 * 2) - 44)
        tableView.frame = CGRect(x: 0, y: headView.bounds.maxY, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    func configureUI() {
        print("configuring UI")
        
        let stackH1 = UIStackView(arrangedSubviews: [headView.cityLabel, headView.locationMenuButton])
        stackH1.axis = .horizontal
        stackH1.distribution = .equalSpacing
        stackH1.spacing = 17
        stackH1.backgroundColor = .systemBlue
        
        let stackH2 = UIStackView(arrangedSubviews: [headView.temperatureLabel, headView.cloudyImageContainer])
        stackH2.axis = .horizontal
        stackH2.distribution = .equalCentering
        stackH2.spacing = 22
        stackH2.backgroundColor = .systemTeal
        
        
        headView.addSubview(stackH1)
        headView.addSubview(stackH2)
        headView.addSubview(headView.windPressureHumidityContainer)
        headView.addSubview(headView.daysForecastContainer)

        
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
        headView.windPressureHumidityContainer.anchr(top: stackH2.bottomAnchor, left: stackH2.leftAnchor,
                                            paddingTop: 3,
                                            paddingLeft: 15,
                                            paddingRight: 5)
        headView.daysForecastContainer.anchr(top:stackH2.bottomAnchor, left: headView.cloudyImageContainer.leftAnchor,
                           paddingTop: 21,
                           paddingLeft: 1,
                           paddingBottom: 1,
                           paddingRight: 1)
        headView.daysForecastContainer.backgroundColor = .red
        headView.daysForecastContainer.setSize(width: 332, height: 99)
        
        view.addSubview(headView)
        headView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - (self.view.bounds.height / 3 * 2) - 44)
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: headView.bounds.maxY, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    //MARK: - selectors
    @objc func showLocationMenuController() {
        print("DEBUG: show Location Menu Controller")
        let contrller = LocationInputController()
        navigationController?.pushViewController(contrller, animated: true)
    }    
    
}
