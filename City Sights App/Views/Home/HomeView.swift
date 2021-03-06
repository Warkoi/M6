//
//  HomeView.swift
//  City Sights App
//
//  Created by Warkois on 4/28/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness:Business?
    
    var body: some View {
        
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView{
                // Determine if we should show list or map
                if !isMapShowing{
                    // Show list
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to map view"){
                                self.isMapShowing = true
                            }
                            Divider()
                            
                        }
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else{
                    
                    ZStack (alignment: .top){
                                            
                        // show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) {business in
                                
                                
                                //Create a business detail view instance
                                //Pass in the selected business
                                BusinessDetail(business: business)
                            }
                        //Rectangle overlay
                        ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .frame(height: 48)
                            HStack{
                                Image(systemName: "location")
                                Text("San Francisco")
                                Spacer()
                                Button("Switch to list view"){
                                    self.isMapShowing = false
                                } .padding()
                            }
                                
                            
                        }.padding()

                    }
                    .navigationBarHidden(true)
                  
                    
                    
                }
            }
            
            
            
        }
        else {
            // Still waiting for date so show spinner
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
