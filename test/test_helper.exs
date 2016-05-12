ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Sipintar.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Sipintar.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Sipintar.Repo)

