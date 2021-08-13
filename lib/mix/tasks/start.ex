defmodule Mix.Tasks.Start do
  use Mix.Task.Compiler

  def run(_) do
    Mix.Tasks.LoadingMessage.get_message()
    Mix.Task.run("app.start")
    CliConversor.CLI.Main.start_conversor
  end
end
