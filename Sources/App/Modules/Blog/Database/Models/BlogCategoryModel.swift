import Vapor
import Fluent

final class BlogCategoryModel: Model {
    typealias Module = BlogModule
    
    static let identifier = "categories"
    
    static let schema = "blog_categories"
    
    struct FieldKeys {
        struct v1 {
            static var title: FieldKey { "title" }
        }
    }
    
    @ID() var id: UUID?
    @Field(key: FieldKeys.v1.title) var title: String
    @Children(for: \.$category) var post: [BlogPostModel]
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}