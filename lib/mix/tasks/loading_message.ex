defmodule Mix.Tasks.LoadingMessage do
  @spec get_message :: :ok
  def get_message do
    IO.write "Loading"
    Process.sleep(700)
    IO.write "."
    Process.sleep(700)
    IO.write "."
    Process.sleep(700)
    IO.write "."
  end
end
