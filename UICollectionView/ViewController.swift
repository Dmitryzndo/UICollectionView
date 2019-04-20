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
    let countCell = 2
    let offset:CGFloat = 2.0
    let cellId = "cell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       collectionView.dataSource = self
        collectionView.delegate = self
        for i in 1...6{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
        
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        
        
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCollectionViewCell
      let image = images[indexPath.item]
        cell.photoView.image = image
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / CGFloat(countCell)
        let heightCell = widthCell
        let spacing = CGFloat((countCell + 1)) * offset / CGFloat(countCell)
        return CGSize(width: widthCell - spacing, height: heightCell - (offset*2))
    }
    
}
