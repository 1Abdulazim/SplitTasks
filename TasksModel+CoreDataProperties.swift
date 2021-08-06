//
//  TasksModel+CoreDataProperties.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//
//

import Foundation
import CoreData


extension TasksModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TasksModel> {
        return NSFetchRequest<TasksModel>(entityName: "TasksModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var status: String?
    @NSManaged public var data: Date?

}

extension TasksModel : Identifiable {

}
