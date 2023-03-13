//
//  CustomCellTableViewCell.swift
//  nodeSwift
//
//  Created by Булат Габдуллин on 06.03.2023.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func configureCell(with model: Node) {
        title.text = model.specification
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
