//
//  HeadController.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit

class HeadController: UIViewController {
    
    weak var delegateHead: HeadControllerDelegate?
  
    private let cityLabel: UILabelWithPadding = {
        let lbl = UILabelWithPadding()
        lbl.text = "New York"
        lbl.font = UIFont(name: "Verdana", size: 14)
        lbl.setSize(width: 111, height: 33)
        return lbl
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        print("viewDidLoad HeadController")
        super.viewDidLoad()
        configureUI()
    }
    
    
    
    func configureUI() {
        view.backgroundColor = .green
        view.addSubview(cityLabel)
        cityLabel.anchr(top: view.safeAreaLayoutGuide.topAnchor, paddingLeft: -33, paddingRight: -33)
        
    }
}

protocol HeadControllerDelegate: AnyObject {
    
}
