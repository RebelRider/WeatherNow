//
//  MainViewController.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit

class MainViewController: UIViewController {    
    var weatherManager = WeatherAPI()
    private let headView = HeadView()
    private var hourText = "Now"
    private var cloudyImage = "sun"
    private var temperatureText = "+25"
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //view.addSubview(headView)
        configureUI()
    }
    override func viewDidLayoutSubviews() {
        reconfigureUI()
    }
    // MARK: - lower table
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

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return days.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = days[indexPath.row]
        //        cell.setModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG: deselect row")
        mustBeExpanded = true
        reconfigureUI()
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        mustBeExpanded = false
        reconfigureUI()
    }
}

// MARK: - Private

private extension MainViewController {
    // MARK: - View configuration
    func configureUI() {
        view.addSubview(headView)
        view.addSubview(tableView)
        
        let mainStack = UIStackView(arrangedSubviews: [headView,
                                                       tableView])
        mainStack.axis = .vertical
        mainStack.distribution = .fill//????????
        mainStack.alignment = .top
        mainStack.spacing = 6
        
        headView.anchr(
            top: mainStack.safeAreaLayoutGuide.topAnchor,
            left: mainStack.safeAreaLayoutGuide.leftAnchor,
            bottom: tableView.topAnchor,
            right: mainStack.safeAreaLayoutGuide.rightAnchor,
            paddingTop: 2,
            paddingLeft: 0,
            paddingBottom: 0,
            paddingRight: 0
        )
        tableView.anchr(
            top: headView.bottomAnchor,
            left: mainStack.safeAreaLayoutGuide.leftAnchor,
            bottom: mainStack.safeAreaLayoutGuide.bottomAnchor,
            right: mainStack.safeAreaLayoutGuide.rightAnchor,
            paddingTop: 2,
            paddingLeft: 0,
            paddingBottom: 0,
            paddingRight: 0
        )
        
        view.addSubview(mainStack)
        mainStack.anchr(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingTop: 1,
            paddingLeft: 1,
            paddingBottom: 1,
            paddingRight: 1
        )
    }
    
    func reconfigureUI() {
        print("reconfiguring UI, isExpanded \(mustBeExpanded)")
        // configureUI()
        if UIDevice.current.orientation == .portrait || mustBeExpanded {
            headView.windPressureHumidityContainer.isHidden = false
            headView.daysForecastContainer.isHidden = false
            headView.setSizeHeightLessOrEqual(height: view.frame.size.height * 0.4)
        } else {
            headView.windPressureHumidityContainer.isHidden = true
            headView.daysForecastContainer.isHidden = true
            headView.setSizeHeightLessOrEqual(height: 133)
        }
    }
}
