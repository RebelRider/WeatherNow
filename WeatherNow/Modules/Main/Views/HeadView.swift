import UIKit

var mustBeExpanded = true {
    didSet {
        //
    }
}


class HeadView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        configureHeadView()    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Head container elements
    
    private let cityLabel: UILabelWithPadding = {
        let lblc = UILabelWithPadding()
        lblc.text = "New York   hjgf"
        lblc.font = lblc.font.withSize(28)
        lblc.addShadow()
        lblc.backgroundColor = .systemBackground
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
        button.addTarget(self, action: #selector(showLocationMenuController), for: .touchUpInside)
        return button
    }()
    
    let temperatureLabel: UILabelWithPadding = {
        let lblt = UILabelWithPadding()
        lblt.text = "+25 C"
        lblt.font = lblt.font.withSize(45)
        return lblt
    }()
    
    let feelsLikeText: UILabel = {
        let flt = UILabel()
        flt.text = "Cloudy, feels like +16"
        flt.font = flt.font.withSize(14)
        flt.addShadow()
        flt.backgroundColor = .systemBackground
        return flt
    }()
    
    let cloudyImageContainer: UIImageView = {
        var view = UIImageView()
        let img = UIImage(systemName: "cloud.drizzle.fill")!
            .withTintColor(.blue, renderingMode: .alwaysOriginal)
            .resized(to: CGSize(width: 66, height: 66))
        let imgView = UIImageView(image: img)
        view.addSubview(imgView)
        return view
    }()
        
    //MARK: - Wind Pressure Humidity Container
    
    let windPressureHumidityContainer: UIStackView = {
        let wind = UILabel()
        let pressure = UILabel()
        let humid = UILabel()
        
        wind.addLeading(image: UIImage(systemName: "wind") ?? UIImage(), text: "10 m/s, NW")
        pressure.addLeading(image: UIImage(systemName: "timer") ?? UIImage(), text: "701 mPa")
        humid.addLeading(image: UIImage(systemName: "humidity") ?? UIImage(), text: "77%")
        
        wind.font = wind.font.withSize(12)
        pressure.font = wind.font.withSize(12)
        humid.font = wind.font.withSize(12)
        
        let stackV1 = UIStackView(arrangedSubviews: [wind, pressure, humid])
        stackV1.axis = .vertical
        stackV1.distribution = .fillEqually
        stackV1.spacing = 3
        stackV1.backgroundColor = .systemBackground
        
        return stackV1
    }()
    
    //MARK: - Days Forecast Container
    
    let daysForecastContainer: UIScrollView = {
        let scrollView = UIScrollView()
        
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
        
        stackDaysForecast.anchr(
            top: scrollView.topAnchor,
            left: scrollView.leftAnchor,
            bottom: scrollView.bottomAnchor,
            right: scrollView.rightAnchor,
            paddingTop: 1,
            paddingLeft: 8,
            paddingBottom: 1,
            paddingRight: 1
        )
        
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.backgroundColor = .systemBackground
        
        return scrollView
    }()
    
    
    //MARK: - configureHeadView func
    func configureHeadView() {
        print("configuring HeadView")
        
        let stackH1 = UIStackView(arrangedSubviews: [cityLabel, locationMenuButton])
        stackH1.axis = .horizontal
        stackH1.distribution = .fillProportionally
        stackH1.spacing = 11
        stackH1.backgroundColor = .systemBackground
        
        let stackV1 = UIStackView(arrangedSubviews: [temperatureLabel, feelsLikeText])
        stackV1.axis = .vertical
        stackV1.distribution = .fillProportionally
        stackV1.spacing = 11
        stackV1.backgroundColor = .systemBackground
        
        let stackH2 = UIStackView(arrangedSubviews: [stackV1, cloudyImageContainer])
        stackH2.axis = .horizontal
        stackH2.distribution = .fillEqually
        stackH2.spacing = 6
        stackH2.backgroundColor = .systemBackground
        
        let stackH3 = UIStackView(arrangedSubviews: [windPressureHumidityContainer, daysForecastContainer])
        stackH3.axis = .horizontal
        stackH3.distribution = .fill//????????
        stackH3.spacing = 6
        stackH3.backgroundColor = .systemBackground
        
        addSubview(stackH1)
        addSubview(stackH2)
        addSubview(stackH3)
        
        stackH1.anchr(
            top: safeAreaLayoutGuide.topAnchor,
                      left: safeAreaLayoutGuide.leftAnchor,
                      right: safeAreaLayoutGuide.rightAnchor,
                      paddingTop: 19,
                      paddingBottom: 2
        )
        stackH2.anchr(
            top: stackH1.bottomAnchor,
                      left: safeAreaLayoutGuide.leftAnchor,
                      right: safeAreaLayoutGuide.rightAnchor,
                      paddingTop: 3,
                      paddingLeft: 7,
                      paddingBottom: 27,
                      paddingRight: 3
        )
        stackH3.anchr(
            top: stackH2.bottomAnchor,
                      left: safeAreaLayoutGuide.leftAnchor,
                      right: safeAreaLayoutGuide.rightAnchor,
                      paddingTop: 19,
                      paddingLeft: 11,
                      paddingBottom: 3,
                      paddingRight: 3
        )
    }
    
    func hideShow(){
        
    }
    
//    func setModel
    
    //MARK: - selectors
    
    @objc func showLocationMenuController() {
        print("DEBUG: show Location Menu Controller")
        let contrller = LocationInputController()
        //navigationController?.pushViewController(contrller, animated: true)
        mustBeExpanded.toggle()
    }
    
}
