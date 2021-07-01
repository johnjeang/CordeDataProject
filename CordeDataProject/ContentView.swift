//
//  ContentView.swift
//  CordeDataProject
//
//  Created by John Jeang on 6/29/21.
//

import SwiftUI
import CoreData

enum predicateType: String {
  case beginsWith = "BEGINSWITH"
  case contains = "CONTAINS"
  case equals = "="
  case lessThan = ">"
  case greaterThan = "<"
}

struct ContentView: View {
  
  @Environment(\.managedObjectContext) var moc
  @State private var lastNameFilter = "A"

  var body: some View {
      VStack {
        FilteredList(filterKey: "lastName", filterValue: lastNameFilter, sortDescriptor: NSSortDescriptor(keyPath: \Singer.firstName, ascending: true), predicateType: predicateType.beginsWith.rawValue) { (singer: Singer) in
              Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
          }

          Button("Add Examples") {
              let taylor = Singer(context: self.moc)
              taylor.firstName = "Taylor"
              taylor.lastName = "Swift"

              let ed = Singer(context: self.moc)
              ed.firstName = "Ed"
              ed.lastName = "Sheeran"

              let adele = Singer(context: self.moc)
              adele.firstName = "Adele"
              adele.lastName = "Adkins"

              try? self.moc.save()
          }

          Button("Show A") {
              self.lastNameFilter = "A"
          }

          Button("Show S") {
              self.lastNameFilter = "S"
          }
      }
  }
}


private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
