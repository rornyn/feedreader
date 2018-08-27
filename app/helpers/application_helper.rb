module ApplicationHelper

  def error_message(object, field_name)
    object.errors.full_messages_for(field_name).to_sentence
  end
end
