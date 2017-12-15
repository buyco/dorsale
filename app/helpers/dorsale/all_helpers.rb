module Dorsale::AllHelpers
  include ::ActionView::Helpers::NumberHelper
  include ::Agilibox::AllHelpers

  include ::Dorsale::ContextHelper

  include ::Dorsale::CommentsHelper
  include ::Dorsale::Alexandrie::AttachmentsHelper
  include ::Dorsale::UsersHelper

  extend self
end
