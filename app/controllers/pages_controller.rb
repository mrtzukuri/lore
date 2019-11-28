class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :frontend, :backend, :productmanager]

  def home
    @professions = Profession.all
  end

  def frontend
    @jnr = Profession.find_by(name: "Junior Front-End Developer")
    @mid = Profession.find_by(name: "Mid-Level Front-End Developer")
    @snr = Profession.find_by(name: "Senior Front-End Developer")
  end

  def backend
    @jnr = Profession.find_by(name: "Junior Back-End Developer")
    @mid = Profession.find_by(name: "Mid-Level Back-End Developer")
    @snr = Profession.find_by(name: "Senior Back-End Developer")
  end

  def design
    @jnr = Profession.find_by(name: "Junior Designer")
    @mid = Profession.find_by(name: "Mid-Level Designer")
    @snr = Profession.find_by(name: "Senior Designer")
  end

  def productmanager
    @jnr = Profession.find_by(name: "Junior Product Manager")
    @mid = Profession.find_by(name: "Mid-Level Product Manager")
    @snr = Profession.find_by(name: "Senior Product Manager")
  end

end
