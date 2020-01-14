//
//  HomeViewController.swift
//  smile4Life
//
//  Created by Lisa Swanson on 10/4/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, SetupUI, PersistanceViewModelMain, PresentViewControllerFromMain, UpdateSegmentControlDelegate, HandleTapGesture {
  
  var viewModelMainView: ViewModelMainView!
  var currentCalendarUser: CalendarUsers?
  var currentColorMode: ColorMode?
  var imageViewSizes = ImageViewSizes()
  var lastSender = UISegmentedControl()
  var segment = UpdateSegment()
  static let segmentCornerRadius: CGFloat = 6
  var updateCurrentCalendarUser: CalendarUsers? {
    didSet {
      userNameLabel.text = updateCurrentCalendarUser?.name
      userImageView.image = UIImage(data: (updateCurrentCalendarUser?.image)!)
      self.currentCalendarUser = self.updateCurrentCalendarUser
      setupUIStatic()
    }
  }
  
  func presentViewController(index: Int) {
        print("in presentViewController")
        switch index {
        case 1:
          let customEventVC = TestNotificationsViewController()
          customEventVC.handleTapGestureDelegate = self
          customEventVC.viewModelMainView = viewModelMainView
          customEventVC.transitioningDelegate = self
    //            presentCreateUserViewController(viewController: customEventVC)

          present(customEventVC, animated: true, completion: nil)
    //      let viewController = NotificationsViewController()
    ////      viewController.viewModelMainView = viewModelMainView
    //      presentCreateUserViewController(viewController: viewController)
          break
        case 4:
          let viewController = CreateNewCalendarUser()
          viewController.segmentDelegate = self
          viewController.viewModelMainView = viewModelMainView
          presentCreateUserViewController(viewController: viewController)
        default:
          break
        }
  }
  
  private func presentCreateUserViewController(viewController: UIViewController) {
    let navCon = UINavigationController(rootViewController: viewController)
    self.present(navCon, animated: true, completion: nil)
  }
  
  func set(stack: ViewModelMainView) {
    self.viewModelMainView = stack
    self.viewModelMainView.coreDataContext = CoreDataManager()
  }
  
  func notifiyMainControlerOfSegmentChange(indexOfSegment: Int) {
    print("In MainView protocol \(indexOfSegment)")
    let segmentIndex = UISegmentedControl()
    segmentIndex.removeAllSegments()
    segmentIndex.insertSegment(withTitle: "Calendar View", at: 0, animated: true)
    segmentIndex.insertSegment(withTitle: "User Calendars", at: 1, animated: true)
    segmentIndex.selectedSegmentIndex = indexOfSegment
    handleSegmentedControlDidChange(segmentIndex)
  }
  
  func addCustomHygieneEvent(eventType: Int, date: Date, tag: Int) {
    print("I am in protocol stub addCustomHygieneEvent  \((eventType, date, tag))")
    
    switch tag {
    case 0:
      addHygieneEvent(user: viewModelMainView.currentUser, date: date, eventType: eventType)
    case 1:
      print("I have made it to the correct case in protocol")
    default:
      print("Should not be defaulting")
    }
  }
  
  private let logo: UIImageView = {
    let iv = UIImageView.baseImageView(image: UIImage(named: "whiteSmileLogo")!)
    return iv
  }()
  
  lazy var userImageView: UIImageView = {
    var userImageView = UIImageView.circularUserImageView(image: UIImage(named: "darkAddImage")!, radius: 75)
    userImageView.isUserInteractionEnabled = true
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.handelAddUserImage(_:)))
    userImageView.addGestureRecognizer(tapGesture)
    return userImageView
  }()
  
  private let userNameLabel: UILabel = {
    let name = UILabel.baseUILabel()
    name.font = UIFont.boldSystemFont(ofSize: 50)
    name.adjustsFontSizeToFitWidth = true
    name.numberOfLines = 1
    name.minimumScaleFactor = 0.1
    name.baselineAdjustment = .alignCenters
    return name
  }()
  
  let addBrushEvent: UIButton = {
    let button = UIButton.baseUIButton()
    button.addTarget(self, action: #selector(handelAddHygieneEvent), for: .touchUpInside)
    button.tag = 1
    button.setImage(#imageLiteral(resourceName: "brushIcon"), for: .normal)
    return button
  }()
  
  let addFlossEvent: UIButton = {
    let button = UIButton.baseUIButton()
    button.addTarget(self, action: #selector(handelAddHygieneEvent), for: .touchUpInside)
    button.tag = 2
    button.setImage(#imageLiteral(resourceName: "flossIcon"), for: .normal)
    return button
  }()
  
  let addBrushAndFlossEvent: UIButton = {
    let button = UIButton.baseUIButton()
    button.addTarget(self, action: #selector(handelAddHygieneEvent), for: .touchUpInside)
    button.tag = 3
    button.setImage(#imageLiteral(resourceName: "brushFlossIcon"), for: .normal)
    return button
  }()
  
  let addCustomEvent: UIButton = {
    let button = UIButton.baseUIButton()
    button.addTarget(self, action: #selector(handelAddHygieneEvent), for: .touchUpInside)
    button.tag = 4
    button.setImage(#imageLiteral(resourceName: "calendarIcon"), for: .normal)
    return button
  }()
  
  lazy var eventsStackView: UIStackView = {
    let sV = UIStackView.baseStackViewHFE(arrayOfViews: [addBrushEvent, addFlossEvent, addBrushAndFlossEvent, addCustomEvent], spacing: 3)
    return sV
  }()
  
  lazy var containerViewSegmentedControl: UISegmentedControl = {
    var sc = UISegmentedControl.containerViewSegmentControl
    sc.addTarget(self, action: #selector(handleSegmentedControlDidChange(_:)), for: .valueChanged)
    return sc
  }()
  
 lazy var containerViewsArray = [hygieneEventsCollectionViewController, settingsViewController, settingsViewController, settingsViewController, settingsViewController]
  
  private let containerView: UIView = {
    let cV = UIView.containerView()
    return cV
  }()
  
  private lazy var settingsViewController: SettingsViewController = {
    let settingsViewController = SettingsViewController()
    self.add(asChildViewController: settingsViewController)
    return settingsViewController
  }()
  
  private lazy var hygieneEventsCollectionViewController: HygieneEventsCollectionViewController = {
    let collectionVC = HygieneEventsCollectionViewController()
    self.add(asChildViewController: collectionVC)
    return collectionVC
  }()
  
  override func loadView() {
    super.loadView()
    if UserDefaults.standard.bool(forKey: kInitialUser) {
      self.currentCalendarUser = viewModelMainView.getCurrentUser()
    }
    setupUIStatic()
    setupUIDynamic()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    applyCurrentColorMode()
    updateContainerView()
   
    if currentCalendarUser?.image != nil {
        userImageView.image = UIImage(data: currentCalendarUser!.image!)
    }
    userNameLabel.text = currentCalendarUser?.name
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    containerViewSegmentedControl.selectedSegmentIndex = 0
//    definesPresentationContext = true
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if !UserDefaults.standard.bool(forKey: kInitialUser) {
      getInitialCalendarUserName()
    }
  }
  
  private func applyCurrentColorMode() {
    guard let userColorMode = UserDefaults.standard.object(forKey: UserInfoStatusKey.colorMode.rawValue) else { return }
    currentColorMode = ColorMode.init(rawValue: userColorMode as! String)
    view.backgroundColor = .background(colorMode: currentColorMode!)
    userImageView.backgroundColor = .foreground(colorMode: currentColorMode!)
    userNameLabel.textColor = .highlight(colorMode: currentColorMode!)
    userNameLabel.backgroundColor = .background(colorMode: currentColorMode!)
    containerViewSegmentedControl.backgroundColor = .foreground(colorMode: currentColorMode!)
    containerViewSegmentedControl.selectedSegmentTintColor = .highlight(colorMode: currentColorMode!)
    containerView.backgroundColor = .highlight(colorMode: currentColorMode!)
  }
  
  func setupUIStatic() {

    view.addSubview(logo)
    view.addSubview(userImageView)
    view.addSubview(userNameLabel)
    view.addSubview(containerView)
    view.addSubview(eventsStackView)
    view.addSubview(containerViewSegmentedControl)

    calculateViewSizes()
    userImageView.contentMode = .scaleAspectFit
    let margins = view.layoutMarginsGuide
    userImageView.layer.cornerRadius = imageViewSizes.imageWidthAndHeight / 2
    
    // TO BE REMOVED
    guard let tabBarHeight = tabBarController?.tabBar.frame.height else { return }
    print(imageViewSizes.logoHeight, imageViewSizes.imageWidthAndHeight, imageViewSizes.segmentViewHeight)
    print(UIScreen.main.bounds.height, tabBarHeight)
    // END TO BE REMOVED
    
    NSLayoutConstraint.activate([
    
      logo.topAnchor.constraint(equalTo: margins.topAnchor),
      logo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat.pad8),
      logo.heightAnchor.constraint(equalToConstant: imageViewSizes.logoHeight),
      logo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat.pad8),
      
      userImageView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: -CGFloat.pad4),
      userImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat.pad8),
      userImageView.widthAnchor.constraint(equalToConstant: imageViewSizes.imageWidthAndHeight),
      userImageView.heightAnchor.constraint(equalToConstant: imageViewSizes.imageWidthAndHeight),
      
      userNameLabel.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: CGFloat.pad7),
      userNameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: CGFloat.pad4),
      userNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat.pad8),
      userNameLabel.heightAnchor.constraint(equalToConstant: imageViewSizes.imageWidthAndHeight * imageViewSizes.userNameHeightAnchor),
      
      eventsStackView.heightAnchor.constraint(equalToConstant: imageViewSizes.imageWidthAndHeight * imageViewSizes.eventsStackviewHeightAnchor),
      eventsStackView.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: CGFloat.pad4),
      eventsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat.pad8),
      eventsStackView.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: CGFloat.pad4),

      containerViewSegmentedControl.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: CGFloat.pad10),
      containerViewSegmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat.pad8),
      containerViewSegmentedControl.heightAnchor.constraint(equalToConstant: imageViewSizes.segmentViewHeight),
      containerViewSegmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat.pad8),
      
      containerView.heightAnchor.constraint(equalToConstant: imageViewSizes.containerHeight),
      containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat.pad8),
      containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat.pad8),
      containerView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -CGFloat.pad6)
      
    ])
  }
  
  private func calculateViewSizes() {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let ratio = screenHeight / 2 < screenWidth ? CGFloat.pad52 : CGFloat.pad48
    imageViewSizes.containerHeight = screenHeight * ratio
    imageViewSizes.remainingScreenHeight = screenHeight - imageViewSizes.containerHeight
    
    switch screenHeight {
      case 667.0:
        imageViewSizes.segmentViewHeight = imageViewSizes.remainingScreenHeight * 0.12
        imageViewSizes.imageWidthAndHeight = (imageViewSizes.remainingScreenHeight - imageViewSizes.segmentViewHeight) * 0.36
        imageViewSizes.logoHeight = imageViewSizes.imageWidthAndHeight - 10.0
        imageViewSizes.userNameHeightAnchor = 0.46
        imageViewSizes.eventsStackviewHeightAnchor = 0.46
      case 736.0:
        imageViewSizes.segmentViewHeight = imageViewSizes.remainingScreenHeight * 0.12
        imageViewSizes.imageWidthAndHeight = (imageViewSizes.remainingScreenHeight - imageViewSizes.segmentViewHeight) * 0.375
        imageViewSizes.logoHeight = imageViewSizes.imageWidthAndHeight - 10.0
        imageViewSizes.userNameHeightAnchor = 0.465
        imageViewSizes.eventsStackviewHeightAnchor = 0.465
      case 812.0:
        imageViewSizes.segmentViewHeight = imageViewSizes.remainingScreenHeight * 0.10
        imageViewSizes.imageWidthAndHeight = (imageViewSizes.remainingScreenHeight - imageViewSizes.segmentViewHeight) * 0.335
        imageViewSizes.logoHeight = imageViewSizes.imageWidthAndHeight - 20.0
        imageViewSizes.userNameHeightAnchor = 0.47
        imageViewSizes.eventsStackviewHeightAnchor = 0.47
      case 896.0:
        imageViewSizes.segmentViewHeight = imageViewSizes.remainingScreenHeight * 0.10
        imageViewSizes.imageWidthAndHeight = (imageViewSizes.remainingScreenHeight - imageViewSizes.segmentViewHeight) * 0.35
        imageViewSizes.logoHeight = imageViewSizes.imageWidthAndHeight - 20.0
        imageViewSizes.userNameHeightAnchor = 0.48
        imageViewSizes.eventsStackviewHeightAnchor = 0.48
      default:
        print("no size class available")
    }
  }
    
    func setupUIDynamic() {
      // Items that would need refresh
      
    }
  
  private func getInitialCalendarUserName() {
    addUserAlert()
  }
  
    private func addUserAlert() {
      print("in addUser func")
      // The overall alert controller
      let alert = UIAlertController(title: "I see you don't have a calendar.", message: "What would you like to name your first calendar?", preferredStyle: .alert)
      // The Add button: adds a new person
      let addAction = UIAlertAction(title: "Add", style: .default) { (action) -> Void in
  
        if let textField = alert.textFields?[0],
          let text = textField.text, !text.isEmpty {
  
          if text.count <= 1 {
            let alert = UIAlertController(title: "Error", message: "A person's name must be longer than a single character!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ -> Void in
              print("I am in OK")
              self.addUserAlert()
            }))
            self.present(alert, animated: true, completion: nil)
          } else {
            print("Pass name to tableview \(text)")
            self.setInitialUser(name: text)
          }
        }
      }
      alert.addTextField(configurationHandler: nil)
      alert.addAction(addAction)
      present(alert, animated: true, completion: nil)
    }
  
  private func setInitialUser(name: String) {
    UserDefaults.standard.set(name, forKey: kName)
    let initialUserArray = self.viewModelMainView.getInitialUser()
//    guard let initialUser = initialUserArray.popLast() else { return }
    self.updateCurrentCalendarUser = viewModelMainView.currentUser
    var notificationDict = [String : Any]()
    notificationDict.updateValue(initialUserArray.name, forKey: "newUser")
    NotificationCenter.default.post(name: Notification.Name(kCalendarUserWillAddNewUserToTableViewNotificaiton), object: nil, userInfo: notificationDict)
  }
  
  private func addHygieneEvent(user: CalendarUsers, date: Date, eventType: Int) {
    viewModelMainView.addHygieneEvent(event: (owner: user, date: date, eventType: eventType))
    print(user.name, eventType)
    NotificationCenter.default.post(name: NSNotification.Name(kInsertNewHygieneEvent), object: self, userInfo: ["currentUser" : user as Any, "eventDate" : date, "eventType" : eventType])
  }
  
  func updateContainerView() {
    print("updateContainerView: \((segment.deSelect, segment.select))")
    remove(asChildViewController: containerViewsArray[segment.deSelect])

    add(asChildViewController: containerViewsArray[segment.select])
    segment.deSelect = segment.select
  }
  
  private func add(asChildViewController viewController: UIViewController) {
    if let vc = viewController as? SettingsViewController {
//      vc.viewModelMainView = viewModelMainView
//      vc.presentDelegate = self
    } else if let vc = viewController as? HygieneEventsCollectionViewController {
      print("*********************************\((containerView.frame.height, containerView.frame.width))")
      vc.viewModelMainView = viewModelMainView
      vc.currentCalendarUser = self.currentCalendarUser
    } else if let vc = viewController as? SettingsViewController {
//      vc.segmentDelegate = self
//      vc.viewModelMainView = viewModelMainView
    } else if let vc = viewController as? SettingsViewController {
//      vc.segmentDelegate = self
//      vc.viewModelMainView = viewModelMainView
    } else if let vc = viewController as? SettingsViewController {
//      vc.segmentDelegate = self
//      vc.viewModelMainView = viewModelMainView
    }

    addChild(viewController)
    containerView.addSubview(viewController.view)
    viewController.view.frame = containerView.bounds
    viewController.didMove(toParent: self)
    }
    
  private func remove(asChildViewController viewController: UIViewController) {
    viewController.willMove(toParent: nil)
    viewController.view.removeFromSuperview()
    viewController.removeFromParent()
    }
  
  @objc func colorModeHasChanged(_ sender: UISwitch) {
    print("in colorModeHasChanged")

    if sender.isOn && currentColorMode!.rawValue == ColorMode.light.rawValue {
      UserDefaults.standard.set(ColorMode.dark.rawValue, forKey: UserInfoStatusKey.colorMode.rawValue)
    } else if !sender.isOn && currentColorMode!.rawValue == ColorMode.dark.rawValue {
      UserDefaults.standard.set(ColorMode.light.rawValue, forKey: UserInfoStatusKey.colorMode.rawValue)
    }
  }
  
  @objc func handelAddUserImage(_ sender: UITapGestureRecognizer) {
    print("in handelAddUserImage")
  }
  
  @objc func handelAddHygieneEvent(_ sender: UIButton) {
  
    if sender.tag == 4 {
      print("I am in custom")
      let customEventVC = AddCustomEventViewController()
      customEventVC.handleTapGestureDelegate = self
      customEventVC.transitioningDelegate = (self as! UIViewControllerTransitioningDelegate)
      present(customEventVC, animated: true, completion: nil)
    } else {
      addHygieneEvent(user: viewModelMainView.currentUser, date: Date(), eventType: Int(sender.tag))
    }
    
  }
  
  @objc func handleSegmentedControlDidChange(_ sender: UISegmentedControl) {
    print("in handleSegmentedControlDidChange")
    
    let isSameSender = sender === lastSender
    if !isSameSender {
      segment.select = sender.selectedSegmentIndex
      lastSender.selectedSegmentIndex = sender.selectedSegmentIndex
    } else {
      segment.select = sender.selectedSegmentIndex
      lastSender = sender
    }
    updateContainerView()
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return FlipPresentAnimationController(originFrame: containerViewSegmentedControl.frame)
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    guard let _ = dismissed as? AddCustomEventViewController else {
      return nil
    }
    return FlipDismissAnimationController(destinationFrame: containerViewSegmentedControl.frame)
  }
  
}
