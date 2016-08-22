module Common
  def self.included(mod)
    mod.instance_eval do
      # allow_mass_assignment: true
      # https://github.com/collectiveidea/audited/tree/4.2-stable
      audited

      has_many :notes, as: :notable
    end
  end
end
