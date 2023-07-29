//
//  CountryTable.swift
//  Networking
//
//  Created by Егор Ершов on 22.05.2022.
//

import UIKit

class CountryTable: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var countries: [Country] = []
    let Api: APIClient = ApiNetworking()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activeNetworking: UIActivityIndicatorView!
    @IBOutlet weak var errorInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        activeNetworking.startAnimating()
        self.errorInfo.isHidden = true
        Api.getInfo { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let info) :
                    self.countries = info
                    self.activeNetworking.stopAnimating()
                    self.activeNetworking.isHidden = true
                    self.errorInfo.isHidden = true
                    self.tableView.reloadData()
                case .failure (let error) :
                    self.countries = []
                    self.activeNetworking.stopAnimating()
                    self.activeNetworking.isHidden = true
                    self.errorInfo.isHidden = false
                    self.tableView.reloadData()
                    print(error)
                }
            }
        }
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.constracktCell(indexPath: indexPath, info: countries)
        return cell
    }
    
    
    
}
