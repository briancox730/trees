class ContactsController < ApplicationController
  before_filter :authenticate_lot!, except: [:faq]

  def index
    @contacts = Contact.where(read: false)
    @read = Contact.where(read: true)
  end

  def create
    @contact = Contact.new(contacts_params)

    if @contact.save
      render json: @contact
    else
      render json: { errors: @contact.errors.full_messages }, :status => 422
    end
  end

  def read
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(read: true)
      flash[:notice] = 'Messaged Updated!'
      redirect_to contacts_path
    else
      flash[:notice] = 'Message update failed!'
      redirect_to contacts_path
    end
  end

  def unread
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(read: false)
      flash[:notice] = 'Messaged Updated!'
      redirect_to contacts_path
    else
      flash[:notice] = 'Message update failed!'
      redirect_to contacts_path
    end
  end

  def contacts_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
