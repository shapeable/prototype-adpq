module JsonResponses
  def generate_error(message)
    {
      data:{
        answer:{
          status: :error,
          message: message
        }
      }
    }.to_json
  end
  
  def generate_success(values)
     values.to_json
  end

end