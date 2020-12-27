defmodule TextClient.Mover do
  alias TextClient.GameState

  def make_move(game) do
    tally = Hangman.make_move(game.game_service, game.guess)

    %GameState{
      game
      | tally: tally
    }
  end
end
