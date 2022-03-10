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
    
    private var dayOfTheMonthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13) // check Figma template!
        label.textAlignment = .left
        label.text = "Today"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private var dayOfTheWeekLabel: UILabel = {
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
        contentView.addSubview(dayOfTheMonthLabel)
        contentView.addSubview(dayOfTheWeekLabel)
        contentView.addSubview(conditionView)
        contentView.addSubview(minLabel)
        contentView.addSubview(maxLabel)
        
        makeConstraints()
    }
    
    //MARK: - constraints
    private func makeConstraints(){
        
        // dateLabel constraints
        //dayOfTheMonthLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayOfTheMonthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        dayOfTheMonthLabel.widthAnchor.constraint(equalToConstant: 124).isActive = true
        dayOfTheMonthLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        dayOfTheMonthLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        
        // dateLabel constraints
        //dayOfTheWeekLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayOfTheWeekLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        dayOfTheWeekLabel.widthAnchor.constraint(equalToConstant: 124).isActive = true
        dayOfTheWeekLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        dayOfTheWeekLabel.topAnchor.constraint(equalTo: dayOfTheMonthLabel.bottomAnchor, constant: 1).isActive = true
        
        // conditionView constraints
        conditionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        conditionView.trailingAnchor.constraint(equalTo: maxLabel.leadingAnchor, constant: -18).isActive = true
        conditionView.widthAnchor.constraint(equalToConstant: 33).isActive = true
        conditionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //minLabel constraints
        minLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        minLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        minLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true // check Figma template!
        
        //maxLabel constraints
        maxLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        maxLabel.trailingAnchor.constraint(equalTo: minLabel.leadingAnchor, constant: -8).isActive = true
        maxLabel.widthAnchor.constraint(equalToConstant: 49).isActive = true // check Figma template!
        
    }
    
    //MARK: - configure
    func set(data: CurrentWeatherViewModel.Daily){
        dayOfTheMonthLabel.text = String(data.dt)
        dayOfTheWeekLabel.text = String(data.dt)
        conditionView.image = UIImage(named: data.icon)
        minLabel.text = data.minTemp
        maxLabel.text = data.maxTemp
    }
        
    //
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
