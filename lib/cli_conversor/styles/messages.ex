defmodule CliConversor.Styles.Messages do
  alias CliConversor.Styles.Styles
  alias Mix.Shell.IO, as: Shell
  def greetings do
    Styles.text_action("Pressione ")
    <> Styles.text_hint("[ENTER]")
    <> Styles.text_action(" para continuar")
  end

  def welcome_message do
    IO.puts Styles.header_decoration(
      "==============================================================="
      )
    IO.puts Styles.header_decoration("=============~~~")
    <> Styles.header_text(" CONVERSOR DE MOEDAS E CRIPTOS ")
    <> Styles.header_decoration("~~~=============")
    IO.puts Styles.header_decoration(
      "==============================================================="
      )
    <> Styles.reset() <> ("\n")
    IO.puts Styles.text_default("Bem vindo!") <> Styles.reset() <> ("\n")
    IO.puts Styles.text_default("Para fazer uma conversão, basta pressionar ")
    <> Styles.text_hint("[ENTER]") <> Styles.text_default(" para continuar")
    <> Styles.reset() <> ("\n")
    IO.puts Styles.text_default("O histórico de consultas ficará disponível em um arquivo ")
    <> Styles.text_hint("TXT") <> ("\n")
    <> Styles.text_default("Você poderá consultá-lo após realizar a primeira conversão")
    <> Styles.reset() <> ("\n")
  end

  def message_ask_amount do
    Styles.text_action(" Informe o valor a ser convertido: ")
    <> Styles.reset() <> ("\n")
  end

  def display_options(index, option) do
    IO.puts Styles.text_menu_item("[#{index}]") <>
    Styles.text_default(" - #{option}") <>
    Styles.reset() <> ("\n")
  end

  def generate_question_message(opt) do
    Styles.text_default(opt) <> ("\n") <>
    Styles.reset() <> ("\n\n") <>
    Styles.text_action("Escolha pelo número da moeda:") <>
    Styles.reset()
  end

  def generate_question_menu_message(opt) do
    Styles.text_hint("Selecione uma opção:")
    <> Styles.reset <> ("\n") <>
    Styles.text_action("[#{opt}]")
    <> Styles.reset <> ("\n")
  end

  def menu_options_message do
    IO.puts Styles.header_decoration(
      "==============================================================="
      )
    IO.puts Styles.header_decoration("==========================~~~")
    <> Styles.header_text(" MENU ")
    <> Styles.header_decoration("~~~=========================")
    IO.puts Styles.header_decoration(
      "==============================================================="
      )
    <> Styles.reset() <> ("\n")
  end

  def display_invalid_option do
    Shell.cmd("clear")
    IO.puts Styles.red("OPÇÃO INVÁLIDA!") <> Styles.reset() <> ("\n")
    Shell.prompt Styles.text_action("Presione [ENTER] para continuar")
    Shell.cmd("clear")
  end

  def exit_message do
    Shell.cmd("clear")
    IO.puts Styles.text_default("Obrigado por usar este conversor!")
    IO.puts Styles.text_default("Até a proxima...")
    System.halt()
  end

  def start_message do
    Shell.cmd("clear")
    IO.puts Styles.header_decoration("
    ==============================================================="
    )
    IO.puts Styles.header_decoration("====================~~~")
    <> Styles.header_text(" LISTA DE MOEDAS ")
    <> Styles.header_decoration("~~~====================")
    IO.puts Styles.header_decoration("
    ==============================================================="
    ) <> Styles.reset() <> ("\n")
  end

  def confirm_currency_message(chosen_currency) do
    Shell.cmd("clear")
    IO.puts Styles.text_coin(" Moeda Selecionada: ")
    <> Styles.reset() <> (" ")
    <> Styles.text_selected_coin(" " <> chosen_currency.name <> " ")
    <> Styles.reset() <> ("\n")
  end

  def handle_message_currency() do
    String.upcase(
      IO.gets Styles.text_action(" Confirmar? ") <> Styles.reset() <> (" ") <>
      Styles.green("[S]") <> Styles.reset() <> (" ") <>
        Styles.red("[N]") <> Styles.reset <> ("\n")
      )
  end

  def invalid_response() do
    IO.puts Styles.red("OPÇÃO INVÁLIDA!") <> Styles.reset() <> ("\n")
    Shell.prompt Styles.text_action("Presione [ENTER] para continuar")
  end

  def converted_currency_output(amount, int_struct, converted) do
    output =
    Styles.yellow("#{amount} ") <>
      Styles.text_coin(" #{int_struct.name_currency_from} ") <>
      Styles.text_default(" é equivalente a ") <>
      Styles.yellow("#{converted} ") <>
      Styles.text_coin(" #{int_struct.name_currency_to} " ) <>
      Styles.reset() <> ("\n")
      Shell.info(output)
      output
  end

  def converted_currency_decoration() do
    IO.puts Styles.header_decoration(
      "==============================================================="
      )
    IO.puts Styles.header_decoration("=======================~~~")
    <> Styles.header_text(" RESULTADO ")
    <> Styles.header_decoration("~~~=======================")
    IO.puts Styles.header_decoration(
      "==============================================================="
      ) <> Styles.reset() <> ("\n")
  end
end
