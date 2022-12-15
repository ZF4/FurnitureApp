//
//  ViewController.swift
//  FurnitureApp
//
//  Created by Zachary Farmer on 11/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviroment) ->
            NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .header:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            case .header2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            case .collections:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(224))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(224))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 0)
                
                return section
                
            case .popular:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 0)
                
                return section
                
            case .topHeader:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(329))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(329))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            default: return nil
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    
    private func initialize() {
        setupCollectionView()
        configureDataSource()
//        gradient()
    }
    
    private func setupCollectionView() {
        collectionView.register(CollectionsCell.nib, forCellWithReuseIdentifier: CollectionsCell.reuseIdentifier)
        collectionView.register(SmallHeaderCell.nib, forCellWithReuseIdentifier: SmallHeaderCell.reuseIdentifier)
        collectionView.register(SmallHeaderCell2.nib, forCellWithReuseIdentifier: SmallHeaderCell2.reuseIdentifier)
        collectionView.register(PopularCell.nib, forCellWithReuseIdentifier: PopularCell.reuseIdentifier)
        collectionView.register(TopHeaderCell.nib, forCellWithReuseIdentifier: TopHeaderCell.reuseIdentifier)


        collectionView.collectionViewLayout = collectionViewLayout
        //Allows collection view to appear under the status bar
        collectionView.contentInsetAdjustmentBehavior = .never
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallHeaderCell.reuseIdentifier, for: indexPath)
                return cell
                
            case .collections:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionsCell.reuseIdentifier, for: indexPath)
                return cell
                
            case .popular:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.reuseIdentifier, for: indexPath)
                return cell
                
            case .header2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallHeaderCell2.reuseIdentifier, for: indexPath)
                return cell
                
            case .topHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHeaderCell.reuseIdentifier, for: indexPath)
                return cell
                
            default: return nil
            }
        }
        let sections = [
            Section(type: .topHeader, items: [
            Item()
            ]),
            Section(type: .header, items: [
            Item()
            ]),
            Section(type: .collections, items: [
            Item(), Item(), Item()
            ]),
            Section(type: .header2, items: [
            Item()
            ]),
            Section(type: .popular, items: [
            Item(), Item(), Item()
            ])
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    //Func for gradient bg
//    func gradient() {
//        let gradient: CAGradientLayer = CAGradientLayer()
//
//                gradient.colors = [UIColor.black.cgColor, UIColor.blue.cgColor]
//                gradient.locations = [0.0 , 1.0]
//                gradient.startPoint = CGPoint(x : 0.0, y : 0)
//                gradient.endPoint = CGPoint(x :0.0, y: 0.5) // you need to play with 0.15 to adjust gradient vertically
//                gradient.frame = view.bounds
//                collectionView.layer.addSublayer(gradient)
//    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "detailView")
        
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}
