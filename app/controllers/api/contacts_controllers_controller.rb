class Api::ContactsControllersController < ApplicationController

  def contacts
    @contact_1 = Contact.first
    render 'contactyay.json.jb'
  end
end
