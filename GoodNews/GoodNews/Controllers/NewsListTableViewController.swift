//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by KSH on 2023/04/30.
//

import UIKit

class NewsListTableViewControllers: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setup()
    }
    
    private func setup() {
        // NavigationBar Title 사이즈 크게 변경
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
