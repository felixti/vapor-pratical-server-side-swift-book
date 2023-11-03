import Vapor
import SwiftHtml

public protocol TemplateRepresentable {
    
    @TagBuilder
    func render(_ req: Request) -> Tag
}
