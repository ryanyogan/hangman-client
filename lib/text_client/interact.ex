defmodule TextClient.Interact do
  alias TextClient.{GameState, Player}

  def start() do
    Hangman.new_game()
    |> init_state()
    |> Player.play()
  end

  defp init_state(game) do
    %GameState{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end
end
