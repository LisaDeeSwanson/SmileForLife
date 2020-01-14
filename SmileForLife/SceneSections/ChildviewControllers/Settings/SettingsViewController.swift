//
//  SettingsViewController.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/31/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
  }
}

//class SettingsViewController: UIViewController {
//
//  let reuseIdendifier = GlobalConstants.cellId.rawValue
//  var viewModelMainView: ViewModelMainView!
//  var presentDelegate: PresentViewControllerFromMain?
//  lazy var notificationsAuthorization: Bool = false
//
//  let settingsTableView: UITableView = {
//    let tableView = UITableView(frame: CGRect.zero)
//    tableView.translatesAutoresizingMaskIntoConstraints = false
//    tableView.backgroundColor = UIColor.cpPurpleGrey
//    return tableView
//  }()
//
//  override func loadView() {
//    settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdendifier)
//    settingsTableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//    settingsTableView.separatorColor = UIColor.cpCharcoalTrans
//  }
//    override func viewDidLoad() {
//      super.viewDidLoad()
//
//      settingsTableView.delegate = self
//      settingsTableView.dataSource = self
//
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
//          if granted {
//            print("You have authorizations")
//            self.notificationsAuthorization = true
//          } else {
//            print(error?.localizedDescription ?? "")
//          }
//        }
//      }
//
//}
//
//extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      return 5
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdendifier, for: indexPath)
//      cell.backgroundColor = .cpSlate
//      cell.textLabel?.textColor = .cpSlate
//
//      switch indexPath.row {
//      case 0:
//        print(indexPath.row)
//        cell.selectionStyle = .none
//        cell.layer.cornerRadius = 5
//        cell.textLabel?.text = "Notifications"
//        cell.backgroundColor = UIColor.cpLightBlue2
//      case 1:
//        print(indexPath.row)
//        if notificationsAuthorization {
//          cell.indentationLevel = 2
//          cell.textLabel?.text = "Add Notifications"
//          cell.textLabel?.textColor = UIColor.cpCharcoalTrans
//          cell.accessoryType = .disclosureIndicator
//        } else {
//          cell.isHidden = true
//        }
//      case 2:
//        if notificationsAuthorization {
//          cell.indentationLevel = 2
//          cell.textLabel?.text = "Edit Notifications"
//          cell.textLabel?.textColor = UIColor.cpCharcoalTrans
//          cell.accessoryType = .disclosureIndicator
//        } else {
//          cell.isHidden = true
//        }
//      case 3:
//        cell.selectionStyle = .none
//        cell.layer.cornerRadius = 5
//        cell.textLabel?.text = "Users"
//        cell.backgroundColor = UIColor.cpLightBlue2
//      case 4:
//        print(indexPath.row)
//        cell.indentationLevel = 2
//        cell.textLabel?.text = "Add Users Calendar"
//        cell.textLabel?.textColor = UIColor.cpCharcoalTrans
//        cell.accessoryType = .disclosureIndicator
//      default:
//        print("I should never be here")
//      }
//      cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//  //    cell.textLabel?.textColor = .white
//      return cell
//    }
//
//  //  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//  //    tableView.deselectRow(at: indexPath.row, animated: true)
//  //  }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//      switch indexPath.row {
//      case 0, 3:
//        return 40
//      case 1, 2, 4:
//        return 35
//      default:
//        return 20
//      }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//      switch indexPath.row {
//        case 1:
//          self.presentDelegate?.presentViewController(index: indexPath.row)
//          break
//        case 4:
//          self.presentDelegate?.presentViewController(index: indexPath.row)
//          break
//        default:
//          print("This should not be printing tableView didSelectRowAt default of switch")
//      }
//    }
//
//}
