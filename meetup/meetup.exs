defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday
  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    date_range = date_range(year, month, schedule)

    weekday_number = weekday_number(weekday)

    hd (for date <- date_range, :calendar.day_of_the_week(year, month, date) == weekday_number, do: {year, month, date})
  end

    # assert Meetup.meetup(2013, 7, :wednesday, :first) == {2013, 7, 3}
  defp date_range(year, month, schedule) do
    case schedule do
      :first   -> 1..7
      :second  -> 8..14
      :third   -> 15..21
      :fourth  -> 22..28
      :last    -> (:calendar.last_day_of_the_month(year, month) - 6)..(:calendar.last_day_of_the_month(year, month))
      :teenth  -> 13..19
    end
  end

  defp weekday_number(:monday),    do: 1
  defp weekday_number(:tuesday),   do: 2
  defp weekday_number(:wednesday), do: 3
  defp weekday_number(:thursday),  do: 4
  defp weekday_number(:friday),    do: 5
  defp weekday_number(:saturday),  do: 6
  defp weekday_number(:sunday),    do: 7
end