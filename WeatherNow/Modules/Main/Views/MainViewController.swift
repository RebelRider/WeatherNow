
import UIKit
import CoreLocation

protocol WeatherDisplayLogic: AnyObject {
    func displayData(viewModel: WeatherEnum.Model.ViewModel.ViewModelData)
}

class MainViewController: UIViewController, WeatherDisplayLogic, WeatherViewDelegate {
    
    var interactor: DataUpdater?
    let weatherView = WeatherView()
    let locationInputView = LocationInputViewController() //
    
    // MARK: - Setup
    private func ConfigureUI() {
        let viewController        = self
        let interactor            = WeatherInteractor()
        let presenter             = WeatherPresenter()
        viewController.interactor = interactor
        interactor.presenter      = presenter
        presenter.viewController  = viewController
    }

    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.weatherViewDelegate = self
        ConfigureUI()
    
        view.addSubview(weatherView)
        weatherView.frame = self.view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        interactor?.makeRequest(request: .getWeather)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //weatherView.contentSize = CGSize(width:self.view.bounds.width, height: 888) // make it all a scrollView?
    }
    
    //MARK: - displayData
    func displayData(viewModel: WeatherEnum.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayWeather(let currentWeatherViewModel):
            weatherView.configure(viewModel: currentWeatherViewModel)
        }
    }
    
    //MARK: - show locatnInput
    
    func showLocationInput() {
        print("DEBUG: show location input")
            //self.navigationController?.pushViewController(locationInputViewController, animated: true)
        }
    
}
