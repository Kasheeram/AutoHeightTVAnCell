//
//  ViewComplaintExtension.swift
//  AutoHeightTVAnCell
//
//  Created by kashee on 06/08/18.
//  Copyright © 2018 kashee. All rights reserved.
//

import Foundation

// just change the class name only 
extension ViewController {
    
    func viewLeaveDetailsStudent(){
        
        commonCode()
        
    }
    
    func viewLeaveDetailsWarden(){
        commonCode()
        mainView.addSubview(approveButton)
        
        approveButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant:32).isActive = true
        approveButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -32).isActive = true
        approveButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        approveButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -4).isActive = true
        
    }
    
    
    func commonCode(){
        
        mainView.addSubview(topView)
        mainView.addSubview(scrollView)
        scrollView.addSubview(conatinerView)
        topView.addSubview(postedtDateLavel)
        topView.addSubview(postedDateTextLavel)
        topView.addSubview(backButton)
        topView.addSubview(nameLabel)
        topView.addSubview(roomLabel)
        conatinerView.addSubview(leaveTypeLabel)
        conatinerView.addSubview(leaveLogoImageView)
        conatinerView.addSubview(leaveTypeTextField)
        conatinerView.addSubview(statusLabel)
        conatinerView.addSubview(statusButton)
        
        conatinerView.addSubview(notesLabel)
        conatinerView.addSubview(notesTextView)
        
        conatinerView.addSubview(attachmentsLabel)
        conatinerView.addSubview(scrollViewImages)
        conatinerView.addSubview(pageControl)
        conatinerView.addSubview(tableView)
        
        topView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 145).isActive = true
        
        backButton.topAnchor.constraint(equalTo: topView.topAnchor,constant:25).isActive = true
        backButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: backButton.topAnchor,constant:8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        roomLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        roomLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        roomLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        roomLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        postedtDateLavel.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant:20).isActive = true
        postedtDateLavel.topAnchor.constraint(equalTo: roomLabel.bottomAnchor,constant:15).isActive = true
        postedtDateLavel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        postedtDateLavel.widthAnchor.constraint(equalTo: topView.widthAnchor).isActive = true
        
        postedDateTextLavel.topAnchor.constraint(equalTo: postedtDateLavel.bottomAnchor).isActive = true
        postedDateTextLavel.leadingAnchor.constraint(equalTo: postedtDateLavel.leadingAnchor).isActive = true
        postedDateTextLavel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        postedDateTextLavel.widthAnchor.constraint(equalTo: postedtDateLavel.widthAnchor).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        if getUserType() == "student"{
            scrollView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        }else{
            scrollView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant:-50).isActive = true
        }
        
        
        conatinerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        conatinerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        conatinerView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        conatinerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        conatinerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        leaveTypeLabel.topAnchor.constraint(equalTo: conatinerView.topAnchor,constant:20).isActive = true
        leaveTypeLabel.leadingAnchor.constraint(equalTo: conatinerView.leadingAnchor,constant:30).isActive = true
        leaveTypeLabel.widthAnchor.constraint(equalTo: conatinerView.widthAnchor).isActive = true
        leaveTypeLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        leaveLogoImageView.topAnchor.constraint(equalTo: leaveTypeLabel.bottomAnchor,constant:5).isActive = true
        leaveLogoImageView.leadingAnchor.constraint(equalTo: leaveTypeLabel.leadingAnchor).isActive = true
        leaveLogoImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        leaveLogoImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        leaveTypeTextField.topAnchor.constraint(equalTo: leaveTypeLabel.bottomAnchor,constant:1).isActive = true
        leaveTypeTextField.leadingAnchor.constraint(equalTo: leaveLogoImageView.trailingAnchor,constant:5).isActive = true
        leaveTypeTextField.widthAnchor.constraint(equalTo: leaveTypeLabel.widthAnchor).isActive = true
        leaveTypeTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        statusLabel.topAnchor.constraint(equalTo: leaveTypeTextField.bottomAnchor,constant:15).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: conatinerView.leadingAnchor,constant:30).isActive = true
        statusLabel.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        statusButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant:2).isActive = true
        statusButton.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor).isActive = true
        statusButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 140).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        notesLabel.topAnchor.constraint(equalTo: statusButton.bottomAnchor,constant:15).isActive = true
        notesLabel.leadingAnchor.constraint(equalTo: conatinerView.leadingAnchor,constant:30).isActive = true
        notesLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        notesLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        notesTextView.topAnchor.constraint(equalTo: notesLabel.bottomAnchor,constant:1).isActive = true
        notesTextView.leadingAnchor.constraint(equalTo: notesLabel.leadingAnchor).isActive = true
        notesTextView.widthAnchor.constraint(equalTo: mainView.widthAnchor,constant:-50).isActive = true
        notesTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        
        attachmentsLabel.topAnchor.constraint(equalTo: notesTextView.bottomAnchor,constant:20).isActive = true
        attachmentsLabel.leadingAnchor.constraint(equalTo: notesTextView.leadingAnchor).isActive = true
        attachmentsLabel.trailingAnchor.constraint(equalTo: notesTextView.trailingAnchor).isActive = true
        attachmentsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollViewImages.topAnchor.constraint(equalTo: attachmentsLabel.bottomAnchor,constant:5).isActive = true
        scrollViewImages.leadingAnchor.constraint(equalTo: notesTextView.leadingAnchor).isActive = true
        scrollViewImages.widthAnchor.constraint(equalTo: notesTextView.widthAnchor).isActive = true
        
        
        if attachmentArray.count>0{
            scrollViewImages.heightAnchor.constraint(equalToConstant: 140).isActive = true
            attachmentsLabel.isHidden = false
            pageControl.isHidden = false
        }else{
            scrollViewImages.heightAnchor.constraint(equalToConstant: 1).isActive = true
            attachmentsLabel.isHidden = true
            pageControl.isHidden = true
        }
        self.scrollViewImages.layoutIfNeeded()
        
        pageControl.topAnchor.constraint(equalTo: scrollViewImages.bottomAnchor).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: notesTextView.leadingAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalTo: notesTextView.widthAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        tableView.topAnchor.constraint(equalTo: pageControl.bottomAnchor,constant:10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: notesTextView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: notesTextView.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
        if #available(iOS 11.0, *) {
            tableView.bottomAnchor.constraint(equalTo: conatinerView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            tableView.bottomAnchor.constraint(equalTo: conatinerView.bottomAnchor).isActive = true
        }
        
    }
    
    
    func setViewStudentValues(){
        
        var complaintStatus = "New"
        if status == "0" {
            complaintStatus = "New"
        } else if status == "1"{
            complaintStatus = "In Progress"
        } else if status == "2" {
            
            complaintStatus = "Escalated"
        } else if status == "3" {
            complaintStatus = "Closed"
            
        }
        
        leaveTypeTextField.text = complaintEntity.category
        statusButton.setTitle(complaintStatus, for: .normal)
        notesTextView.text = complaintEntity.complaintDescription
        nameLabel.text = studentName
        roomLabel.text = studentRoomNo
        postedtDateLavel.text = complaintEntity.created_date.toStringWithFormat(currentFormat: "dd-MM-yyyy HH:mm", toFormat: "dd-MMM-yyyy, hh:mm a")
        
    }
    
    
    func setViewWardenValues(){
        
        var complaintStatus = "New"
        if status == "0" {
            complaintStatus = "New"
        } else if status == "1"{
            complaintStatus = "In Progress"
        } else if status == "2" {
            
            complaintStatus = "Escalated"
        } else if status == "3" {
            complaintStatus = "Closed"
            
        }
        
        leaveTypeTextField.text = complaintEntityWarden.category
        statusButton.setTitle(complaintStatus, for: .normal)
        notesTextView.text = complaintEntityWarden.complaintDescription
        nameLabel.text = studentName
        roomLabel.text = studentRoomNo
        postedtDateLavel.text = complaintEntityWarden.created_date.toStringWithFormat(currentFormat: "dd-MM-yyyy HH:mm", toFormat: "dd-MMM-yyyy, hh:mm a")
        
    }
    
    
    
}
