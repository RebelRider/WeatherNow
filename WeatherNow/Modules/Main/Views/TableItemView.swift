//
//  TableItem.swift
//  WeatherNow
//
//  Created by Kirill Smirnov on 28.02.2022.
//

import UIKit

class TableItemView: UITableViewCell {

    let imgUser = UIImageView()
    let labUerName = UILabel()
    let labMessage = UILabel()
    let labTime = UILabel()

    override init(style: TableItemView.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)


//        let viewDict = [
//            "day" : fyfftyu,
//            "image" : fyfftyu,
//            "temp" : fyfftyu,
//            ] as [String : Any]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
