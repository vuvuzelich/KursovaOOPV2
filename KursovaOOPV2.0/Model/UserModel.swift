//
//  UserModel.swift
//  KursovaOOPV2.0
//
//  Created by Макс Лахман on 06.03.2024.
//

import Foundation

struct UserModel {
    var image : String = "3dPerson"
    var userName : String = "Max"
}


class UserViewModel: ObservableObject {
    @Published var user: UserModel = UserModel()
}


