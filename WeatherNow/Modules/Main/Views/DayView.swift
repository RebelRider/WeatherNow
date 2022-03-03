//
//  DayView.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 02.03.2022.
//

import UIKit

class DayView: UIView {
    
    let dLabel: UILabelWithPadding = {
        let lblt = UILabelWithPadding()
        lblt.text = "+25 C"
        lblt.font = lblt.font.withSize(45)
        return lblt
    }()
    
    let fdxt: UILabel = {
        let flt = UILabel()
        flt.text = "Cloudy, feels like +16"
        flt.font = flt.font.withSize(14)
        flt.addShadow()
        flt.backgroundColor = .systemBackground
        return flt
    }()
    
    let cdContainer: UIImageView = {
        var view = UIImageView()
        let img = UIImage(systemName: "cloud.drizzle.fill")!
            .withTintColor(.blue, renderingMode: .alwaysOriginal)
            .resized(to: CGSize(width: 66, height: 66))
        let imgView = UIImageView(image: img)
        view.addSubview(imgView)
        return view
    }()
    
}
