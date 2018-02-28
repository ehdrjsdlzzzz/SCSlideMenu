//
//  SCSlideViewController.swift
//  SCSlide Menu
//
//  Created by 이동건 on 2018. 2. 28..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class SCSlideViewController: UIViewController {

    @IBInspectable var menuWidth:CGFloat = 150
    
    private var menuView:SCSlideMenu = {
        let view = SCSlideMenu()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var menuViewLeftLayoutConstraint: NSLayoutConstraint?
    private var keyWindow: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SCSlide Menu"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(handleShowSlideMenu))
        setupMenuView()
    }
    
    func setupMenuView(){
        keyWindow = UIApplication.shared.keyWindow
        
        keyWindow?.addSubview(menuView)
        menuView.topAnchor.constraint(equalTo: keyWindow!.topAnchor).isActive = true
        menuView.widthAnchor.constraint(equalToConstant: menuWidth).isActive = true
        menuView.bottomAnchor.constraint(equalTo: keyWindow!.bottomAnchor).isActive = true
        
        menuViewLeftLayoutConstraint = menuView.leftAnchor.constraint(equalTo: keyWindow!.leftAnchor, constant: -menuWidth)
        menuViewLeftLayoutConstraint?.isActive = true
    }
}

extension SCSlideViewController {
    @objc func handleShowSlideMenu(){
        if self.keyWindow?.frame.origin.x == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.keyWindow?.frame.origin.x = self.menuWidth
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                self.keyWindow?.frame.origin.x = 0
            }, completion: nil)
        }
    }
}
