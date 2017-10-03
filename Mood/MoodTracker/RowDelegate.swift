//
//  RowDelegate.swift
//  MoodTracker
//
//  Created by Sunny Ouyang on 10/3/17.
//  Copyright © 2017 Sunny Ouyang. All rights reserved.
//

import Foundation

protocol rowDelegate {
    func sendRow(row: Int, person: Person)
}
