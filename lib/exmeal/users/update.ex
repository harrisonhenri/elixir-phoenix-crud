defmodule Exmeal.Users.Update do
  alias Exmeal.{Repo, User, Error}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil ->
        {:error, Error.build_user_not_found()}

      user ->
        user
        |> User.changeset(params)
        |> Repo.update()
    end
  end
end
