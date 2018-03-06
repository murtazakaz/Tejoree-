//
//  ViewController.swift
//  Tejoree
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
//akseer model


class ViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if (navigationController?.topViewController != self) {
            navigationController?.navigationBar.isHidden = false
        }
        super.viewWillDisappear(animated)
    }
    
    //HIDE KEYBOARD
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return (true)
    }*/

}
// To parse the JSON, add this file to your project and do:
//
//   guard let akseer = try Akseer(json) else { ... }

import Foundation

class Akseer: Codable {
    let data: akseerData
    let isLogin: Bool
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case isLogin = "is_login"
    }
    
    init(data: akseerData, isLogin: Bool) {
        self.data = data
        self.isLogin = isLogin
    }
}

class akseerData: Codable {
    let categories: [Category_Akseer]
    let insight: [Insight]
    let researchCoverage: [JSONAny]
    let stockRating: StockRating
    let highConvictionPortfolio: HighConvictionPortfolio
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
        case insight = "insight"
        case researchCoverage = "research-coverage"
        case stockRating = "stock-rating"
        case highConvictionPortfolio = "high-conviction-portfolio"
    }
    
    init(categories: [Category_Akseer], insight: [Insight], researchCoverage: [JSONAny], stockRating: StockRating, highConvictionPortfolio: HighConvictionPortfolio) {
        self.categories = categories
        self.insight = insight
        self.researchCoverage = researchCoverage
        self.stockRating = stockRating
        self.highConvictionPortfolio = highConvictionPortfolio
    }
}

class Category_Akseer: Codable {
    let categoryID: String
    let categoryName: String
    let categoryImage: JSONNull?
    let categoryTypeID: String
    let slug: String
    let isPremium: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case categoryName = "category_name"
        case categoryImage = "category_image"
        case categoryTypeID = "category_type_id"
        case slug = "slug"
        case isPremium = "is_premium"
    }
    
    init(categoryID: String, categoryName: String, categoryImage: JSONNull?, categoryTypeID: String, slug: String, isPremium: String) {
        self.categoryID = categoryID
        self.categoryName = categoryName
        self.categoryImage = categoryImage
        self.categoryTypeID = categoryTypeID
        self.slug = slug
        self.isPremium = isPremium
    }
}

class HighConvictionPortfolio: Codable {
    let hcp: [Hcp]
    let performanceReview: PerformanceReview
    let additionDeletion: AdditionDeletion
    
    enum CodingKeys: String, CodingKey {
        case hcp = "hcp"
        case performanceReview = "performance_review"
        case additionDeletion = "addition_deletion"
    }
    
    init(hcp: [Hcp], performanceReview: PerformanceReview, additionDeletion: AdditionDeletion) {
        self.hcp = hcp
        self.performanceReview = performanceReview
        self.additionDeletion = additionDeletion
    }
}

class AdditionDeletion: Codable {
    let date: String
    let data: [AdditionDeletionDatum]
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case data = "data"
    }
    
    init(date: String, data: [AdditionDeletionDatum]) {
        self.date = date
        self.data = data
    }
}

class AdditionDeletionDatum: Codable {
    let symbol: String
    let isActive: Bool
    
    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case isActive = "is_active"
    }
    
    init(symbol: String, isActive: Bool) {
        self.symbol = symbol
        self.isActive = isActive
    }
}

class Hcp: Codable {
    let id: String
    let symbol: String
    let entryPrice: String
    let lastPrice: String
    let allocation: String
    let returnToDate: String
    let researchLink: String
    let uploadDatetime: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case entryPrice = "entry_price"
        case lastPrice = "last_price"
        case allocation = "allocation"
        case returnToDate = "return_to_date"
        case researchLink = "research_link"
        case uploadDatetime = "upload_datetime"
    }
    
    init(id: String, symbol: String, entryPrice: String, lastPrice: String, allocation: String, returnToDate: String, researchLink: String, uploadDatetime: String) {
        self.id = id
        self.symbol = symbol
        self.entryPrice = entryPrice
        self.lastPrice = lastPrice
        self.allocation = allocation
        self.returnToDate = returnToDate
        self.researchLink = researchLink
        self.uploadDatetime = uploadDatetime
    }
}

class PerformanceReview: Codable {
    let id: String
    let date: String
    let currentValue: String
    let beginingValue: String
    let data: [[PerformanceReviewDatum]]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case date = "date"
        case currentValue = "current_value"
        case beginingValue = "begining_value"
        case data = "data"
    }
    
    init(id: String, date: String, currentValue: String, beginingValue: String, data: [[PerformanceReviewDatum]]) {
        self.id = id
        self.date = date
        self.currentValue = currentValue
        self.beginingValue = beginingValue
        self.data = data
    }
}

class PerformanceReviewDatum: Codable {
    let returnAnalysis: String
    let portfolio: String
    let kse100: String
    
    enum CodingKeys: String, CodingKey {
        case returnAnalysis = "return_analysis"
        case portfolio = "portfolio"
        case kse100 = "kse-100"
    }
    
    init(returnAnalysis: String, portfolio: String, kse100: String) {
        self.returnAnalysis = returnAnalysis
        self.portfolio = portfolio
        self.kse100 = kse100
    }
}

