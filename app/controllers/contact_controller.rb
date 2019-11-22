# frozen_string_literal: true

class ContactController < ApplicationController
  def index
    @contact = Contact.all
  end
end
