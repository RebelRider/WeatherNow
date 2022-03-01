//import UIKit
//
////MARK: - head container elements
//var isExpanded = true
//
//class headView: UIView {
//
//
//private let cityLabel: UILabelWithPadding = {
//    let lblc = UILabelWithPadding()
//    lblc.text = "New York"
//    lblc.font = lblc.font.withSize(28)
//    lblc.setSize(width: 266, height: 44)
//    lblc.backgroundColor = .brown
//    return lblc
//}()
//
//private let locationMenuButton: UIButton = {
//    let button = UIButton()
//    button.setImage(UIImage(systemName: "line.3.horizontal")?
//                        .withTintColor(.green, renderingMode: .alwaysOriginal)
//                        .resized(to: CGSize(width: 25, height: 25)), for: .normal)
//    button.setImage(UIImage(systemName: "line.3.horizontal.decrease")?
//                        .withTintColor(.green, renderingMode: .alwaysOriginal)
//                        .resized(to: CGSize(width: 25, height: 25)), for: UIControl.State.highlighted)
//    //button.addTarget(self, action: #selector(showLocationMenuController), for: .touchUpInside)
//    
//    return button
//}()
//
//private let temperatureLabel: UILabelWithPadding = {
//    let lblt = UILabelWithPadding()
//    lblt.text = "+25k"
//    lblt.font = lblt.font.withSize(33)
//    lblt.setSize(width: 111, height: 44)
//    return lblt
//}()
//
//private let cloudyImageContainer: UIImageView = {
//    var view = UIImageView()
//    let img = UIImage(systemName: "cloud.drizzle.fill")!
//                .withTintColor(.white, renderingMode: .alwaysOriginal)
//                .resized(to: CGSize(width: 66, height: 77))
//    let imgView = UIImageView(image: img)
//    imgView.frame = CGRect(x: 1, y: 1, width: 66, height: 88)
//    view.addSubview(imgView)
//    return view
//}()
//
//
//
//private let windPressureHumidityContainer: UIView = {
//   let wphc = UIView()
//    
//    let wind = UILabel()
//    let pressure = UILabel()
//    let humid = UILabel()
//    
//    wind.addLeading(image: UIImage(systemName: "wind") ?? UIImage(), text: "10 m/s, NW")
//    pressure.addLeading(image: UIImage(systemName: "timer") ?? UIImage(), text: "701 mPa")
//    humid.addLeading(image: UIImage(systemName: "humidity") ?? UIImage(), text: "77%")
//    
//    let stackV1 = UIStackView(arrangedSubviews: [wind, pressure, humid])
//    stackV1.axis = .vertical
//    stackV1.distribution = .fillProportionally
//    stackV1.spacing = 17
//    stackV1.backgroundColor = .systemBlue
//    
//    wphc.addSubview(stackV1)
//    stackV1.anchr(top: wphc.topAnchor,
//                  paddingTop: 0,
//                  paddingLeft: 45,
//                  paddingRight: 25)
//    return wphc
//}()
//
//
//    //MARK: - days scroll view
//    private let daysForecastStack: UIStackView = {
//        let dfc = UIStackView()
//        dfc.axis = .horizontal
//        dfc.spacing = 5
//        dfc.backgroundColor = .systemTeal
//        return dfc
//    }()
//    
//    private let daysForecastScroll: UIScrollView = {
//        let dfs = UIScrollView()
//        dfs.backgroundColor = .green
//        return dfs
//    }()
//
//    private let daysForecast: UIView = {
//        let df = UIView()
//        df.backgroundColor = .red
//        return df
//    }()
//    
//    let tffff: UILabel = {
//       let t = UILabel()
//        t.text = "ttttt fff xcc "
//        t.font = t.font.withSize(33)
//        t.setSize(width: 111, height: 44)
//        return t
//    }()
//    
//    let tffddf: UILabel = {
//       let t = UILabel()
//        t.text = "ttccadsfgagatt "
//        t.font = t.font.withSize(33)
//        t.setSize(width: 111, height: 44)
//        return t
//    }()
//
//}
