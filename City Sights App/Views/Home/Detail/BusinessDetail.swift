//
//  BusinessDetail.swift
//  City Sights App
//
//  Created by Warkois on 5/5/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    @State private var showDirections = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 0){
                // Business Image
                GeometryReader(){ geometry in
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    
                }
                .ignoresSafeArea(.all, edges: .top)
               
                // OPen closed indicator
                ZStack(alignment: .leading){
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            
            
           
            Group {
                
                BusinessTitle(business: business)
                    .padding()
                
                Divider()
                //Phone
                HStack{
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                
                Divider()
                
                //Reviews
                HStack{
                    Text("Reviews:")
                        .bold()
                   Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                        
                }
                .padding()
                
                Divider()
                
                //Website
                HStack{
                    Text("Website:")
                        .bold()
                    Text(business.url ?? "")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                        
                }
                .padding()
                
                Divider()
            
                
            }
            
            //Get directions button
            Button{
                // Show directions
                showDirections = true
                
            } label:{
                ZStack{
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
            .sheet(isPresented: $showDirections){
                DirectionsView(business: business)
            }
            
            
        }
    }
}

