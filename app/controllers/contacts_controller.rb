class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contacts_params)

    if @contact.save
      render json: @contact
    else
      render json: { errors: @contact.errors.full_messages }, :status => 422
    end
  end

  def contacts_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
