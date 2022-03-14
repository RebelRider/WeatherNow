import UIKit

class LocationInputViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let myArray: NSArray = ["First", "Second", "Third"]
    
    private var addLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.setTitle("  Add Location ", for: .normal)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(showSearchForPlace), for: .touchUpInside)
        return button
    }()
    
    private var myTableView: UITableView!

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Locations"
        
        super.viewDidLoad()

        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: 44, width: displayWidth, height: displayHeight - 44))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "placeCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        view.addSubview(addLocationButton)
        addLocationButton.frame = CGRect(x: UIScreen.main.bounds.minX + 11,
                                         y: UIScreen.main.bounds.maxY - 88,
                                         width: 222,
                                         height: 44)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
    
    @objc func showSearchForPlace() {
        print("showSearchForPlace button pressed")
        
    }
}
