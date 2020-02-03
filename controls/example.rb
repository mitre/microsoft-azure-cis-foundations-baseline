# encoding: utf-8
# copyright: 2018, The Authors

title 'sample section'

# you add controls here
control 'tmp-1.0' do                        # A unique ID for this control
  describe azurerm_resource_groups do
    its("names.length") { should be > 0 }
  end
end
