# DataModuleDesign

## Data Modeling and Design
There are two representations of a Person to support an edititng state and fully validated.
- Editing: Various fields may be in an incomplete or invalid state while a person is in the process of being edited.
- Validated / Fully Formed: This model will be consumed by the rest of the application and should make impossible states unrepresentable, act as proof that the model has passed certain validations, and assist users of the model by preventing structural mistakes, enforcing semantics, and simplifying use.  Available fields are:
  - First Name
  - Last Name
  - Social Security Number
  - Marital Status
  - US Phone Number

This project demonstrates this by using a **Form** and **Module/Struct**

Consider data integrity, usage ergonomics, transparency of the Api, and any other quality measures you generally value.

You should design the validated Person based upon your own personal experience.

## Installation

Add this project to the local directory (ie `git clone https://github.com/chrismd2/data_module_design.git`) and the package can be installed
by adding `data_module_design` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:data_module_design, "~> 0.1.0", path: "./data_module_design"}
  ]
end
```

Set project path (which should match dependency path), get dependencies, and run migrations

```bash
export DATAMODULEDESIGNPATH='./data_module_design'
mix deps.get
mix ecto.migrate --migrations-path $DATAMODULEDESIGNPATH/priv/repo/migrations
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/data_module_design>.

