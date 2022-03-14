
import Foundation
import UIKit

class LocationInputTableView: UITableView, UITableViewDataSource, UITableViewDelegate{
    
   
       
    
    var cells: [CurrentWeatherViewModel.Daily]?
    
    static let cellHeight:CGFloat = 77 // check Figma template!
    
    //MARK: - init
    init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        backgroundColor = .blue
        isScrollEnabled = true
        allowsSelection = false
        register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.reuseId)
    }
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func set(cells: [CurrentWeatherViewModel.Daily]){
        self.cells = cells
        reloadData()
    }
    
    //MARK: - tableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cells = cells else { return 0}
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: DailyTableViewCell.reuseId, for: indexPath) as! DailyTableViewCell
        guard let cells = cells else { return cell}
        cell.set(data: cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DailyTableView.cellHeight
    }
    
    //
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
