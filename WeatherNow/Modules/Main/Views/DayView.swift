//
//  DayView.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 02.03.2022.
//

import UIKit

class DayView: UIView {
    let hourLabel: UILabel = {
        let lblH = UILabelWithPadding()
        lblH.text = "Now"
        // lblH.font = lblH.font.withSize(45)
        return lblH
    }()
    
    let cloudyImage: UIImageView = {
        var view = UIImageView()
        let img = UIImage(systemName: "sun")!
            .withTintColor(.blue, renderingMode: .alwaysOriginal)
            //.resized(to: CGSize(width: 66, height: 66))
        let imgView = UIImageView(image: img)
        view.addSubview(imgView)
        return view
    }()
    
    let temperatureLabel: UILabel = {
        let lblT = UILabel()
        lblT.text = "22"
        // lblT.font = lblT.font.withSize(14)
        lblT.addShadow()
        lblT.backgroundColor = .systemBackground
        return lblT
    }()
}
