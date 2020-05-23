//
//  Array+RemovingDuplicates.swift
//  Assignment8
//
//  Created by Aaron Chen on 2020-05-23.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
