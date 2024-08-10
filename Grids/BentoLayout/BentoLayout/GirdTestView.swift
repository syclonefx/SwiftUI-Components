////
//// GirdTestView.swift
//// BentoLayout
////
//// Created by syclonefx on 8/10/24
//// https://syclonefx.com
//// https://github.com/syclonefx
////
//
//import SwiftUI
//
//struct GirdTestView: View {
//  var body: some View {
//    Grid(horizontalSpacing: 2) {
//      GridRow {
//        ContainerView(width: 370)
//      }
//    }
//    
//    Divider()
//    
//    Grid(horizontalSpacing: 2) {
//      GridRow {
//        ContainerView(width: 185)
//        ContainerView(width: 185)
//      }
//    }
//    
//    Divider()
//    
//    Grid(horizontalSpacing: 2) {
//      GridRow {
//        ContainerView(width: 185)
//          .gridCellColumns(2)
//        Grid(horizontalSpacing: 2) {
//          GridRow {
//            ContainerView(width: 185, height: 90)
//          }
//          GridRow {
//            ContainerView(width: 185, height: 90)
//          }
//        }
//      }
//    }
//    
//    Divider()
//    
//    Grid(horizontalSpacing: 2) {
//      GridRow {
//        ContainerView(width: 185)
//          .gridCellColumns(2)
//        Grid(horizontalSpacing: 2) {
//          GridRow {
//            ContainerView(width: 185, height: 90)
//              .gridCellColumns(2)
//          }
//          GridRow {
//            ContainerView(width: 90)
//            ContainerView(width: 90)
//          }
//        }
//      }
//    }
//    
//    Divider()
//    
//    Grid(horizontalSpacing: 2) {
//      GridRow {
//        ContainerView(width: 185)
//          .gridCellColumns(2)
//        Grid(horizontalSpacing: 2) {
//          GridRow {
//            ContainerView(width: 90)
//            ContainerView(width: 90)
//          }
//          GridRow {
//            ContainerView(width: 90)
//            ContainerView(width: 90)
//          }
//        }
//      }
//    }
//  }
//}
//
//#Preview {
//  GirdTestView()
//}
