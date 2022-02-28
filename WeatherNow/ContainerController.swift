//
//  ContainerController.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit

class ContainerController: UIViewController, TableControllerDelegate, HeadControllerDelegate {
    
    private let isExpanded = true
    private let headController = HeadController()
    private let tableController = TableController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func requestWeatherData() {
        
    }
    
    func configure() {
        configureHeadController()
        configureTableController()
    }
    
    func configureHeadController() {
        print("configuring HeadController")
        addChild(headController)
        headController.didMove(toParent: self)
        view.addSubview(tableController.view)
        headController.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        headController.delegateHead = self
    }
    
    func configureTableController() {
        print("configuring TableController")
        addChild(tableController)
        tableController.didMove(toParent: self)
        view.addSubview(tableController.view)
        tableController.view.frame = CGRect(x: 0, y: 122, width: self.view.bounds.width - 88, height: self.view.bounds.height - 122)
        tableController.delegateTable = self
    }
}
