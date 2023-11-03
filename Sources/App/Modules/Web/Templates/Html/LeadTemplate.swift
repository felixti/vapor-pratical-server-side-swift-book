import Vapor
import SwiftHtml

struct LeadTemplate: TemplateRepresentable {
    
    var title: String
    var message: String
    
    init(
        _ title: String,
        _ message: String
    ) {
        self.title = title
        self.message = message
    }
    
    @TagBuilder
    func render(_ req: Request) -> Tag {
        Div {
            Section {
                H1(title)
                P(message)
            }
            .class("lead")
        }
        .id("home")
        .class("container")
    }
}
