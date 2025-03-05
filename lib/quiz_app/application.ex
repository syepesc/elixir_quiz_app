defmodule QuizApp.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {QuizApp.Boundary.QuizManager, [name: QuizApp.Boundary.QuizManager]},
      {Registry, [name: QuizApp.Registry.QuizSession, keys: :unique]},
      {QuizApp.Boundary.Proctor, [name: QuizApp.Boundary.Proctor]},
      {DynamicSupervisor, [name: QuizApp.Supervisor.QuizSession, strategy: :one_for_one]}
    ]

    opts = [strategy: :one_for_one, name: QuizApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
