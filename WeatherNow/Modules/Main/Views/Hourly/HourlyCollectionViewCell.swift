//
//  HourlyCollectionViewCell.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 08.03.2022.
//

import Foundation
import UIKit

class HourlyCollectionViewCell: UICollectionViewCell{
    
    static let reuseId = "HourlyCollectionViewCell"
    
    //MARK: - variables
    private var blurEffectView = BlurEffect()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12) // check Figma template
        label.textAlignment = .center
        return label
    }()
    
    private var conditionView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var tempLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12) // check Figma template
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        contentView.addSubview(blurEffectView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(conditionView)
        contentView.addSubview(tempLabel)
        
        makeConstraints()
    }
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    //MARK: - constraints
    private func makeConstraints(){
        
        // dateLabel constraints
        dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 37).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // conditionView constraints
        conditionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        conditionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        conditionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        conditionView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        // tempLabel constraints
        tempLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -33).isActive = true
        tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    //MARK: - set image & txt
    func setData(data: CurrentWeatherViewModel.Hourly){
        dateLabel.text = data.dt
        conditionView.image = UIImage(named: data.icon)
        tempLabel.text = data.temp
    }
    
    //
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
