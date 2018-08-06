//
//  ViewController.swift
//  AutoHeightTVAnCell
//
//  Created by kashee on 06/08/18.
//  Copyright © 2018 kashee. All rights reserved.
//

import UIKit

// just change the class name only and UIviewController instead of BaseViewController
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, commentCellDelegate,ServerAPIDelegate,UIScrollViewDelegate {
    
    let topView:UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    let scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        return scroll
    }()
    
    let conatinerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    let postedtDateLavel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:12 PM, 21st Jan 2018"
        label.textAlignment = .left
        label.font = UIFont.sfDisplayBold(ofSize: 20)
        label.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
        return label
    }()
    
    let postedDateTextLavel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Posted Date"
        label.textAlignment = .left
        label.font = UIFont.sfDisplayRegular(ofSize: 14)
        label.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.75)
        return label
    }()
    
    let backButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "close_avatar"), for: .normal)
        
        button.addTarget(self, action: #selector(ViewLeaveViewController.closeThisView), for: .touchUpInside)
        return button
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tony Stark"
        label.textAlignment = .right
        label.font = UIFont.sfDisplayMedium(ofSize: 16)
        label.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.80)
        return label
    }()
    
    let roomLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A101"
        label.textAlignment = .right
        label.font = UIFont.sfDisplayRegular(ofSize: 14)
        label.textColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.60)
        return label
    }()
    
    let statusLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Status"
        label.textColor = .black
        label.font = UIFont.sfDisplayRegular(ofSize: 16)
        label.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
    let statusButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✓ Inprogress", for: .normal)
        button.titleLabel?.font = UIFont.sfDisplayMedium(ofSize: 12)
        button.setTitleColor(UIColor(red: 45.0/255.0, green: 199.0/255.0, blue: 109.0/255.0, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 208.0/255.0, green: 255.0/255.0, blue: 227.0/255.0, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let leaveTypeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Leave Type"
        label.font = UIFont.sfDisplayRegular(ofSize: 16)
        label.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
    let leaveTypeTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Hospitalization Leave"
        textField.isUserInteractionEnabled = false
        textField.font = UIFont.sfDisplayMedium(ofSize: 16)
        textField.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 1)
        return textField
    }()
    
    let leaveLogoImageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icons8Hospital48"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let notesLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Notes:"
        label.font = UIFont.sfDisplayRegular(ofSize: 16)
        label.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
    let notesTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "“My eye will be operated and will be admitted in the hospital for 4 days. My eye will be operated and will be admitted in the hospital for 4 days.”"
        textView.isScrollEnabled = false
        //        textView.isUserInteractionEnabled = false
        textView.font = UIFont.sfDisplayItalic(ofSize: 16)
        textView.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 1)
        return textView
    }()
    
    let attachmentsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Attachments"
        label.font = UIFont.sfDisplayRegular(ofSize: 16)
        label.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
    let scrollViewImages:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    
    lazy var pageControl:UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = Colors.pageControlpostRGB
        pc.pageIndicatorTintColor = UIColor(red: 197.0/255, green: 202.0/255, blue: 204.0/255, alpha: 1)
        return pc
    }()
    
    let remarksLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remarks by Warden:"
        label.font = UIFont.sfDisplayRegular(ofSize: 16)
        label.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
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
    
    lazy var tableView:UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tv.delegate = self
        tv.dataSource = self
        tv.estimatedRowHeight = 20
        tv.rowHeight = UITableViewAutomaticDimension
        tv.isScrollEnabled = false
        tv.register(RemarksTableViewCell.self, forCellReuseIdentifier: "CellId")
        tv.translatesAutoresizingMaskIntoConstraints = false
        //        tv.backgroundColor = .orange
        return tv
    }()
    
    
    let approveButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update Complaints Status", for: .normal)
        button.setTitleColor(Colors.whiteTextRGB, for: .normal)
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.sfDisplaySemibold(ofSize: 16)
        button.tag = 1
        button.addTarget(self, action: #selector(ViewComplaintsViewController.updateComplaintStatus), for: .touchUpInside)
        return button
        
    }()
    
    var attachmentArray:[String] = []
    var frame = CGRect(x:0,y:0,width:0,height:0)
    
    var complaintId = "1"
    var status = ""
    var studentRoomNo:String?
    var studentName:String?
    var complaintEntity = ComplaintsDetailEntity()
    var complaintEntityWarden = ComplaintsDetailEntityWarden()
    var commentsArray  = [NSDictionary]()
    var heightArray = [CGFloat]()
    //    var isAction = "false"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //      Crashlytics.sharedInstance().crash()
        view.backgroundColor = UIColor.orange
        view.isOpaque = false
        viws.isHidden = true
        
        //        if getUserType() == "student"{
        //            viewLeaveDetailsStudent()
        //        }else{
        //            viewLeaveDetailsWarden()
        //        }
        
        getComplaintDetails()
        selectComplainButton()
        callAllPageNotificationAPI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewComplaintsViewController.functionName(_:)), name:NSNotification.Name(rawValue: "NotificationID"), object: nil)
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        pageControl.numberOfPages = attachmentArray.count
        
        if attachmentArray.count > 0{
            for index in 0..<attachmentArray.count{
                frame.origin.x = scrollViewImages.frame.size.width * CGFloat(index)
                frame.size = scrollViewImages.frame.size
                let imageView = UIImageView(frame: frame)
                imageView.tag = index
                //                imageView.contentMode = .scaleAspectFit
                imageView.sd_setImage(with: URL(string: attachmentArray[index]), placeholderImage:getUserImageLocal())
                scrollViewImages.addSubview(imageView)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(ViewComplaintsViewController.showFullImage(gesuture:)))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tap)
                
            }
            scrollViewImages.contentSize = CGSize(width:(scrollViewImages.frame.size.width * CGFloat(attachmentArray.count)), height:scrollViewImages.frame.size.height)
            
            scrollViewImages.delegate = self
            scrollViewImages.isPagingEnabled = true
            scrollViewImages.showsHorizontalScrollIndicator = false
        }
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        approveButton.setDiagonalBackGroundGradient(colorOne: UIColor.init(red: 0.0 / 255.0, green: 180.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0), colorTwo: UIColor.init(red: 2.0 / 255.0, green: 220.0 / 255.0, blue: 193.0 / 255.0, alpha: 1.0))
        
        topView.setBackGroundGradient(colorOne:UIColor(red: 237.0/255.0, green: 98.0/255.0, blue: 154.0/255.0, alpha: 0.75),colorTwo:UIColor(red: 200.0/255.0, green: 80.0/255.0, blue: 192/255.0, alpha: 0.75))
        
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.contentSize.height)
        tableView.reloadData()
        
        scrollView.contentSize = CGSize(width: self.mainView.frame.size.width, height: tableView.frame.maxY+10)
        self.scrollView.layoutIfNeeded()
        
    }
    
    
    
    // identifing wether the user has taken any action or directoly closing the screen
    func functionName(_ notification: NSNotification){
        var actionValue = ""
        if let identify = notification.userInfo?["isAction"] as? String {
            if identify == "true"{
                actionValue = "true"
            }else{
                actionValue = "false"
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ComplaintID"), object: nil, userInfo: ["isAction":actionValue])
            navigationController?.popViewController(animated: true)
        }
    }
    
    //    func functionName() {
    //        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LeaveID"), object: nil, userInfo: ["isAction":isAction])
    //        navigationController?.popViewController(animated: true)
    //    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    func callAllPageNotificationAPI() {
        
        let params = ["user_id" : getUserId()]
        RequestGenerator.sharedInstance.requestData(apiName: allPageNotificationAPI, params: params as [String : AnyObject],delegate : self)
        
    }
    
    func API_CALLBACK_AllPageNotification(resultDict: NSDictionary) {
        
        //        SwiftLoader.hide()
    }
    func getComplaintDetails() {
        
        let urlString = baseURL + VERSION + "/complaints/students_id/" + getUserId() + "/view/" + complaintId
        SwiftLoader.show(animated: true)
        ServerInterface.sharedInstance.API_GetRequest(urlString: urlString, apiName: viewComplaintsAPI, delegate: self, needErrorAlert: false)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = scrollViewImages.contentOffset.x / scrollViewImages.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    
    func updateComplaintStatus(){
        
        if status == "3"{
            self.view.makeToast(message: "This Complaints is already closed.",duration: 3.0,position: HRToastPositionCenter as AnyObject)
        }else{
            
            let vc = UpdateComplaintsViewController()
            vc.complaintId = complaintId
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            vc.currentStatus = status
            present(vc, animated: true, completion: nil)
        }
        
        
    }
    
    
    func closeThisView() {
        //        self.navigationController?.popViewController(animated: true)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ComplaintID"), object: nil,userInfo: ["isAction":"false"])
        self.navigationController?.popViewController(animated: true)
    }
    
    func showFullImage(gesuture:UIGestureRecognizer){
        
        if let view = gesuture.view {
            let imgView = view as? UIImageView
            let showFullImageVC = ShowFullImageVC()
            showFullImageVC.images = attachmentArray
            showFullImageVC.index = (imgView?.tag)!
            showFullImageVC.modalPresentationStyle = .overCurrentContext
            showFullImageVC.modalTransitionStyle = .crossDissolve
            present(showFullImageVC, animated: true, completion: nil)
            
        }
    }
    
    
    //MARK:- Tableview delegates
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerLabel = UILabel()
        var spaceeText = "     "
        if SCREEN_TYPE == IPHONE_6_Plus || SCREEN_TYPE == IPHONE_6 {
            spaceeText = "      "
        }
        headerLabel.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH , height: 30)
        headerLabel.text =  "Remarks by Warden:"
        headerLabel.font = UIFont.sfDisplayRegular(ofSize: 16)
        headerLabel.textColor = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        if commentsArray.count == 0{
            headerLabel.isHidden = true
        }else{
            headerLabel.isHidden = false
        }
        return headerLabel
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId") as! RemarksTableViewCell
        cell.selectionStyle = .none
        cell.setLeaveValues(dict: commentsArray[indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
    func didCloseButtonTapped(btn: UIButton) {
        
        
    }
    
    func showPopUp(){
        let vc = CustomDialogViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    //MARK:- Server API Deelgate
    func API_CALLBACK_Error(errorNumber: Int, errorMessage: String,apiName : String) {
        SwiftLoader.hide()
        //        showValidationAlert(message: errorMessage,presentVc : self){
        //        }
        var imageType = "noInternet"
        if errorNumber==0 {
            imageType = "error"
        }
        showAlertWithImage(message:errorMessage,image:imageType,presentVc: self) {
            
        }
        
    }
    
    func API_CALLBACK_ViewComplaints(resultDict: NSDictionary) {
        SwiftLoader.hide()
        if resultDict.value(forKey: "status") as! String == "success" {
            if getUserType() != "warden"{
                let postArray = checkKeyNotAvailForArray(dict: resultDict, key: "complaints")  as! NSArray
                if postArray.count == 0 {
                    let message = checkKeyNotAvail(dict: resultDict, key: "msg") as! String
                    if message != "" {
                        showValidationAlert(message: message , completion : {
                            
                        })
                    }
                }
                else {
                    if postArray.count > 0  {
                        let postDict = postArray[0] as! NSDictionary
                        complaintEntity.initDict(dict: postDict)
                        commentsArray.removeAll()
                        commentsArray = checkKeyNotAvailForArray(dict: postDict, key: "comments") as! [NSDictionary]
                    }
                    
                    attachmentArray = complaintEntity.imagesLst
                    viewLeaveDetailsStudent()
                    setViewStudentValues()
                    tableView.reloadData()
                    
                }
                
            }else{
                let postArray = checkKeyNotAvailForArray(dict: resultDict, key: "complaints")  as! NSArray
                if postArray.count == 0 {
                    let message = checkKeyNotAvail(dict: resultDict, key: "msg") as! String
                    if message != "" {
                        showValidationAlert(message: message , completion : {
                            
                        })
                    }
                }
                else {
                    if postArray.count > 0  {
                        let postDict = postArray[0] as! NSDictionary
                        complaintEntityWarden.initDict(dict: postDict)
                        
                        commentsArray.removeAll()
                        commentsArray = checkKeyNotAvailForArray(dict: postDict, key: "comments") as! [NSDictionary]
                    }
                    attachmentArray = complaintEntityWarden.imagesLst
                    viewLeaveDetailsWarden()
                    setViewWardenValues()
                    tableView.reloadData()
                    
                }
            }
        }else{
            let message = checkKeyNotAvail(dict: resultDict, key: "message") as! String
            if message != "" {
                showAlertWithImage(message: message , image:"error",completion : {
                    
                })
            }
        }
    }
    
}
