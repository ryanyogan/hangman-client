defmodule TextClient.Interact do
  alias TextClient.{GameState, Player}

  @hangman_server :hangman@orion
  def start() do
    new_game()
    |> init_state()
    |> Player.play()
  end

  defp init_state(game) do
    %GameState{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end

  defp new_game() do
    Node.connect(@hangman_server)

    :rpc.call(
      @hangman_server,
      Hangman,
      :new_game,
      []
    )
  end
end