class Insight: Codable {
    let id: String
    let title: String
    let description: String
    let categoryName: String
    let postDatetime: String
    let author: String
    let postImage: String
    let impact: String
    let descriptionHTML: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case categoryName = "category_name"
        case postDatetime = "post_datetime"
        case author = "author"
        case postImage = "post_image"
        case impact = "impact"
        case descriptionHTML = "description_html"
    }
    
    init(id: String, title: String, description: String, categoryName: String, postDatetime: String, author: String, postImage: String, impact: String, descriptionHTML: String) {
        self.id = id
        self.title = title
        self.description = description
        self.categoryName = categoryName
        self.postDatetime = postDatetime
        self.author = author
        self.postImage = postImage
        self.impact = impact
        self.descriptionHTML = descriptionHTML
    }
}

class StockRating: Codable {
    let symbol: String
    let yearEnd: String
    let price: String
    let target: String
    let upside: String
    let categoryData: CategoryData
    
    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case yearEnd = "year_end"
        case price = "price"
        case target = "target"
        case upside = "upside"
        case categoryData = "category_data"
    }
    
    init(symbol: String, yearEnd: String, price: String, target: String, upside: String, categoryData: CategoryData) {
        self.symbol = symbol
        self.yearEnd = yearEnd
        self.price = price
        self.target = target
        self.upside = upside
        self.categoryData = categoryData
    }
}

class CategoryData: Codable {
    let eps: [Bvp]
    let dps: [Bvp]
    let per: [Bvp]
    let divYield: [Bvp]
    let bvps: [Bvp]
    
    enum CodingKeys: String, CodingKey {
        case eps = "eps"
        case dps = "dps"
        case per = "per"
        case divYield = "div yield"
        case bvps = "bvps"
    }
    
    init(eps: [Bvp], dps: [Bvp], per: [Bvp], divYield: [Bvp], bvps: [Bvp]) {
        self.eps = eps
        self.dps = dps
        self.per = per
        self.divYield = divYield
        self.bvps = bvps
    }
}

class Bvp: Codable {
    let the2016: String?
    let the2017: String?
    let the2018: String?
    
    enum CodingKeys: String, CodingKey {
        case the2016 = "2016"
        case the2017 = "2017"
        case the2018 = "2018"
    }
    
    init(the2016: String?, the2017: String?, the2018: String?) {
        self.the2016 = the2016
        self.the2017 = the2017
        self.the2018 = the2018
    }
}

// MARK: Convenience initializers

extension Akseer {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Akseer.self, from: data)
        self.init(data: me.data, isLogin: me.isLogin)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension akseerData {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(akseerData.self, from: data)
        self.init(categories: me.categories, insight: me.insight, researchCoverage: me.researchCoverage, stockRating: me.stockRating, highConvictionPortfolio: me.highConvictionPortfolio)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension Category_Akseer {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Category_Akseer.self, from: data)
        self.init(categoryID: me.categoryID, categoryName: me.categoryName, categoryImage: me.categoryImage, categoryTypeID: me.categoryTypeID, slug: me.slug, isPremium: me.isPremium)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension HighConvictionPortfolio {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(HighConvictionPortfolio.self, from: data)
        self.init(hcp: me.hcp, performanceReview: me.performanceReview, additionDeletion: me.additionDeletion)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension AdditionDeletion {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(AdditionDeletion.self, from: data)
        self.init(date: me.date, data: me.data)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension AdditionDeletionDatum {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(AdditionDeletionDatum.self, from: data)
        self.init(symbol: me.symbol, isActive: me.isActive)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension Hcp {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Hcp.self, from: data)
        self.init(id: me.id, symbol: me.symbol, entryPrice: me.entryPrice, lastPrice: me.lastPrice, allocation: me.allocation, returnToDate: me.returnToDate, researchLink: me.researchLink, uploadDatetime: me.uploadDatetime)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension PerformanceReview {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(PerformanceReview.self, from: data)
        self.init(id: me.id, date: me.date, currentValue: me.currentValue, beginingValue: me.beginingValue, data: me.data)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension PerformanceReviewDatum {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(PerformanceReviewDatum.self, from: data)
        self.init(returnAnalysis: me.returnAnalysis, portfolio: me.portfolio, kse100: me.kse100)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension Insight {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Insight.self, from: data)
        self.init(id: me.id, title: me.title, description: me.description, categoryName: me.categoryName, postDatetime: me.postDatetime, author: me.author, postImage: me.postImage, impact: me.impact, descriptionHTML: me.descriptionHTML)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension StockRating {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(StockRating.self, from: data)
        self.init(symbol: me.symbol, yearEnd: me.yearEnd, price: me.price, target: me.target, upside: me.upside, categoryData: me.categoryData)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension CategoryData {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(CategoryData.self, from: data)
        self.init(eps: me.eps, dps: me.dps, per: me.per, divYield: me.divYield, bvps: me.bvps)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension Bvp {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Bvp.self, from: data)
        self.init(the2016: me.the2016, the2017: me.the2017, the2018: me.the2018)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    public let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}




