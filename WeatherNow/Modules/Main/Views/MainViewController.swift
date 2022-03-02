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
        view.backgroundColor = .systemBackground
        //view.addSubview(headView)
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
    tableView.backgroundColor = .systemBackground
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

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG: deselect row")
    }
}


private extension MainViewController {
    //MARK: - view configuration
    func reconfigureUI() {
        print("reconfiguring UI, isExpanded \(mustBeExpanded)")
        headView.frame = CGRect(x: 0,
                                y: 0,
                                width: self.view.bounds.width,
                                height: mustBeExpanded ? (self.view.bounds.height - ((self.view.bounds.height / 3 * 2) - 22)) : (self.view.bounds.height - (self.view.bounds.height / 2) - 44)
//                                height: ?????
                                )
        tableView.frame = CGRect(x: 0,
                                 y: headView.bounds.maxY,
                                 width: self.view.bounds.width,
                                 height: self.view.bounds.height)
        if mustBeExpanded {
            headView.windPressureHumidityContainer.isHidden = false
            headView.daysForecastContainer.isHidden = false
        } else {
            headView.windPressureHumidityContainer.isHidden = true
            headView.daysForecastContainer.isHidden = true
        }
    }
    
    func configureUI() {
        view.addSubview(headView)
        headView.frame = CGRect(x: 0,
                                y: 0,
                                width: self.view.bounds.width,
                                height: self.view.bounds.height - (self.view.bounds.height / 3 * 2) - 44)
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0,
                                 y: headView.bounds.maxY,
                                 width: self.view.bounds.width,
                                 height: self.view.bounds.height)
    }
    
    
}
