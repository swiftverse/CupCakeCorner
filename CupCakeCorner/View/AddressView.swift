//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Amit Shrivastava on 11/12/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
   
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.ordersStruct.name)
                TextField("Street", text: $order.ordersStruct.streetAddress)
                TextField("City", text: $order.ordersStruct.city)
                TextField("Zip", text: $order.ordersStruct.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                }
            label: {
                Text("Check Out")
            }
            }
            .disabled(order.ordersStruct.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
