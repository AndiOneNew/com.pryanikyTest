//
//  SecondViewController.swift
//  pryanikyTest
//
//  Created by Илья Новиков on 27.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var someText: UILabel!
    @IBOutlet weak var urlImage: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerLabel: UILabel!
    
    var secondData: secondDataVC!
    var pickerSelected = 0
    var arrayPicker = ["1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setParametrs()
    }
    func setCurrentData(_ currentData: secondData) {
        let nameCell = currentData.name
        let someText = currentData.data.text
        let urlImage = currentData.data.url
        let variants = currentData.data.variants
        secondData = secondDataVC(name: nameCell, text: someText, url: urlImage, variantes: variants)
    }
    func setParametrs() {
        nameCell.text = secondData.name
        someText.text = secondData.text ?? "without text"
        urlImage.loadImageFromURL(from: (secondData.url ?? "https://1.bp.blogspot.com/--b7JV7PgDPo/Xj6jliViqZI/AAAAAAAAC60/NO3XtMYWHR00NPBc-a_wxlkszqLEB07QACLcBGAsYHQ/s1600/record.jpg"))
        pickerSelected = secondData.variantes?.startIndex ?? 1
        
    }
}

extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Picker view data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPicker.count
    }
    // MARK: - Picker view delegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            pickerSelected = 1
        default:
            break
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPicker[row]
    }
    
    func setup() {
        if pickerSelected == 0 {
            pickerView.isHidden = true
            pickerLabel.isHidden = true
        }
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
}
