import UIKit

class HeadView: UIView {
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - head container elements
    private let isExpanded = true
    
    private lazy var headView: UIView = {
        let hv = UIView()
        hv.backgroundColor = .green
        return hv
    }()
    
    let cityLabel: UILabelWithPadding = {
        let lblc = UILabelWithPadding()
        lblc.text = "New York"
        lblc.font = lblc.font.withSize(28)
        lblc.setSize(width: 266, height: 44)
        lblc.backgroundColor = .brown
        return lblc
    }()
    
    let locationMenuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal")?
                            .withTintColor(.green, renderingMode: .alwaysOriginal)
                            .resized(to: CGSize(width: 25, height: 25)), for: .normal)
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease")?
                            .withTintColor(.green, renderingMode: .alwaysOriginal)
                            .resized(to: CGSize(width: 25, height: 25)), for: UIControl.State.highlighted)
        //button.addTarget(self, action: #selector(showLocationMenuController), for: .touchUpInside)
        
        return button
    }()
    
    let temperatureLabel: UILabelWithPadding = {
        let lblt = UILabelWithPadding()
        lblt.text = "+25k"
        lblt.font = lblt.font.withSize(33)
        lblt.setSize(width: 111, height: 44)
        return lblt
    }()
    
    let cloudyImageContainer: UIImageView = {
        var view = UIImageView()
        let img = UIImage(systemName: "cloud.drizzle.fill")!
            .withTintColor(.white, renderingMode: .alwaysOriginal)
            .resized(to: CGSize(width: 66, height: 66))
        let imgView = UIImageView(image: img)
        view.addSubview(imgView)
        return view
    }()
    
    
    //MARK: - Wind Pressure Humidity Container
    let windPressureHumidityContainer: UIView = {
        let wphc = UIView()
        
        let wind = UILabel()
        let pressure = UILabel()
        let humid = UILabel()
        
        wind.addLeading(image: UIImage(systemName: "wind") ?? UIImage(), text: "10 m/s, NW")
        pressure.addLeading(image: UIImage(systemName: "timer") ?? UIImage(), text: "701 mPa")
        humid.addLeading(image: UIImage(systemName: "humidity") ?? UIImage(), text: "77%")
        
        let stackV1 = UIStackView(arrangedSubviews: [wind, pressure, humid])
        stackV1.axis = .vertical
        stackV1.distribution = .fillProportionally
        stackV1.spacing = 17
        stackV1.backgroundColor = .systemBlue
        
        wphc.addSubview(stackV1)
        stackV1.anchr(top: wphc.topAnchor,
                      paddingTop: 0,
                      paddingLeft: 45,
                      paddingRight: 25)
        return wphc
    }()
    
    //MARK: - Days Forecast Container
    let daysForecastContainer: UIView = {
        let scrollView = UIScrollView()
        let daysForecast = UIView()
        
        let aa = UILabel()
        let bb = UILabel()
        let cc = UILabel()
        let dd = UILabel()
        let ee = UILabel()
                
        aa.addLeading(image: UIImage(systemName: "car") ?? UIImage(), text: "Maondaasada")
        bb.addLeading(image: UIImage(systemName: "bus") ?? UIImage(), text: "wednes")
        cc.addLeading(image: UIImage(systemName: "humidity") ?? UIImage(), text: "sunDdyaaaaa")
        dd.addLeading(image: UIImage(systemName: "human") ?? UIImage(), text: "sasdasdy")
        ee.addLeading(image: UIImage(systemName: "sun") ?? UIImage(), text: "adsrhdh")
        
        let stackDaysForecast = UIStackView(arrangedSubviews: [aa, bb, cc, dd, ee])
        stackDaysForecast.axis = .horizontal
        stackDaysForecast.alignment = .fill
        stackDaysForecast.distribution = .fillProportionally
        stackDaysForecast.spacing = 5
        
        
        scrollView.addSubview(stackDaysForecast)
        daysForecast.addSubview(scrollView)
                
        stackDaysForecast.anchr(top: daysForecast.topAnchor, bottom: daysForecast.bottomAnchor, paddingTop: 2, paddingLeft: 2, paddingBottom: 2, paddingRight: 2)//, width: 555, height: 55)
        scrollView.anchr(top: daysForecast.topAnchor, left: daysForecast.leftAnchor, bottom: daysForecast.bottomAnchor, right: daysForecast.rightAnchor)//, paddingTop: 2, paddingLeft: 2, paddingBottom: 2, paddingRight: 2, width: 0, height: 0)
        
        //scrollView.contentSize = CGSize(width: scrollView.bounds.width + 222, height: scrollView.bounds.height)
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.backgroundColor = .cyan
        //scrollView.centerX(stackDaysForecast)
        daysForecast.isUserInteractionEnabled = true
        
        return daysForecast
    }()
    
    
}
