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

    date_day_tuple = Enum.map(date_range, fn(date) ->
      {date, :calendar.day_of_the_week(year, month, date)}
    end)
    {actual_date, weekday_number} = List.keyfind(date_day_tuple, weekday_number, 1)
    {year, month, actual_date}
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

  defp weekday_number(weekday) do
    case weekday do
      :monday    -> 1
      :tuesday   -> 2
      :wednesday -> 3
      :thursday  -> 4
      :friday    -> 5
      :saturday  -> 6
      :sunday    -> 7
    end
  end
end
