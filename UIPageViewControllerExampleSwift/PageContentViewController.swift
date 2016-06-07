//
//  PageContentViewController.swift
//  UIPageViewControllerExampleSwift
//
//  Created by Luis Arias on 06/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    var pageIndex: NSInteger?
    var pageTitle: String?
    
    override func viewDidLoad() {
        self.labelTitle.text = self.pageTitle
    }
}
