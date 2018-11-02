//
//  MoviesVC.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MoviesVC: UIViewController {
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.frame)
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    let dataManager = DataManager.shared
    lazy var refreshControl: UIRefreshControl! = {
        var control = UIRefreshControl()
        control.attributedTitle = NSAttributedString(string: "", attributes: [NSAttributedString.Key.font : Theme.Fonts.titleFont.font, NSAttributedString.Key.foregroundColor : Theme.Colors.primaryTextLight.color])
        control.addTarget(self, action: #selector(userPullRefresh(_ :)), for: UIControl.Event.valueChanged)
        control.tintColor = UIColor.lightGray
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        setupSubViews()
    }
    
    
    //MARK: UI
    
    func setupSubViews() {
        tabBarController?.navigationItem.title = Constants.Strings.moviesTitle
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.register(VerticalMediaTableCell.self, forCellReuseIdentifier: Constants.Cells.verticalMediaTableCellId)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.addSubview(refreshControl)
        tableView.scrollsToTop = true
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentOffset = CGPoint(x: 0, y: -refreshControl.frame.size.height)
    }
    
    
    //MARK: Actions
    
    @objc func userPullRefresh(_ sender: AnyObject?) {
        refresh()
    }
    
    func refresh() {
        dataManager.getMedia(country: Country.unitedStates, mediaType: MediaType.movies, feedType: FeedType.topMovies, genre: "all", limit: "25", completion: {[weak self] success in
            guard self != nil else {
                return
            }
            self?.refreshControl.endRefreshing()
            if success {
                self?.tableView.reloadData()
            }
        })
    }
}

//MARK: TableView Delegate - DataSource

extension MoviesVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.allMedia[MediaType.movies]?.count ?? 0 > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.allMedia[MediaType.movies]?.count ?? 0 > 0 ? dataManager.allMedia[MediaType.movies]?.count ?? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.verticalMediaTableCellId, for: indexPath) as! VerticalMediaTableCell
        if let media = dataManager.allMedia[MediaType.movies]?[indexPath.row] {
            cell.nameLabel.text = media.name ?? ""
            if let imagePath = media.artworkUrl100 {
                cell.mediaImageView.sd_setImage(with: URL(string: imagePath), placeholderImage: nil, options: [.continueInBackground])
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
