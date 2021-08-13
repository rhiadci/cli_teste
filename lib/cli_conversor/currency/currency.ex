defmodule CliConversor.Currency do
  import CliConversor.Styles.Messages
  alias CliConversor.Interaction.InteractionAgent
  alias CliConversor.CLI.BaseCommands
  alias Mix.Shell.IO, as: Shell
  defstruct asset_id: nil,
            name: nil,
            type_is_crypto: 0,
            price_usd: nil

  def convert_values(amount) do
    int_struct = InteractionAgent.value
    converted = amount * (int_struct.currency_from_price / int_struct.currency_to_price) |> Float.floor(2)

    Shell.cmd("clear")
    converted_currency_decoration()
    converted_output = converted_currency_output(amount, int_struct, converted)
    log = "#{BaseCommands.get_time_now()}" <> converted_output
    CliConversor.File.FileActions.write_and_return(log)
    BaseCommands.menu_options()

  end

  def swap_values do
    int_struct = InteractionAgent.value
    currency_to = int_struct.currency_to_price
    currency_from = int_struct.currency_from_price
    name_currency_to = int_struct.name_currency_to
    name_currency_from = int_struct.name_currency_from

    int_struct = %{
      int_struct |
      currency_to_price: currency_from,
      currency_from_price: currency_to,
      name_currency_from: name_currency_to,
      name_currency_to: name_currency_from
    }

    InteractionAgent.add(int_struct)
    convert_values(int_struct.amount)
    BaseCommands.menu_options()
  end
end
