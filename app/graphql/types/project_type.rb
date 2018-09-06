module Types
	ProjectType = GraphQL::ObjectType.define do
    name 'Project'
    description " A project"
    field :id, !types.ID
    field :title, !types.String do
      resolve ->(obj, args, ctx) {
        obj.user.email.split('@')[0] + '-' + obj.title
      }
    end
    field :user, !UserType do
      argument :id, !types.ID
    end
  end
end