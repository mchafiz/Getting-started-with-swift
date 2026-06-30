//
//  FoodDetailView.swift
//  WoldBites
//
//  Created by Muhammad Chaerul Hafiz on 29/06/26.
//

import SwiftUI
import MapKit


struct FoodDetailView: View {
    let item: FoodItem
    
    var body: some View {
        VStack ( spacing:20){
            Text(item.name).fontWeight(.bold).fontDesign(.monospaced).font(.system(size:40))
            Image(item.name)  // cari asset bernama "Nasi Goreng", "Sushi", "Pizza"
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 50))

            Text(item.description).multilineTextAlignment(.leading)
//            Text("Rating: \(item.rating)/5")
            HStack{
                ForEach(0..<item.rating, id: \.self) { _ in
                    Image(systemName: "star.fill").foregroundStyle(.yellow.gradient)
                }
            }
            
            
            
            Map(initialPosition: .region(item.mapRegion)){
                Marker(item.name, coordinate: item.coordinate)
            }
            Spacer()

        
                            }.padding(EdgeInsets(top: 0, leading: 40, bottom: 40, trailing: 40))
    }
}


#Preview {
    FoodDetailView(item: FoodItem(name: "Sushi", description: "testttt", rating: 5, latitude: 0, longitude: 0))
}
