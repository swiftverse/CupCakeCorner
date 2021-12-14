//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Amit Shrivastava on 09/12/21.
//

//import SwiftUI
//import Foundation
//struct CupCakeCorner: View {
//    @StateObject var order = Order()
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    Picker("Pick the type of cupcakes",selection: $order.type) {
//                        ForEach(Order.types.indices){
//                            Text(Order.types[$0])
//                        }
//                    }
//
//                    Stepper("\(order.quantity)", value: $order.quantity, in: 3...20)
//
//
//
//                }
//
//                Section {
//                    Toggle("Any Special Requests", isOn: $order.specialRequestEnabled)
//                    if(order.specialRequestEnabled){
//                        Toggle("Add extra Frosting", isOn: $order.extraFrosting)
//                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
//                    }
//
//                }
//
//                Section {
//                    NavigationLink {
//                        AddressView(order: order)
//                    }
//                    label : {
//                        Text("Delivery Details")
//                    }
//                }
//            }
//            .navigationTitle("Cupcake Corner")
//        }
//
//    }
//}
//
//struct CupCakeCorner_Previews: PreviewProvider {
//    static var previews: some View {
//        CupCakeCorner()
//    }
//}



import SwiftUI
import Foundation
struct CupCakeCorner: View {
    @StateObject var order = Order()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Pick the type of cupcakes",selection: $order.ordersStruct.type) {
                        ForEach(OrderStruct.types.indices){
                            Text(OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper("\(order.ordersStruct.quantity)", value: $order.ordersStruct.quantity, in: 3...20)
                    
                 
                    
                }
                
                Section {
                    Toggle("Any Special Requests", isOn: $order.ordersStruct.specialRequestEnabled)
                    if(order.ordersStruct.specialRequestEnabled){
                        Toggle("Add extra Frosting", isOn: $order.ordersStruct.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.ordersStruct.addSprinkles)
                    }
                    
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    }
                    label : {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    
    }
}

struct CupCakeCorner_Previews: PreviewProvider {
    static var previews: some View {
        CupCakeCorner()
    }
}
