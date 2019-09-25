module Pages
  class FarmDrop
    attr_reader :registration_page, :home_page
    def initialize
      @registration_page = RegistrationPage.new
      @home_page = HomePage.new
    end
  end
end
