defmodule CliConversor.Validations.HandleAnswer do
  import CliConversor.CLI.BaseCommands
  import CliConversor.Styles.Messages
  alias CliConversor.CLI.CurrencyChoice


  @spec validate_option(binary) :: :ok
  def validate_option(answer_to_parse) do

    answer = Integer.parse(answer_to_parse)

    case answer do
      :error ->
        display_invalid_option()
        menu_options()
      {option, _} ->
        CliConversor.CLI.Main.handle_answer(option - 1)
    end

  end

  def validate_currency_answer(interaction, parsed_answer, total_list) do

    find_currency_by_index = &Enum.at(total_list, &1)

    case parsed_answer do
      :error ->
        display_invalid_option()
        CurrencyChoice.start()
      {option, _} ->
        if option > Enum.count(total_list) do
          display_invalid_option()
          CurrencyChoice.start()
        else
          find_currency_by_index.(option - 1)
          |> CurrencyChoice.confirm_currency(interaction)
        end
    end
  end

end
