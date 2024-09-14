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

Configure database in config for server this is integrated in
```elixir
config :data_module_design, DataModuleDesign.Repo,
  url: database_url,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

Set project path (which should match dependency path), get dependencies, and run migrations

```bash
export DATAMODULEDESIGNPATH='./data_module_design'
mix deps.get
mix ecto.migrate --migrations-path $DATAMODULEDESIGNPATH/priv/repo/migrations
```

Add routes to server this project is integrated with to existing routes
```elixir
  scope "/people", DataModuleDesignWeb do
    pipe_through :browser

    live "/", PersonLive.Index, :index
    live "/new", PersonLive.Index, :new
    live "/:id/edit", PersonLive.Index, :edit

    live "/:id", PersonLive.Show, :show
    live "/:id/show/edit", PersonLive.Show, :edit
  end
```
