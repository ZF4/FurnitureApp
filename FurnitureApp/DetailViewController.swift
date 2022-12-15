//
//  DetailViewController.swift
//  FurnitureApp
//
//  Created by Zachary Farmer on 12/4/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviroment) ->
            NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .sale:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                return section
                
            case .sale2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                return section
                
            case .sale3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(103))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                return section
                
            case .topHeader2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(284))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(284))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            case .header3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
                
                return section
                
            case .line:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0)
                
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
        setUpCollectionView()
        configureDataSource()
    }
    
    private func setUpCollectionView() {
        collectionView.register(SaleCell.nib, forCellWithReuseIdentifier: SaleCell.reuseIdentifier)
        collectionView.register(SaleCell2.nib, forCellWithReuseIdentifier: SaleCell2.reuseIdentifier)
        collectionView.register(SaleCell3.nib, forCellWithReuseIdentifier: SaleCell3.reuseIdentifier)
        collectionView.register(SmallHeaderCell3.nib, forCellWithReuseIdentifier: SmallHeaderCell3.reuseIdentifier)
        collectionView.register(TopHeaderCell2.nib, forCellWithReuseIdentifier: TopHeaderCell2.reuseIdentifier)
        collectionView.register(LineCell.nib, forCellWithReuseIdentifier: LineCell.reuseIdentifier)
        
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .sale:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCell.reuseIdentifier, for: indexPath)
                return cell
                
            case .sale2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCell2.reuseIdentifier, for: indexPath)
                return cell
                
            case .sale3:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCell3.reuseIdentifier, for: indexPath)
                return cell
                
            case .topHeader2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHeaderCell2.reuseIdentifier, for: indexPath)
                return cell
                
            case .header3:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallHeaderCell3.reuseIdentifier, for: indexPath)
                return cell
                
            case .line:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LineCell.reuseIdentifier, for: indexPath)
                return cell
                
            default: return nil
            }
        }
        let sections = [
            Section(type: .topHeader2, items: [
            Item()
            ]),
            Section(type: .header3, items: [
            Item()
            ]),
            Section(type: .sale3, items: [
            Item()
            ]),
            Section(type: .line, items: [
            Item()
            ]),
            Section(type: .sale2, items: [
            Item()
            ]),
            Section(type: .line, items: [
            Item()
            ]),
            Section(type: .sale3, items: [
            Item()
            ]),
            Section(type: .line, items: [
            Item()
            ]),
            Section(type: .sale3, items: [
            Item()
            ]),
            Section(type: .line, items: [
            Item()
            ]),
            Section(type: .sale3, items: [
            Item()
            ])
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
