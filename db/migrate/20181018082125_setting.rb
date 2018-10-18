class Setting < ActiveRecord::Migration[5.0]
  def change
    %i[
      users
      dorsale_customer_vault_people
      dummy_models
      dorsale_addresses
      dorsale_alexandrie_attachment_types
      dorsale_alexandrie_attachments
      dorsale_comments
    ].each do |table|
      add_column table, :uuid, :uuid, null: false

      change_table table do |t|
        t.remove :id
        t.rename :uuid, :id
      end
      execute "ALTER TABLE #{table.to_s} ADD PRIMARY KEY (id);"
    end
  end
end
