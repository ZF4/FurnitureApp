//
//  Section.swift
//  FurnitureApp
//
//  Created by Zachary Farmer on 11/29/22.
//

import Foundation

struct Section: Hashable {
    let id = UUID()
    
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [Item]
    
    init(type: SectionType, title: String = "", subtitle: String = "", items: [Item] = []) {
        
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
    
    enum ItemSectionType: String {
        case sale
        case sale2
        case sale3
        case header
        case header2
        case header3
        case collections
        case popular
        case topHeader
        case topHeader2
        case line
    }
    
    struct SectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        static let sale = SectionType(rawValue: Section.ItemSectionType.sale.rawValue)
        static let sale2 = SectionType(rawValue: Section.ItemSectionType.sale2.rawValue)
        static let sale3 = SectionType(rawValue: Section.ItemSectionType.sale3.rawValue)
        static let header = SectionType(rawValue: Section.ItemSectionType.header.rawValue)
        static let header2 = SectionType(rawValue: Section.ItemSectionType.header2.rawValue)
        static let header3 = SectionType(rawValue: Section.ItemSectionType.header3.rawValue)
        static let collections = SectionType(rawValue: Section.ItemSectionType.collections.rawValue)
        static let popular = SectionType(rawValue: Section.ItemSectionType.popular.rawValue)
        static let topHeader = SectionType(rawValue: Section.ItemSectionType.topHeader.rawValue)
        static let topHeader2 = SectionType(rawValue: Section.ItemSectionType.topHeader2.rawValue)
        static let line = SectionType(rawValue: Section.ItemSectionType.line.rawValue)

    }
}
