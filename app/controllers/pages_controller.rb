class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :frontend, :backend, :productmanager]

  def home
    @professions = Profession.all
  end

  def frontend
    @frontend = Profession.find_by(name: "Front-End Developer")
  end

  def style_sheet
  end
end
