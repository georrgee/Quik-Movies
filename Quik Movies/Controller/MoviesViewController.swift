//
//  MoviesViewController.swift
//  Quik Movies
//
//  Created by George Garcia on 5/1/19.
//  Copyright © 2019 GeeTeam. All rights reserved.
//

import UIKit

private let cellID = "MovieCollectionViewCell"

class MoviesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchSegments(_ sender: CustomSegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            case 0:
                print("Now Playing Tab Touched")
            case 1:
                print("Upcoming Tab Touched")
            default:
                print("Unknown")
        }
    }
}

extension MoviesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MovieCollectionViewCell
        return cell
    }
    
    
}

extension MoviesViewController: UICollectionViewDelegate {
    
}


