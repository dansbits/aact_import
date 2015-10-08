require "sequel"
require "yaml"


db_config = YAML.load_file("database.yml")
DB = Sequel.connect(db_config)

require_relative "models"
require_relative "csv_processor"
