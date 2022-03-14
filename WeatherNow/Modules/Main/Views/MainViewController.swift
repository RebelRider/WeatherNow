
import UIKit
import CoreLocation

protocol WeatherDisplayLogic: AnyObject {
    func displayData(viewModel: WeatherEnum.Model.ViewModel.ViewModelData)
}

class MainViewController: UIViewController, WeatherDisplayLogic, WeatherViewDelegate {
        
    var interactor: DataUpdater?
    var presenter: WeatherPresenter?
    let weatherView = WeatherView()
    
    // MARK: - Setup
    private func Configure() {
        let viewController        = self
        let interactor            = WeatherInteractor()
        let presenter             = WeatherPresenter()
        let router                = WeatherRouter()
        router.viewController     = viewController
        viewController.interactor = interactor
        viewController.presenter  = presenter
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        presenter.router          = router
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.weatherViewDelegate = self
        Configure()
        view.addSubview(weatherView)
        weatherView.frame = self.view.frame
        
        interactor?.makeRequest(request: .getWeather)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        presenter?.onShowLocationInput()
    }
    
}
