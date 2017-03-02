module ApplicationHelper
  def form_errors_class(object)
    if object.send(:errors).present?
      "has-errors"
    end
  end

  def get_years
    (1930..Date.today.year).to_a.reverse
  end

  def get_lenguages
      ['English','Spanish']
  end

  def alert_class_for(flash_type)
  	case flash_type.to_sym
      when :success
        "flash-success"
      when :error
        "flash-error"
      when :alert
        "flash-notice"
      when :notice
        "flash-alert"
    else
        flash_type.to_s
    end
  end
end
