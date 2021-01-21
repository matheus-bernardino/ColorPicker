//
//  ColorTableViewCell.swift
//  ColorPicker
//
//  Created by Matheus on 19/01/21.
//

import UIKit

protocol ColorPickerTableView : class{
    func changeColor(color: String)
}
class ColorTableViewCell: UITableViewCell {
    var colorDelegate: ColorPickerTableView?
    
    @IBAction func changeColor(_ sender: Any) {
        print("changeColor")
        colorDelegate?.changeColor(color: color.text ?? "")
    }
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var colorSelector: UISwitch!
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
