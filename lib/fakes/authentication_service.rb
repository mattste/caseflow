class Fakes::AuthenticationService
  cattr_accessor :user_session
  cattr_accessor :vacols_regional_offices

  def self.default_user_session
    user_session
  end

  def self.get_user_session(user_id)
    user = User.find(user_id)
    # Take the roles from the User's css_id
    roles = user.css_id.split(",").map(&:strip)
    admin_roles = roles.include?("System Admin") ? ["System Admin"] : []
    {
      "id" => user.css_id,
      "roles" => roles,
      "station_id" => user.station_id,
      "name" => user.full_name,
      "admin_roles" => admin_roles
    }
  end

  def self.find_ro(regional_office)
    # case-insensitive compare on all the keys
    vacols_regional_offices.keys.find do |known_ro|
      known_ro.casecmp(regional_office) == 0
    end
  end
end
