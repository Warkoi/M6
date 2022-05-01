//
//  BusinessSection.swift
//  City Sights App
//
//  Created by Warkois on 4/29/22.
//

import SwiftUI

struct BusinessSection: View {
    
    var title:  String
    var businesses : [Business]
    
    var body: some View {
        
        Section(header: BusinessSectionHeader(title: title)){
            ForEach(businesses) {business in
                BusinessRow(business: business)
            }
        }
    }
}

