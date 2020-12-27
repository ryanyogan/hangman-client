defmodule TextClient.Player do
  alias TextClient.{Prompter, GameState, Summary, Mover}

  def play(%GameState{tally: %{game_state: :won}}) do
    exit_with_message("You WON!")
  end

  def play(%GameState{tally: %{game_state: :lost}}) do
    exit_with_message("Sorry, you lost...")
  end

  def play(%GameState{tally: %{game_state: :good_guess}} = game) do
    continue_with_message(game, "Good guess!")
  end

  def play(%GameState{tally: %{game_state: :bad_guess}} = game) do
    continue_with_message(game, "Sorry, that letter is not in the word")
  end

  def play(%GameState{tally: %{game_state: :already_used}} = game) do
    continue_with_message(game, "You've already used that letter")
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end

  defp continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end
end
