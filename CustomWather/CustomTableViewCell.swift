//
//  CustomTableViewCell.swift
//  CustomWather
//
//  Created by MohammadHossein Ghadamyari on 2025-03-07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var tempLabel : UILabel!
    @IBOutlet var humiditiLabel : UILabel!
  //  @IBOutlet var tabelView : tab
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
