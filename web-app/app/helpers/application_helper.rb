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
      I18n.locale == :en ?  ['English','Spanish'] : ['Ingles','Español']
  end

  def get_name(model)
    I18n.locale == :en ?  model.name : model.name_es
  end

  def get_dasboard
    session['dashboard'] ||= 'overview'
  end

  def get_dashboard_dates
    I18n.locale == :en ?  ['Last Month','Current Month', '2 Months before'] : ['Último mes','Mes actual','2 Meses atras']
  end

  def get_dashboard_regions
    I18n.locale == :en ?  ['All Regions','North California', 'South California'] : ['Todas las regiones','Norte de California','Sur de California']
  end

  def get_dashboard_kpi
    I18n.locale == :en ? {'Users'=>'120,000', 'Users reached'=> '25%', 'Active events'=>'5'} : {'Usuarios'=>'120,000', 'Alcanzados'=> '25%', 'Eventos activos'=>'5'}
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
