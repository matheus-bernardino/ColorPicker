//
//  ViewController.swift
//  ColorPicker
//
//  Created by Matheus on 19/01/21.
//

import UIKit
struct ColorOption {
    var colorText: String
    var clicked: Bool
    var color: UIColor
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cells = [ColorOption(colorText: "Red", clicked: false, color: UIColor.red), ColorOption(colorText: "Blue", clicked: false, color: UIColor.blue)]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorPicker", for: indexPath) as? ColorTableViewCell else {
            return UITableViewCell()
        }
        
        cell.color.text = cells[indexPath.row].colorText
        cell.colorSelector.setOn(cells[indexPath.row].clicked, animated: true)
        cell.colorDelegate = self
        return cell
    }
    
    @IBOutlet weak var colorPickerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerTableView.dataSource = self
        colorPickerTableView.delegate = self
        let color = UserDefaults.standard.string(forKey: "color")
        for colorOption in cells
        {
            if colorOption.colorText == color {
                view.backgroundColor = colorOption.color
            }
        }
        // Do any additional setup after loading the view.
    }
}

extension ViewController: ColorPickerTableView {
    func changeColor(color: String) {
        for colorOption in cells
        {
            if colorOption.colorText == color {
                view.backgroundColor = colorOption.color
                UserDefaults.standard.set(color, forKey: "color")
            }
        }
    }
    
    
}
