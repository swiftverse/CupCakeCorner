//
//  CheckoutView.swift
//  CupCakeCorner
//
//  Created by Amit Shrivastava on 11/12/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) {
                    phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                    else if (phase.error != nil) {
                        Text("cannot load image")
                    }
                    else {
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 200)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                
                Button("Place Order", action: {})
                .padding()
                
       
            }
           
        }
        
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
