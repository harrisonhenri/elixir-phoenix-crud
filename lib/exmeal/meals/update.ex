defmodule Exmeal.Meals.Update do
  alias Exmeal.{Repo, Meal, Error}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil ->
        {:error, Error.build_meal_not_found()}

      meal ->
        meal
        |> Meal.changeset(params)
        |> Repo.update()
    end
  end
end
