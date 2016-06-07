//
//  ViewController.swift
//  UIPageViewControllerExampleSwift
//
//  Created by Luis Arias on 06/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    let pageTitles = ["Screen 1", "Screen 2", "Screen 3", "Screen 4"]
    var pageViewController: UIPageViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create page view indicator
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController
        self.pageViewController?.dataSource = self
        
        //Create a variable for first element that will be show
        let startingViewController = self.viewControllerAtIndex(0)
        var viewControllers = [startingViewController]
        self.pageViewController?.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)

        //Change the size of page view controller
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController {
        return nil
    }
    
    //MARK: Page View Controller Data Source Methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        <#code#>
    }


}