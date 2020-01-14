//
//  RemindersViewController.swift
//  Smile_4_Life
//
//  Created by Lisa Swanson on 2/17/18.
//  Copyright © 2018 Technology Speaks. All rights reserved.
//

import UIKit

class NoEventSelectedAlertUIView: UIView {

  let alertLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.cpCharcoal
    label.textColor = UIColor.cpSlate
    label.numberOfLines = 0
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.text = "Select at least one event, by tapping the image, before saving."
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let okButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.cpCharcoal
    button.setTitleColor(UIColor.cpSlate, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    let attribs = NSAttributedString.init(string: "Ok", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.cpSlate])
    button.setAttributedTitle(attribs, for: .normal)
    return button
  }()
  

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.cpSlate
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

  
  private func setupViews() {
    addSubview(alertLabel)
    addSubview(okButton)

    NSLayoutConstraint.activate([alertLabel.heightAnchor.constraint(equalToConstant: 100),
                                 alertLabel.widthAnchor.constraint(equalToConstant: 280),
                                 alertLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                                 alertLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                 okButton.topAnchor.constraint(equalTo: alertLabel.bottomAnchor, constant: 2),
                                 okButton.centerXAnchor.constraint(equalTo: alertLabel.centerXAnchor),
                                 okButton.widthAnchor.constraint(equalToConstant: 280),
                                 okButton.heightAnchor.constraint(equalToConstant: 50)])
    
//    addSubview(stackView01)
//    stackView01.addArrangedSubview(alertLabel)
//    stackView01.addArrangedSubview(okButton)
//
//    NSLayoutConstraint.activate([stackView01.heightAnchor.constraint(equalToConstant: 202),
//                                 stackView01.widthAnchor.constraint(equalToConstant: 280),
//                                 stackView01.topAnchor.constraint(equalTo: topAnchor),
//                                 stackView01.centerXAnchor.constraint(equalTo: centerXAnchor)])
    
  }

}

class NoEventSelectedViewController: UIViewController {
  
  let myViews: NoEventSelectedAlertUIView = {
    let views = NoEventSelectedAlertUIView()
    views.translatesAutoresizingMaskIntoConstraints = false
    return views
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.cpCharcoalTrans
    }
  
  override func loadView() {
    super.loadView()
    setupViews()
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    myViews.layer.cornerRadius = 20
    myViews.layer.masksToBounds = true
  }

  private func setupViews() {
    view.addSubview(myViews)
    myViews.okButton.addTarget(self, action: #selector(handleOkToDismiss), for: .touchUpInside)
    NSLayoutConstraint.activate([myViews.heightAnchor.constraint(equalToConstant: 152),
                                 myViews.widthAnchor.constraint(equalToConstant: 280),
                                myViews.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                myViews.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                                ])
    
  }
  
  @objc private func handleOkToDismiss() {
    print("In OK")
    dismiss(animated: true, completion: nil)
  }
  

}

class AddCustomEventViewController: UIViewController {
  
  weak var handleTapGestureDelegate: HandleTapGesture?
  

  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
//    label.font = UIFont.boldSystemFont(ofSize: 26)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .cpLightBlue2
    label.text = "Add\nCustom Hygiene Event"
    label.backgroundColor = UIColor.clear
    return label
  }()
  
  let labelStackView: EventLabelViews = {
    let lSV = EventLabelViews()
    lSV.translatesAutoresizingMaskIntoConstraints = false
//    lSV.layer.cornerRadius = 5
//    lSV.layer.borderWidth = 2
//    lSV.layer.borderColor = UIColor.cpSunset.cgColor
    return lSV
  }()
  
