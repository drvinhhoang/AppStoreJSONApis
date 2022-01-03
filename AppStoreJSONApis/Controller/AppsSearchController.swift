//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by VINH HOANG on 02/01/2022.
//

import UIKit
import SDWebImage

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let cellId = "id1234"
    fileprivate var appResults = [Result]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchITunesApps()
        
        
    }
    

    
    fileprivate func fetchITunesApps() {
        
        Service.shared.fetchApps {[weak self] (results, err)  in
            guard let self = self else { return }
            
            if let err = err {
                print("Failed to fetch apps:", err)
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
      
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
                
        cell.appResult = appResults[indexPath.item]
  
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
