defmodule CliConversor.CLI.CurrencyChoice do
  alias Mix.Shell.IO, as: Shell
  alias CliConversor.Interaction.InteractionAgent
  alias CliConversor.Validations.HandleAnswer
  import CliConversor.CLI.BaseCommands
  import CliConversor.Styles.Messages
  alias CliConversor.Styles.Styles


  def start do
    start_message()
    total_list = CliConversor.Currency.CurrencyAgent.value

      total_list
    |> Enum.map(fn currency -> [currency.asset_id, currency.name] end)
    |> generate_question
    |> Shell.prompt
    |> parse_answer(total_list)
  end

  defp parse_answer(answer, total_list) do
    interaction = InteractionAgent.value
    parsed_answer = Integer.parse(answer)

    HandleAnswer.validate_currency_answer(
      interaction,
      parsed_answer,
      total_list
    )
  end

  def confirm_currency(chosen_currency, interaction) do
    #Shell.cmd("clear")
    #Shell.info("Selected currency: " <> chosen_currency.name)
    #if Shell.yes?("Confirm?"), do: modify_struct(chosen_currency, interaction), else: start()
    confirm_currency_message(chosen_currency)
    answer = handle_message_currency()
    case answer do
      "S\n" -> modify_struct(chosen_currency, interaction)
      "N\n" -> start()
        _   -> invalid_response()
               confirm_currency(chosen_currency, interaction)
    end
  end


  defp modify_struct(chosen_currency, %{currency_from: nil, name_currency_from: nil} = interaction) do
    %{
      interaction |
      currency_from: chosen_currency.asset_id,
      name_currency_from: chosen_currency.name,
      currency_from_price: chosen_currency.price_usd
    }
    |> CliConversor.Interaction.InteractionAgent.add |> select_currency_to()
  end

  defp modify_struct(chosen_currency, %{currency_to: nil, name_currency_to: nil} = interaction) do
    %{
      interaction |
      currency_to: chosen_currency.asset_id,
      name_currency_to: chosen_currency.name,
      currency_to_price: chosen_currency.price_usd
    }
    |> CliConversor.Interaction.InteractionAgent.add
  end

  defp select_currency_to(_interaction) do
    Shell.info("Please, select the currency you want to convert to.")
    start()
  end


end
