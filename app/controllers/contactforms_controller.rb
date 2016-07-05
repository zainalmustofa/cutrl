class ContactformsController < ApplicationController
  def new
    @contact = Contactform.new
  end

  def create
    @contact = Contactform.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def contactform_params
      params.require(:contactform).permit(:name, :email, :type, :message)
    end
end
