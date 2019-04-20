//
//  ViewController.swift
//  UICollectionView
//
//  Created by Dmitry Belousov on 20/04/2019.
//  Copyright © 2019 Dmitry Belousov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImage]()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       collectionView.dataSource = self
        collectionView.delegate = self
        for i in 1...6{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
        
        
        
        
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImage", for: indexPath) as! ImageCollectionViewCell
      let image = images[indexPath.item]
        cell.photoView.image = image
        return cell
    }
    
    
}
