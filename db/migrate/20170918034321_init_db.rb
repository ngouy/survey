class InitDb < ActiveRecord::Migration[5.0]
  def up
    enable_extension "plpgsql"
    enable_extension 'uuid-ossp'
  end
end