  let saveLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.textAlignment = .center
    label.textColor = .cpSlate
    label.text = "Save"
    label.tag = 0
    label.backgroundColor = .cpCalendarBackground
    label.isUserInteractionEnabled = true
    return label
  }()
  
  let cancelLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isUserInteractionEnabled = true
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.textAlignment = .center
    label.textColor = .cpSlate
    label.text = "Cancel"
    label.backgroundColor = .cpCalendarBackground
    return label
  }()
  
  let customDatePicker: UIDatePicker = {
    let datePicker = UIDatePicker(frame: CGRect.zero)
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    datePicker.maximumDate = Date()
//    datePicker.addTarget(self, action: #selector(addCustomEvent), for: UIControl.Event.editingDidEnd)
    return datePicker
  }()
  
  override func loadView() {
    super.loadView()
    setupViews()

  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.cpSlate
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print("In setupViews for ReminderViewController*************************************************")
    cancelLabel.layer.cornerRadius = cancelLabel.frame.height / 2
    cancelLabel.clipsToBounds = true
    saveLabel.layer.cornerRadius = cancelLabel.frame.height / 2
    saveLabel.clipsToBounds = true
//    print(labelStackView.addBrushEvent.frame.height)
//    labelStackView.addBrushEvent.layer.cornerRadius = labelStackView.addBrushEvent.frame.height / 2
//    labelStackView.addBrushEvent.layer.masksToBounds = true
//    labelStackView.heightAnchor.constraint(equalToConstant: 100)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @objc func cancelCustomEvent() {
    print("in Cancel")
    dismiss(animated: true, completion: nil)
  }
  
  @objc func addCustomEvent(_ sender: UITapGestureRecognizer) {
    print("In addCustomHygieneEvent")
    
    let eventsToAdd = [labelStackView.addBrushEvent.isOn, labelStackView.addFlossEvent.isOn]
    var eventType: Int = 0
    guard let tag = sender.view?.tag else { return }
    if labelStackView.addBrushEvent.isOn && labelStackView.addBrushFlossEvent.isOn && labelStackView.addFlossEvent.isOn {
      let alertViewController = NoEventSelectedViewController()
      alertViewController.modalPresentationStyle = .overCurrentContext
      present(alertViewController, animated: true, completion: nil)
    } else if !labelStackView.addBrushFlossEvent.isOn || (!labelStackView.addBrushEvent.isOn && !labelStackView.addFlossEvent.isOn) {
      notifyMainViewOfCustomHygieneEvent(eventType: 3, date: customDatePicker.date, tag: tag)
      dismissControllers()
    } else {
      for (index, event) in eventsToAdd.enumerated() {
        if !event {
          eventType = index + 1
          print(eventType, event)
        }
      }
      notifyMainViewOfCustomHygieneEvent(eventType: eventType, date: customDatePicker.date, tag: tag)
      dismissControllers()
    }
  }
  
  private func dismissControllers() {
    dismiss(animated: true, completion: nil)
  }
  
  func notifyMainViewOfCustomHygieneEvent(eventType: Int, date: Date, tag: Int) {
    print("In notifyMainViewOfCustomHygieneEvent")
    handleTapGestureDelegate?.addCustomHygieneEvent(eventType: eventType, date: date, tag: tag)
  }
  

  
  private func setupViews() {
    view.addSubview(titleLabel)
    view.addSubview(cancelLabel)
    view.addSubview(saveLabel)
    saveLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddCustomEventViewController.addCustomEvent(_:))))
    cancelLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddCustomEventViewController.cancelCustomEvent)))

    view.addSubview(labelStackView)
    view.addSubview(customDatePicker)

    
          NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 5),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            cancelLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            cancelLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            cancelLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 4.5),
            cancelLabel.heightAnchor.constraint(equalToConstant: 50),
            saveLabel.topAnchor.constraint(equalTo: cancelLabel.topAnchor, constant: 0),
            saveLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 4.5),
            saveLabel.heightAnchor.constraint(equalToConstant: 50),
            labelStackView.leftAnchor.constraint(equalTo: cancelLabel.leftAnchor, constant: 10),
            labelStackView.heightAnchor.constraint(equalToConstant: 100),
            labelStackView.topAnchor.constraint(equalTo: cancelLabel.bottomAnchor, constant: 15),
            labelStackView.rightAnchor.constraint(equalTo: saveLabel.rightAnchor, constant: -10),
            customDatePicker.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 2),
            customDatePicker.leftAnchor.constraint(equalTo: labelStackView.leftAnchor),
            customDatePicker.rightAnchor.constraint(equalTo: labelStackView.rightAnchor),
            customDatePicker.heightAnchor.constraint(equalToConstant: 250)
                                       ])
  }

  
}


