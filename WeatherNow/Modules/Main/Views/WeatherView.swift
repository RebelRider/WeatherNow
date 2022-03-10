import Foundation
import UIKit
import AVFoundation

class WeatherView: UIView { // UIScrollView?
    
    //MARK: - private
    
    private var mainView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    private var loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "loading data..."
       return label
    }()
    
    private var cityLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 35)
        label.textAlignment = .right
        label.text = "-"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    
    private var locationInputButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .highlighted)
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    
    private var tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60, weight: .thin)
        label.textAlignment = .left
        label.text = "-"
        return label
    }()
    
    private var descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12) // check Figma template!
        label.textAlignment = .right
        return label
    }()
    
    private var maxMinLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 9) // check Figma template!
         label.textAlignment = .right
        return label
    }()
    
    private var containerHPW: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.backgroundColor = .red
        return stack
    }()
    
    private var windLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 12) // check Figma template!
         label.textAlignment = .right
        label.text = "wind"
        return label
    }()
    
    private var pressureLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 12) // check Figma template!
         label.textAlignment = .right
        label.text = "pressure"
        return label
    }()
    
    private var humidityLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 12) // check Figma template!
         label.textAlignment = .right
        label.text = "humidity"
        return label
    }()
    
    private var hourlyCollectionView = HourlyCollectionView()
    private var dailyTableView = DailyTableView()
    
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loadingLabel)
        addSubview(mainView)
        mainView.addSubview(cityLabel)
        mainView.addSubview(locationInputButton)
        mainView.addSubview(tempLabel)
        mainView.addSubview(descriptionLabel)
        mainView.addSubview(maxMinLabel)
        //mainView.addSubview(containerHPW)
            mainView.addSubview(windLabel)
            mainView.addSubview(pressureLabel)
            mainView.addSubview(humidityLabel)
        mainView.addSubview(hourlyCollectionView)
        mainView.addSubview(dailyTableView)
        makeConstraints()
    }
    
    //MARK: - constraints
    private func makeConstraints(){
        
        // loadingLabel constraints
        loadingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 180).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        // mainView constraints
        mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        mainView.contentHuggingPriority(for: .vertical)
        
        
        // cityLabel constraints
        cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        
        // locationInputButton constraints
        locationInputButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        locationInputButton.leftAnchor.constraint(equalTo: cityLabel.leftAnchor, constant: 11).isActive = true
//        locationInputButton.frame = CGRect(x: self.cityLabel.frame.maxX,
//                                           y: 111,
//                                           width: 33,
//                                           height: 33)
        
        // tempLabel constraints
        tempLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 1).isActive = true
        tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        // descriptionLabel constraints
        descriptionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: 11).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        // maxMinLabel constraints
        maxMinLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 1).isActive = true
        maxMinLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        maxMinLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        
        
        // containerHPW internal constraints
        windLabel.topAnchor.constraint(equalTo:     maxMinLabel.bottomAnchor, constant: 11).isActive = true
        pressureLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 11).isActive = true
        humidityLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: 11).isActive = true
        
        windLabel.leadingAnchor.constraint(equalTo:     safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        pressureLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        humidityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        
//        windSpeedLabel.rightAnchor.constraint(equalTo: maxMinLabel.rightAnchor, constant: 1).isActive = true
//        pressureLabel.rightAnchor.constraint(equalTo: windLabel.rightAnchor, constant: 1).isActive = true
//        windSpeedLabel.rightAnchor.constraint(equalTo: pressureLabel.rightAnchor, constant: 1).isActive = true
        
        // containerHPW constraints
//        containerHPW.topAnchor.constraint(equalTo: maxMinLabel.bottomAnchor, constant: 1).isActive = true
//        containerHPW.leadingAnchor.constraint(equalTo: maxMinLabel.leadingAnchor, constant: 1).isActive = true
//        containerHPW.heightAnchor.constraint(equalToConstant: 38).isActive = true
    }
    
    //MARK: - configure
    func configure (viewModel: CurrentWeatherViewModel){
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return } // must bu unwrapped!
            self.loadingLabel.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.allowUserInteraction], animations:
                            { () -> Void in
                                self.mainView.alpha = 1
                            })
            self.configureBackgroundColor(icon: viewModel.icon)
            self.backgroundColor = self.mainView.backgroundColor
            //self.configureWeatherConditionVideo(icon: viewModel.icon)
            self.cityLabel.text = viewModel.locality
            self.tempLabel.text = viewModel.temp
            self.descriptionLabel.text = viewModel.weatherDescription + ", feels like " + viewModel.feelsLike
            self.maxMinLabel.text = viewModel.maxMinTemp
            
            self.hourlyCollectionView.frame = CGRect(x: self.humidityLabel.frame.maxX + 9, //
                                                     y: self.descriptionLabel.frame.maxY + 9, // + 11?
                                                     width: self.frame.width,
                                                     height: 111)
//            self.hourlyCollectionView.anchr(top: windLabel.topAnchor,
//                                            left: windLabel.rightAnchor) // damn anchorszzz
            
            
            self.hourlyCollectionView.set(cells: viewModel.hourlyWeather)
            
            
            self.dailyTableView.anchr(top: self.hourlyCollectionView.bottomAnchor,
                                      left: self.safeAreaLayoutGuide.leftAnchor,
                                      bottom: self.mainView.bottomAnchor,
                                      right: self.safeAreaLayoutGuide.rightAnchor,
                                      paddingLeft: 1,
                                      paddingBottom: 1,
                                      paddingRight: 11
                                )
//            self.dailyTableView.frame = CGRect(x: 1,
//                                               y: 1,
//                                               width: self.frame.width - 44,
//                                               height: DailyTableView.cellHeight * 7)
            self.dailyTableView.set(cells: viewModel.dailyWeather)
            
    }
    }
    
    private func configureBackgroundColor(icon: String){
            mainView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
