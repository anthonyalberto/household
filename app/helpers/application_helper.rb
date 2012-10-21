module ApplicationHelper
  def get_form_object_errors
    var = instance_variable_get("@#{params[:controller].split("/")[-1].singularize}")
    if var.nil?
      var = @error_object
    end
    return { } if var.nil?
    return var.errors
  end

  def sum_montants(array)
    sum = 0
    array.each do |a|
      sum += a.montant.to_f
    end
    sum
  end
end
