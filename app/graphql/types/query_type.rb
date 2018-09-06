Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :me, Types::UserType do
    description "the current user"
    resolve ->(obj, args, ctx) {
      ctx[:current_user]
    }
  end
  field :projects, types[Types::ProjectType] do
    description "the current user all projects"
    resolve ->(obj, args, ctx) {
      ctx[:current_user].projects
    }
  end
end
