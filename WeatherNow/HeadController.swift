//
//  HeadController.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 27.02.2022.
//

import UIKit

class HeadController: UIViewController {
    
    weak var delegateHead: HeadControllerDelegate?
  
    private let cityLabel: UILabel = {
       let lbl = UILabel()
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
        view.backgroundColor = .blue
        configureUI()
    }
    
    
    
    func configureUI() {
        
    }
}

protocol HeadControllerDelegate: AnyObject {
    
}
