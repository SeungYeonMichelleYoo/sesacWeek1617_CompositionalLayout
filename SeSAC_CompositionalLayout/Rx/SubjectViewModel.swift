//
//  SubjectViewModel.swift
//  SeSAC_CompositionalLayout
//
//  Created by SeungYeon Yoo on 2022/10/25.
//

import Foundation
import RxSwift

struct Contact {
    var name: String
    var age: Int
    var number: String
    
}

class SubjectViewModel {
    
    var contactData = [
        Contact(name: "Jack", age: 21, number: "01012341234"),
        Contact(name: "Metaverse Jack", age: 23, number: "01023452345"),
        Contact(name: "Real Jack", age: 25, number: "01056785678")
    ]
    
    var list = PublishSubject<[Contact]>()
    
    func fetchData() {
        list.onNext(contactData)
    }
    
    func resetData() {
        list.onNext([])
    }
    
    func newData() {
        let new = Contact(name: "고래밥", age: Int.random(in: 10...50), number: "")
        contactData.append(new)
        
        list.onNext(contactData)
    }
    
    func filterData(query: String) {
        let result = query != "" ? contactData.filter { $0.name.contains(query) } : contactData
        list.onNext(result)
        
    }
    
}
