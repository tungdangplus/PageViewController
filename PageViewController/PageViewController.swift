//
//  ViewController.swift
//  PageViewController
//
//  Created by TungDang on 3/22/20.
//  Copyright © 2020 Tung Dang. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var vcList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(identifier: "VC1")
        let vc2 = sb.instantiateViewController(identifier: "VC2")
        let vc3 = sb.instantiateViewController(identifier: "VC3")
        
        return [vc1,vc2, vc3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self
        self.dataSource = self
        
        if let firstVC = vcList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcList.firstIndex(of: viewController) else {return nil}
        let previousIndex = vcIndex - 1
        guard 0 <= previousIndex && previousIndex < vcList.count else {return nil} //guard -> bao dam dieu kien, neu khong thi else ...
        
        return vcList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcList.lastIndex(of:viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard 0 < nextIndex && nextIndex < vcList.count else {return nil} //guard -> bao dam dieu kien, neu khong thi else ...
        
        return vcList[nextIndex]
    }



}//

