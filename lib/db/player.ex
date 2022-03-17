defmodule EbonRoot.Schema.Db.Player do
  use EbonRoot.Schema.Ecto

  @timestamps_opts [type: :utc_datetime]
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  defenum(GameMode, survival: 0, creative: 1, hardcore: 2, adventure: 3)

  schema "players" do
    field(:gamemode, GameMode, default: :survival)
    field(:name, :string)
    field(:last_seen, :datetime)
    has_many(:carried, InvItem)
    has_many(:worn, InvItem)
    has_many(:hotbar, InvItem)
    # double money = 8;
    has_many(:homes, Location)
    has_many(:beds, Location)
    has_many(:effects, Effect)
    # levels:
    field(:health_total, :integer)
    field(:health_scale, :integer)
    field(:health_max, :integer)
    field(:health_max, :integer)
    field(:food, :integer)
    field(:air_total, :integer)
    field(:air_max, :integer)
    # lands? ~ claims
    has_many(:lands, Land)
    has_many(:perms)
    # settings
    # timestamps
    # warps?
    # group_perms perms
    # repeated GroupPerms
    # map<string, Perm> perms = X;
    # field(:props, :map, default: %{})
  end

  schema "inv_items" do
    field(:item, :string)
    field(:position, :integer)
    field(:quantity, :integer)
  end

  schema "lands" do
    field(:name, :string)
    field(:world_id, references(:worlds))
  end

  schema "locations" do
    field(:world_id, references(:worlds))
    field(:x, :float)
    field(:y, :float)
    field(:z, :float)
    field(:yaw, :float)
    field(:pitch, :float)
    field(:name, :string)
  end

  schema "worlds" do
    field(:server_id, :string)
    field(:name, :string)
  end

  schema "banks" do
  end

  schema "bank_ledgers" do
  end

  schema "shops" do
  end

  @fields [:id]

  # assume data came in already crafted properly, just convert, so no validation
  def build(attrs \\ %{}) do
    %__MODULE__{}
    |> cast(attrs, @fields)
  end

  def changeset(item, attrs) do
    item
    |> cast(attrs, @fields)
  end
end
