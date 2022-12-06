# Separate the model in 4 distinct files with 4 distinct responsabilities

`Relation` : Contains logic for making database queries
`Repository` : Talks to relation, asks it to do the queries on the database
`Model` : A bare-bones representation of Projects::Project records within our application, which uses ROM::Struct, accentuated with some hand-picked pieces of ActiveModel
`Types`: A file that defines some basic types from dry-types for our applicaiton, and provides a home for future definitions if we need them
