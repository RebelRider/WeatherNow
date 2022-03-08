import Foundation
import UIKit
import AVFoundation

class WeatherView: UIView { // UIScrollView?
    
    //MARK: - variables
//    var player : AVPlayer!
//    var playerLayer : AVPlayerLayer?
//    var playerLooper: AVPlayerLooper?
//    var playerItem: AVPlayerItem?
    
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
         label.font = UIFont.systemFont(ofSize: 12) // check Figma template!
         label.textAlignment = .right
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
        mainView.addSubview(tempLabel)
        mainView.addSubview(descriptionLabel)
        mainView.addSubview(maxMinLabel)
        mainView.addSubview(hourlyCollectionView)
        mainView.addSubview(dailyTableView)
        makeConstraints()
    }
    
    //MARK: - constraints
    private func makeConstraints(){
        
        // loadingLabel constraints
        loadingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 160).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        
        // mainView constraints
        mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        mainView.contentHuggingPriority(for: .vertical)
        
        
        // cityLabel constraints
        cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        //cityLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 1).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        
        // tempLabel constraints
        tempLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor, constant: 1).isActive = true
        tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        // descriptionLabel constraints
        descriptionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: 1).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        // maxMinLabel constraints
        maxMinLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 1).isActive = true
        maxMinLabel.leadingAnchor.constraint(equalTo: maxMinLabel.leadingAnchor, constant: 1).isActive = true
        maxMinLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    //MARK: - configure
    func configure (viewModel: CurrentWeatherViewModel){
        DispatchQueue.main.async {
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
            self.descriptionLabel.text = viewModel.weatherDescription
            self.maxMinLabel.text = viewModel.maxMinTemp
            
            self.hourlyCollectionView.frame = CGRect(x: 0,
                                                     y: self.maxMinLabel.frame.maxY + 10,
                                                     width: self.frame.width,
                                                     height: 111)
            self.hourlyCollectionView.set(cells: viewModel.hourlyWeather)
            
            self.dailyTableView.frame = CGRect(x: 10,
                                               y: self.hourlyCollectionView.frame.maxY,
                                               width: self.frame.width - 20,
                                               height: DailyTableView.cellHeight * 7)
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
