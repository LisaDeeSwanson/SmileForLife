//
//  MainUITabBarController.swift
//  smile4Life
//
//  Created by Lisa Swanson on 10/4/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit

class MainUITabBarController: UITabBarController, UITabBarControllerDelegate {
 
  
  let home = "Home"
  let homeTabBarIcon = "homeTabBarIcon"
  let education = "Education"
  let tabBarEducation = "tabBarEducation"
//  let receiverClass = Receiver(notification: Notification.Name.colorModeStatusUpdate)
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.delegate = self
    
    guard let userColorMode = UserDefaults.standard.object(forKey: UserInfoStatusKey.colorMode.rawValue) else { return }
    let currentColorMode = ColorMode.init(rawValue: userColorMode as! String)
    navigationController?.setNavigationBarHidden(true, animated: animated)
    UITabBar.appearance().barTintColor = .highlight(colorMode: currentColorMode!)
    view.backgroundColor = .background(colorMode: currentColorMode!)
   }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      let persistantViewModelMain = ViewModelMainView()
      let firstVC = HomeViewController()
      firstVC.set(stack: persistantViewModelMain)
      let secondVC = EducationViewController()
      firstVC.tabBarItem = UITabBarItem(title: home, image: UIImage(imageLiteralResourceName: homeTabBarIcon), tag: 0)
      secondVC.tabBarItem = UITabBarItem(title: education, image: UIImage(imageLiteralResourceName: tabBarEducation), tag: 1)
      
      let tabBarList = [firstVC, secondVC]
      
      viewControllers = tabBarList
        // Do any additional setup after loading the view.
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
