# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    @about = About.all
  end
end
