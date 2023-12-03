defmodule LibraryFees do
  import Bitwise

  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601(string) |> elem(1)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    cond do
      before_noon?(checkout_datetime) -> checkout_datetime |> NaiveDateTime.to_date |> Date.add(28)
      true -> checkout_datetime |> NaiveDateTime.to_date |> Date.add(29)
    end
  end

  def days_late(planned, actual) do
    case actual |> NaiveDateTime.to_date |> Date.compare(planned) do
      :eq -> 0
      :gt -> NaiveDateTime.to_date(actual) |> Date.diff(planned) |> abs
      :lt -> 0
    end
  end

  def monday?(datetime) do
    cond do
      NaiveDateTime.to_date(datetime) |> Date.day_of_week == 1 -> true
      true -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    due = datetime_from_string(checkout) |> return_date
    rtn = datetime_from_string(return)

    cond do
      monday?(rtn) -> days_late(due, rtn) * rate >>> 1
      true -> rate * days_late(due, rtn)
    end
  end
end
