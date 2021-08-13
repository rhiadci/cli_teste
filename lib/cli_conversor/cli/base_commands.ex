defmodule CliConversor.CLI.BaseCommands do
  import CliConversor.Styles.Messages
  alias CliConversor.Validations.HandleAnswer
  alias Mix.Shell.IO, as: Shell


  @spec display_options(any) :: any
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      display_options(index, option)
    end)
    options
  end

  @spec generate_question(any) :: <<_::64, _::_*8>>
  def generate_question(options) do
    opt = options
    |> Enum.with_index(1)
    |> Enum.map(fn {[id, name], index} -> [index, id, name] end)
    |> Enum.map(fn g-> Enum.join(g, " - ") end)
    |> Enum.join("\n ")

    generate_question_message(opt)
  end

  def generate_question_menu(options) do
    opt = options
    |> Enum.with_index(1)
    |> Enum.map(fn {_c,b} -> [b] end)
    |> Enum.map(fn g-> Enum.join(g, ", ") end)
    |> Enum.join(", ")

    generate_question_menu_message(opt)
  end

  def menu_options do
    menu_options_message()

    ["Make another conversion", "Swap values", "View history", "Exit"]
    |> display_options()
    |> generate_question_menu()
    |> Shell.prompt
    |> HandleAnswer.validate_option()

  end


  def get_time_now do
    date_now = NaiveDateTime.utc_now
    string_date = "#{date_now.day}/#{date_now.month}/#{date_now.year} - "
    string_time = "#{date_now.hour}:#{date_now.minute}:#{date_now.second} - "
    string_date_time = string_date <> string_time
    string_date_time
  end

end
