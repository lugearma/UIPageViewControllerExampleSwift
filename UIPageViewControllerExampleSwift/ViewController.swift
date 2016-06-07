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
        let viewControllers: [UIViewController]? = [startingViewController]
        self.pageViewController?.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)

        //Change the size of page view controller
        self.pageViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.addChildViewController(pageViewController!)
        self.view.addSubview((pageViewController?.view)!)
        self.pageViewController?.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController! {
        if self.pageTitles.count == 0 || index >= self.pageTitles.count{
            return nil
        }
        
        //Create new view controller
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        pageContentViewController.pageTitle = self.pageTitles[index]
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
    
    //MARK: Page View Controller Data Source Methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as? PageContentViewController
        var index = viewController?.pageIndex
        
        if index == 0 || index == NSNotFound{
            return nil
        }
        
        index! += 1
        return self.viewControllerAtIndex(index!)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as? PageContentViewController
        var index = viewController?.pageIndex
        
        if index == 0 || index == NSNotFound{
            return nil
        }
        
        index! -= 1
        return self.viewControllerAtIndex(index!)
    }

}