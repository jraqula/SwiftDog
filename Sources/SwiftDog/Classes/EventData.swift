//
//  EventData.swift
//  SwiftDog
//
//  Created by jacob.aronoff on 5/18/18.
//

import Foundation

public struct EventData: DataType {
    private enum CodingKeys: String, CodingKey {
        case host, tags, title, text, date_happened, priority, alert_type, aggregation_key, source_type_name
    }
    public enum EventPriority: String {
        case normal, low
    }
    public enum AlertType: String {
        case error, warning, info, success
    }
    public var host: String?
    public var tags: [String]
    public var title: String
    public var text: String
    public var date_happened: Int
    public var priority: EventPriority
    public var alert_type: AlertType
    public var aggregation_key: String?
    public var source_type_name: String?
    
    public init(host: String?, tags:[String], title: String, text: String, date_happened: Int, priority: EventPriority, alert_type: AlertType, aggregation_key: String?, source_type_name: String?) {
        self.host = host
        self.tags = tags
        self.title = title
        self.text = text
        self.date_happened = date_happened
        self.priority = priority
        self.alert_type = alert_type
        self.aggregation_key = aggregation_key
        self.source_type_name = source_type_name
    }
    
    public func encode(to encoder: Encoder) throws {
        var event_data = encoder.container(keyedBy: EventData.CodingKeys.self)
        try event_data.encodeIfPresent(self.host, forKey: .host)
        try event_data.encodeIfPresent(self.tags.count == 0 ? nil : self.tags, forKey: .tags)
        try event_data.encode(self.title, forKey: .title)
        try event_data.encode(self.text, forKey: .text)
        try event_data.encode(self.date_happened, forKey: .date_happened)
        try event_data.encode(self.priority.rawValue, forKey: CodingKeys.priority)
        try event_data.encode(self.alert_type.rawValue, forKey: CodingKeys.alert_type)
        try event_data.encodeIfPresent(self.aggregation_key, forKey: .aggregation_key)
        try event_data.encodeIfPresent(self.source_type_name, forKey: .source_type_name)
    }
}
