import UIKit

class TappedVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    let network = NetworkManager()
    
    let spinner = UIActivityIndicatorView(style: .large)
    var fruit : [Fruits] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        setupSpinner()
        loadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.fruitLabel.text = fruit[indexPath.row].name
        
        cell.actionButton.tag = indexPath.row
        cell.actionButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsVC()
        
        vc.selectedItem = fruit[indexPath.row].name
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @objc func buttonTapped(_ sender: UIButton){
        let index = sender.tag
        print("Button tapped for:", fruit[index])
    }
    
    func setupTable(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
    }
    
    
    func setupSpinner(){
        self.spinner.center = self.view.center
        self.view.addSubview(self.spinner)
        self.spinner.startAnimating()
    }
    
    func loadData(){
        network.fetchFruits{ result in
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.tableView.reloadData()
                
                switch result{
                case .success(let fruits):
                    self.fruit = fruits
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error ",error)
                }
            }
        }
    }
}
