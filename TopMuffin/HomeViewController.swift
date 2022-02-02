//
//  HomeViewController.swift
//  TopMuffin
//
//  Created by samosab0y on 2022-01-25.
//

import UIKit

class HomeViewController: UIViewController {
    var MuffinCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top Muffins"
        navigationController?.view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.tabBarItem.image = UIImage(systemName: "house.fill")
        navigationController?.tabBarItem.title = "Home"
        
        let view = UIView()
        view.backgroundColor = .white
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumLineSpacing = 7
        layout.minimumInteritemSpacing = 0
        
        MuffinCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        MuffinCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MuffinCell")
        MuffinCollectionView?.backgroundColor = .white
        MuffinCollectionView?.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        MuffinCollectionView?.dataSource = self
        MuffinCollectionView?.delegate = self
        
        view.addSubview(MuffinCollectionView ?? UICollectionView())
        
        self.view = view
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MuffinCell", for: indexPath)
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on \(indexPath.row)")
        let singleMuffinView = SingleMuffinViewController()
        navigationController?.pushViewController(singleMuffinView, animated: true)
    }
}
