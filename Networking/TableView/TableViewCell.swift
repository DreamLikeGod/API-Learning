//
//  TableViewCell.swift
//  Networking
//
//  Created by Егор Ершов on 22.05.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var lastUpdate: UILabel!
    
    @IBOutlet weak var confirmandDeaths: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func constracktCell (indexPath: IndexPath, info: [Country]) {
        countryName.text = info[indexPath.row].name
        lastUpdate.text = info[indexPath.row].lastUpdate
        confirmandDeaths.text = info[indexPath.row].outConDeat
    }
    
}
