defmodule Wabanex.Users.Get do
  alias Ecto.UUID
  alias Wabanex.{Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid UUID"}
      uuid -> uuid |> get_user()
    end
  end

  defp get_user({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
