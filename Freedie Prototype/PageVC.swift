//
//  PageVC.swift
//  Freedie Prototype
//
//  Created by montserratloan on 4/1/18.
//  Copyright © 2018 Freedie. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {

    var currentPage = 0
    
    
    var foodType = ["Italian","Indian", "Mexican"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        
        setViewControllers([createDetailVC(forPage: 0)], direction: .forward, animated: false, completion: nil)
    }
    func createDetailVC(forPage page: Int) -> MunchiesVC {
        
        currentPage = min(max(0, page), foodType.count - 1)
        
        let munchiesVC = storyboard?.instantiateViewController(withIdentifier: "MunchiesVC") as! MunchiesVC
        
        munchiesVC.currentPage = currentPage
        munchiesVC.foodType = foodType
        
        return munchiesVC
    }

}

extension PageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? MunchiesVC {
            if currentViewController.currentPage  < foodType.count - 1 {
                return createDetailVC(forPage: currentViewController.currentPage + 1)
            }
        }
        return nil
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? MunchiesVC {
            if currentViewController.currentPage > 0 {
                return createDetailVC(forPage: currentViewController.currentPage - 1)
                
            }
        }
        return nil
}

}

