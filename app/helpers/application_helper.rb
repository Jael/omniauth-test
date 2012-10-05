module ApplicationHelper
  def mark_required(object, attribute)
    "*" if (object.class.validators_on(attribute).map(&:class).include? (ActiveModel::Validations::PresenceValidator)) || (object.class.validators_on(attribute).map(&:class).include? (ActiveModel::Validations::ConfirmationValidator))
      
  end
end
