alias Jaxie.Accounts.User
alias Jaxie.Repo

users = [
  %{email: "j.axie.university+0@gmail.com", role: "scholar", ronin_address: "22778cb41f1bb29d38cc5778aa1350ada387a210"},
  %{email: "j.axie.university+1@gmail.com", role: "scholar", ronin_address: "9dbf2ebff7da78bd4e29f500faac72dbeeda4a59"},
  %{email: "j.axie.university+2@gmail.com", role: "scholar", ronin_address: "f408fff1e314e2c8aacf8525fc44bba944400148"},
]

Enum.map(users, fn(user) ->
  user
  |> User.changeset()
  |> Repo.insert()
end)
