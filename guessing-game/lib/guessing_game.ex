defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(_secret_number, :no_guess), do: "Make a guess"
  def compare(_secret_number = n, _guess = n), do: "Correct"
  def compare(secret_number, guess) when guess - secret_number |> abs === 1, do: "So close"
  def compare(secret_number, guess) when guess - secret_number > 1, do: "Too high"
  def compare(secret_number, guess) when guess - secret_number < 1, do: "Too low"
end
