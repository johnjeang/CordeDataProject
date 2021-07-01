//
//  FilteredList.swift
//  CordeDataProject
//
//  Created by John Jeang on 6/30/21.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
  
  let sortDescriptor: NSSortDescriptor //= NSSortDescriptor(key: \Country.longName, ascending: true)
  var fetchRequest: FetchRequest<T>
  let content: (T) -> Content
  
  var body: some View {
    List(fetchRequest.wrappedValue, id: \.self) {item in
      self.content(item)
    }
  }
  
  init(filterKey: String, filterValue: String, sortDescriptor: NSSortDescriptor, predicateType: String, @ViewBuilder content: @escaping (T) -> Content) {
    fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [sortDescriptor], predicate: NSPredicate(format: "%K \(predicateType) %@", filterKey, filterValue))
    self.sortDescriptor = sortDescriptor
    self.content = content
  }
}

