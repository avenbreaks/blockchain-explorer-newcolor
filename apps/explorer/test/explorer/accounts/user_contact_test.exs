defmodule Explorer.Accounts.UserContactTest do
  use Explorer.DataCase

  alias Explorer.Accounts.UserContact

  describe "changeset/2" do
    test "formats an email address" do
      expected = "dev-cosmware@gitshock.com"
      changeset = UserContact.changeset(%UserContact{}, %{email: " dev-cosmware@gitshock.com    "})
      assert changeset.valid?
      assert changeset.changes.email == expected
    end

    test "requires an email" do
      changeset = UserContact.changeset(%UserContact{}, %{})
      refute changeset.valid?
      errors = changeset_errors(changeset)
      Enum.at(errors.email, 0) =~ "blank"
    end
  end
end
