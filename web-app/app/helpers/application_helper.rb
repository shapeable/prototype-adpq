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
end
