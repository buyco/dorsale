class Dorsale::ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Agilibox::ActiveRecordUUIDConcern
  include Agilibox::DefaultValuesConcern
  include Agilibox::ModelToS
  include Agilibox::ModelI18n
  include Agilibox::PolymorphicId

  nilify_blanks

  def self.last_created
    reorder(:created_at, :id).last
  end
end