////
////  TableItem.swift
////  WeatherNow
////
////  Created by Kirill Smirnov on 28.02.2022.
////
//
//import UIKit
//
//class TableItem: UITableViewCell {
//    
//    let padding: CGFloat = 5
//    var background: UIView!
//    var dateLabel: UILabel!
//    var weekDaylabel: UILabel!
//    var cloudyIconImage: UIImage!
//    var dayTemp: UILabel!
//    var nightTemp: UILabel!
//    
//    var dailyWeather: DailyWeather? {
//        didSet {
//                    if let d = dayData {
//                        background.backgroundColor = s.backgroundColor
//                        dateLabel.text = d.dt
//                        dayTemp.text = d.da
//                        nightTemp.text = s.name
//                        setNeedsLayout()
//        }
//    }
//}
//
//override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    backgroundColor = .red
//    selectionStyle = .none
//    
//    background = UIView(frame: CGRectZero)
//    background.alpha = 0.6
//    contentView.addSubview(background)
//    
//    dateLabel = UILabel
//    
//    dateLabel = UILabel(frame: CGRectZero)
//    dateLabel.textAlignment = .Left
//    dateLabel.textColor = UIColor.blackColor()
//    contentView.addSubview(dateLabel)
//    
//    dayTemp = UILabel(frame: CGRectZero)
//    dayTemp.textAlignment = .Center
//    dayTemp.textColor = UIColor.whiteColor()
//    contentView.addSubview(typeLabel)
//    
//    nightTemp = UILabel(frame: CGRectZero)
//    nightTemp.textAlignment = .Center
//    nightTemp.textColor = UIColor.whiteColor()
//    contentView.addSubview(priceLabel)
//}
//
//required init(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//}
//
//override func prepareForReuse() {
//    super.prepareForReuse()
//    
//}
//
//override func layoutSubviews() {
//    super.layoutSubviews()
//    dateLabel.frame = CGRectMake(0, padding, frame.width, frame.height - 2 * padding)
//    dayTemp.frame = CGRectMake(padding, (frame.height - 25)/2, 40, 25)
//    priceLabel.frame = CGRectMake(frame.width - 100, padding, 100, frame.height - 2 * padding)
//    nightTemp.frame = CGRectMake(CGRectGetMaxX(typeLabel.frame) + 10, 0, frame.width - priceLabel.frame.width - (CGRectGetMaxX(typeLabel.frame) + 10), frame.height)
//}
//}
