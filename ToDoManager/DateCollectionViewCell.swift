//
//  DateCollectionViewCell.swift
//  DateTimePicker
//
//  Created by Huong Do on 9/26/16.
//  Copyright © 2016 ichigo. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    var dayLabel: UILabel! // rgb(128,138,147)
    var numberLabel: UILabel!
    var monthLabel: UILabel!
    var darkColor = UIColor(red: 0, green: 22.0/255.0, blue: 39.0/255.0, alpha: 1)
    var highlightColor = UIColor(red: 0/255.0, green: 199.0/255.0, blue: 194.0/255.0, alpha: 1)
    
    override init(frame: CGRect) {
        
        dayLabel = UILabel(frame: CGRect(x: 5, y: 10, width: frame.width - 10, height: 10))
        dayLabel.font = UIFont.systemFont(ofSize: 10)
        dayLabel.textAlignment = .center
    
        numberLabel = UILabel(frame: CGRect(x: 5, y: 25, width: frame.width - 10, height: 30))
        numberLabel.font = UIFont.systemFont(ofSize: 25)
        numberLabel.textAlignment = .center
        
        monthLabel = UILabel(frame: CGRect(x: 5, y: 40, width: frame.width - 10, height: 50))
        monthLabel.font = UIFont.systemFont(ofSize: 15)
        monthLabel.textAlignment = .center
        
        super.init(frame: frame)
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(monthLabel)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 3
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            dayLabel.textColor = isSelected == true ? .white : darkColor.withAlphaComponent(0.5)
            numberLabel.textColor = isSelected == true ? .white : darkColor
            monthLabel.textColor = isSelected == true ? .white : darkColor.withAlphaComponent(0.5)
            contentView.backgroundColor = isSelected == true ? highlightColor : .white
            contentView.layer.borderWidth = isSelected == true ? 0 : 1
        }
    }
    
    func populateItem(date: Date, highlightColor: UIColor, darkColor: UIColor) {
        self.highlightColor = highlightColor
        self.darkColor = darkColor
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dayLabel.text = dateFormatter.string(from: date).uppercased()
        dayLabel.textColor = isSelected == true ? .white : darkColor.withAlphaComponent(0.5)
    
        let numberFormatter = DateFormatter()
        numberFormatter.dateFormat = "d"
        numberLabel.text = numberFormatter.string(from: date)
        numberLabel.textColor = isSelected == true ? .white : darkColor
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM"
        monthLabel.text = monthFormatter.string(from: date)
        monthLabel.textColor = isSelected == true ? .white : darkColor.withAlphaComponent(0.5)
        
        contentView.layer.borderColor = darkColor.withAlphaComponent(0.2).cgColor
        contentView.backgroundColor = isSelected == true ? highlightColor : .white
    }
    
}
