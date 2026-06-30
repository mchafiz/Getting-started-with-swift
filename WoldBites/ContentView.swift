//
//  ContentView.swift
//  WoldBites
//
//  Created by Muhammad Chaerul Hafiz on 29/06/26.
//

import SwiftUI
import MapKit


struct FoodItem: Hashable{
    let name: String
    let description: String
    let rating: Int
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var mapRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    }
}

struct ContentView: View {
//    let food: [(image: ImageResource, text: String)] = [
//        (image: .nasiGoreng, text: "Nasi Goreng"),
//        (image: .pizza, text: "Pizza"),
//        (image: .sushi, text: "Pizza"),
//    ]
//    
    let food =  [
        FoodItem(name: "Nasi Goreng", description: "Fried rice with egg, vegetables and sweet soy sauce.", rating:5, latitude: -6.18, longitude: 106.83),
        FoodItem(name: "Pizza", description: "Italian flatbeard topped with tomato, cheese more.", rating:3, latitude: 40.84, longitude: 14.25),
        FoodItem(name: "Sushi", description: "Japanese Rice Rools, often served with fish and vegetables", rating:4, latitude: 35.69, longitude: 139.69)];

    var body: some View {
        NavigationStack {
            List(food, id: \.self) {item in
                NavigationLink (value:item) {
                    VStack {
                        Image(item.name)  // cari asset bernama "Nasi Goreng", "Sushi", "Pizza"
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 50))
                        Text(item.name)
                    }
                }
            }.navigationTitle("Dream Food").navigationDestination(for: FoodItem.self) {
                item in FoodDetailView(item:item)
            }
        }
      
        
        
        
        
        
        
        
        
//        VStack(spacing: 20) {
//            Image(.pizza).resizable().scaledToFit().clipShape(.rect(cornerRadius: 50))
//            
//            HStack (spacing: 15) {
//                
//               Image(systemName: "fork.knife").imageScale(.large)
//                    .foregroundStyle(.red.gradient).font(.system(size: 25)).shadow(radius: 20)
//                    
//                
//                Text("Pizza Me").font(.largeTitle).foregroundStyle(.red.gradient).shadow(radius: 10).fontDesign(.serif)
//            }
//            
//            Text("Food from around the world").foregroundStyle(.secondary).font(.title2).shadow(radius: 10)
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
