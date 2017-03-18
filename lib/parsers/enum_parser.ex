defmodule JS2E.Parsers.EnumParser do
  @moduledoc ~S"""
  Parse a JSON schema enum type:

      {
        "type": "string",
        "enum": ["none", "green", "orange", "blue", "yellow", "red"]
      }

  Into an `JS2E.Types.EnumType`.
  """

  require Logger
  alias JS2E.Parsers.Util
  alias JS2E.{TypePath, Types}
  alias JS2E.Types.EnumType

  @doc ~S"""
  Parses a JSON schema enum type into an `JS2E.Types.EnumType`.
  """
  @spec parse(map, URI.t, TypePath.t, String.t) :: Types.typeDictionary
  def parse(schema_node, id, path, name) do
    Logger.debug "parsing '#{path}' as enum"

    type = schema_node["type"]
    enum_values = schema_node["enum"]
    enum_type = %EnumType{name: name,
                          path: path,
                          type: type,
                          values: enum_values}

    Logger.debug "Parsed enum type: #{inspect enum_type}"

    enum_type
    |> Util.create_type_dict(path, id)
  end

end