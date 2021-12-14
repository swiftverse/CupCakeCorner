//
//  CheckoutView.swift
//  CupCakeCorner
//
//  Created by Amit Shrivastava on 11/12/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var isOrderPlaced = false
    @State private var alertDataMessage = ""
    @State private var errorData = ""
    @State private var errorWindow = false
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
                
                Text("Your total is \(order.ordersStruct.cost, format: .currency(code: "USD"))")
                
                Button("Place Order", action: {
                    Task {
                        await placeOrder()
                    }
                    
                })
                .padding()
                .alert("No data found", isPresented: $errorWindow) {
                    Button("OK") {}
                }
            message: {
                Text(errorData)
            }
       
            }
           
        }
        
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you", isPresented: $isOrderPlaced) {
            Button("OK") {}
        
            
        }
        
    message: {
        Text(alertDataMessage)
        }
       
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order.ordersStruct)
        else {
            print("no data found")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let encodedOrder = try JSONDecoder().decode(OrderStruct.self, from: data)
            alertDataMessage = "Your order for \(encodedOrder.quantity) X \(OrderStruct.types[encodedOrder.type]) cupcakes in on its way "
            isOrderPlaced = true
        
        }
        catch {
            print("check out failed")
            self.errorWindow = true
            errorData = "Network error has occured"
        }

    }
    
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
