//
//  Extensions.swift
//  TheMovieDB
//
//  Created by Tiago Chaves on 04/10/18.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func getDateFormatter(withFormat format:String) -> DateFormatter {
        
        self.dateFormat = format
        return self
    }
}
