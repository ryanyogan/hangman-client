defmodule TextClient.Mover do
  alias TextClient.GameState

  def make_move(game) do
    {gs, tally} = Hangman.make_move(game.game_service, game.guess)

    %GameState{
      game
      | game_service: gs,
        tally: tally
    }
  end
end
