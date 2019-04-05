module FeatureSwitch

  def self.enabled?(feature)
    Rails.configuration.x.features[feature] ? true : false
  end

  def self.disabled?(feature)
     Rails.configuration.x.features[feature] = false
  end

end