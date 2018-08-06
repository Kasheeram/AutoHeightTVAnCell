//
//  RemarksTableViewCell.swift
//  AutoHeightTVAnCell
//
//  Created by kashee on 06/08/18.
//  Copyright © 2018 kashee. All rights reserved.
//

import UIKit

class RemarksTableViewCell: UITableViewCell {
    
    let remarksTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = ""
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont.sfDisplayItalic(ofSize: 16)
        textView.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 1)
        return textView
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        addAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addAutoLayout(){
        self.addSubview(remarksTextView)
        self.addSubview(dateLabel)
        //        cardView.addSubview(titleLabel)
        
        remarksTextView.topAnchor.constraint(equalTo: self.topAnchor,constant:5).isActive = true
        remarksTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:10).isActive = true
        remarksTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-10).isActive = true
        remarksTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: remarksTextView.bottomAnchor, constant: 2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: remarksTextView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: remarksTextView.trailingAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
        
        
    }
    
    func setLeaveValues(dict : NSDictionary) {
        
        remarksTextView.text = ""
        let attriString = NSAttributedString(string:"\(checkKeyNotAvail(dict: dict, key: "comment_posted_name")): ", attributes:
            [NSForegroundColorAttributeName: Colors.lightGrayRGB,
             NSFontAttributeName: UIFont.sfDisplayRegular(ofSize: 14)])
        remarksTextView.textStorage.append(attriString)
        
        let attriString2 = NSAttributedString(string:checkKeyNotAvail(dict: dict, key: "comment") as! String, attributes:
            [NSForegroundColorAttributeName: Colors.headerRGB,
             NSFontAttributeName: UIFont.sfDisplayRegular(ofSize: 14)])
        remarksTextView.textStorage.append(attriString2)
        
        let attriString3 = NSAttributedString(string:"\((checkKeyNotAvail(dict: dict, key: "comment_created_date") as! String))", attributes:
            [NSForegroundColorAttributeName: Colors.lightGrayRGB,
             NSFontAttributeName: UIFont.sfDisplayRegular(ofSize: 12)])
        dateLabel.attributedText = attriString3
        
        
        
    }
    
}
