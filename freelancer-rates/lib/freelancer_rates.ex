defmodule FreelancerRates do
  @hours_worked_per_day 8.0
  @days_worked_per_month 22

  @spec daily_rate(number) :: float
  def daily_rate(hourly_rate), do: @hours_worked_per_day * hourly_rate

  @spec apply_discount(number, number) :: float
  def apply_discount(before_discount, discount), do: before_discount * percent_of_whole(discount)

  @spec monthly_rate(number, number) :: integer
  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
      |> apply_discount(discount)
      |> monthly_rate
      |> ceil
  end

  @spec days_in_budget(number, float, number) :: float
  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate(hourly_rate)
      |> apply_discount(discount)
      |> days_in_budget(budget)
      |> Float.floor(1)
  end

  defp percent_of_whole(discount_by), do: (100 - discount_by) / 100
  defp days_in_budget(daily_rate, budget), do: budget / daily_rate
  defp monthly_rate(daily_rate), do: daily_rate * @days_worked_per_month
end
