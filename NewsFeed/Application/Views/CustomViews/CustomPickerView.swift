//
//  CustomPickerView.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import UIKit

protocol CustomPickerViewDelegate : AnyObject {
    
    func selectedRecord(country : Country)
}

class CustomPickerView: UIView {

    var pickerView: UIPickerView!
    
    var datasource : [Country]
    
    weak var delegate : CustomPickerViewDelegate?
    
    required init(datasource: [Country]) {
        
        self.datasource = datasource
        
        super.init(frame: .zero)
        
        pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.white
        pickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 160)
        self.addSubview(pickerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func showPicker() {
        pickerView.isHidden = true
    }
    
    func hidePicker() {
        pickerView.isHidden = true
    }
}

extension CustomPickerView : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datasource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datasource[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hidePicker()
        
        // Call the delegate
        let selectedCountry = datasource[pickerView.selectedRow(inComponent: 0)]
        delegate?.selectedRecord(country: selectedCountry)
    }
}

struct Country {
    
    let name : String
    let abbrivation : String
    
    init(name : String, abbrivation : String) {
        self.name = name
        self.abbrivation = abbrivation
    }
}
