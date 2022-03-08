//
//  DailyTableViewCell.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 08.03.2022.
//

import Foundation
import UIKit

class DailyTableViewCell: UITableViewCell{
    
    static let reuseId = "DailyTableViewCell"
    
    //MARK: - variables
    private var blurEffectView = BlurEffect()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17) // check Figma template!
        label.textAlignment = .left
        label.text = "Today"
        return label
    }()
    
    private var conditionView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "09d")
        return view
    }()
    
    private var maxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .right
        label.text = "+15" + "º"
        return label
    }()
    
    private var minLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16) // check Figma template!
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        label.text = "+10" + "º"
        return label
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        contentView.addSubview(blurEffectView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(conditionView)
        contentView.addSubview(minLabel)
        contentView.addSubview(maxLabel)
        
        makeConstraints()
    }
    
    //MARK: - constraints
    private func makeConstraints(){
        
        //blurEffectView constraints
//        blurEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // dateLabel constraints
        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 124).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        // conditionView constraints
        conditionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        conditionView.trailingAnchor.constraint(equalTo: maxLabel.leadingAnchor, constant: -18).isActive = true
        conditionView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        conditionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //minLabel constraints
        minLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        minLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        minLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //maxLabel constraints
        maxLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        maxLabel.trailingAnchor.constraint(equalTo: minLabel.leadingAnchor, constant: -8).isActive = true
        maxLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: - configure
    func set(data: CurrentWeatherViewModel.Daily){
        dateLabel.text = String(data.dt)
        conditionView.image = UIImage(named: data.icon)
        minLabel.text = data.minTemp
        maxLabel.text = data.maxTemp
    }
        
    //
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
