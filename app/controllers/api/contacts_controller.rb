class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    render 'show.json.jb'
  end

  def create
    the_id = params[:id]
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio]
    )
    if @contact.save
      render 'update.json.jb'
    else
      render 'errors.json.jb'
    end
    
  end

  def update
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.middle_name = params[:middle_name]
    @contact.bio = params[:bio]
    if @contact.save
      render 'update.json.jb'
    else
      render 'errors.json.jb'
    end
    
  end

  def destroy
    the_id = params[:id]
    contact = Contact.find_by(id: the_id)
    contact.destroy
    render 'destroy.json.jb'
  end

end
