defmodule CliConversor.CLI.Main do

  alias Mix.Shell.IO, as: Shell

  alias CliConversor.Interaction.InteractionAgent
  alias CliConversor.Interaction
  import CliConversor.CLI.BaseCommands
  import CliConversor.Styles.Messages

  @spec start_conversor :: :ok
  def start_conversor do
    Shell.cmd("clear")
    welcome_message()
    Shell.prompt("#{greetings()}")
    InteractionAgent.add(%CliConversor.Interaction{})
    currency_choice()
  end

  defp currency_choice do
    case CliConversor.CLI.CurrencyChoice.start() do
      :ok -> ask_for_amount_convert()
      :error -> start_conversor()
    end
  end

  defp ask_for_amount_convert do
    Shell.cmd("clear")
    answer =
      message_ask_amount()
      |> IO.gets
      |> Integer.parse()

    case answer do
      :error ->
        display_invalid_option()
        ask_for_amount_convert()
      {value, _} ->
        value_float = value / 1.0
        Interaction.add_amount_to_interaction(value_float)
        |> CliConversor.Currency.convert_values()
    end
  end


  @spec handle_answer(any) :: <<_::64, _::_*80>>
  def handle_answer(option) do
    case option do

      0 ->
        start_conversor()
      1 ->
        CliConversor.Currency.swap_values()
      2 ->
        Shell.cmd("clear")
        CliConversor.File.FileActions.get_history()
        menu_options()
      3 ->
        exit_message()
      _ ->
        display_invalid_option()
        menu_options()
    end
  end
end
