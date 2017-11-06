defmodule FakeServer.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(FakeServer.Agents.ServerAgent, []),
      worker(FakeServer.Agents.EnvAgent, [])
    ]

    opts = [strategy: :one_for_one, name: FakeServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end