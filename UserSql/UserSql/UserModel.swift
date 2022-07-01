//
//  UserModel.swift
//  UserSql
//
//  Created by Stefano  on 01/07/22.
//

import Foundation

import Foundation



class UserModel: Identifiable {
    public var id: Int64 = 0
    public var name: String = ""
    public var email: String = ""
    public var age: Int64 = 0
    public var note: String = ""
}
