/*import Vapor
import SwiftHtml

struct MyTemplate: TemplateRepresentable {
    let title: String
    
    func render(_ req: Request) -> Tag {
        Html {
            Head {
                Title(title)
            }
            Body {
                H1(title)
            }
        }
    }
}

func routes(_ app: Application) throws {
    app.get { req -> Response in
        req.templates.renderHtml(
            WebIndexTemplate(
                WebIndexContext(title: "Home")
            ) {
                P("Hi there, welcome to my page!")
            }
        )
    }

    app.get("hello") { req -> Response in
        req.templates.renderHtml(
            MyTemplate(title: "Hello, Brazil!")
        )
    }
}
*/
