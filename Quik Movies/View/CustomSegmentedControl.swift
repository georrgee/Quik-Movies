//  CustomSegmentedControl.swift
//  Quik Movies

//  Created by George Garcia on 5/1/19.
//  Copyright © 2019 GeeTeam. All rights reserved.


import UIKit

@IBDesignable   // here we can see the changes right on the Storyboard
class CustomSegmentedControl: UIControl {
    
    var segmentButtons = [UIButton]()
    var selector: UIView! // we are definitely going to have one
    var selectedSegmentIndex = 0
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var commaSeparatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .yellow {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .black {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        segmentButtons.removeAll()
        subviews.forEach{ $0.removeFromSuperview() }
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            segmentButtons.append(button)
        }
        
        segmentButtons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(segmentButtons.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height / 2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        let stackView = UIStackView(arrangedSubviews: segmentButtons)
        stackView.axis = .horizontal // axis is just asking us if the stack view is: horizontal or vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false // false: we want to set our own constraints
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true // true: you can make this constraint true otherwise, it won't have any effect
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true // self = the parent view
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    @objc func buttonTapped(button: UIButton) {
        
        for (buttonIndex, btn) in segmentButtons.enumerated() {
            btn.setTitleColor(textColor, for: .normal) // resetting text color when separator chooses another button
            
            if btn == button {
                
                selectedSegmentIndex = buttonIndex
                
                let selectorStartPosition = frame.width / CGFloat(segmentButtons.count) * CGFloat(selectedSegmentIndex)
                UIView.animate(withDuration: 0.3, animations: {     // 0.3 = Apple's Default Animation
                    self.selector.frame.origin.x = selectorStartPosition
                })
                
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
    }

}
