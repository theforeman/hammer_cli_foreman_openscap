 require File.join(Gem.loaded_specs['hammer_cli_foreman'].full_gem_path, 'test/unit/apipie_resource_mock')

 module ComplianceResourceMock
  def self.arf
    {
      :id => 1,
      :host => {
        :name => "somewhere.example.com"
      },
      :reported_at => "1916-06-08",
      :passed => 24,
      :failed => 25,
      :othered => 26,
      :openscap_proxy_name => {
        :name => "scap_proxy.example.com"
      },
      :policy => {
        :name => "strict policy"
      }
    }
  end

  def self.policy
    {
      :id => 1,
      :name => "Very strict policy",
      :period => "monthly",
      :weekday => "",
      :cron_line => "0 * * * *",
      :scap_content_id => 5,
      :scap_content_profile_id => 5
    }
  end

  def self.scap_content
    {
      :id => 1,
      :title => "Red Hat fedora default content"
    }
  end

  def self.tailoring_file
    {
      :id => 1,
      :name => "Red Hat fedora tailored"
    }
  end

  def self.oval_content
    {
      :id => 77,
      :name => 'Ansible 2.7',
      :original_filename => 'ansible-2.7.oval.xml.bz2',
      :url => 'https://content-source/ansible-2.7.oval.xml.bz2'
    }
  end

  def self.oval_policy
    {
      :id => 52,
      :name => 'Oval policy',
      :period => 'custom',
      :weekday => nil,
      :day_of_month => nil,
      :cron_line => '5 5 5 5 5',
      :oval_content_id => 44
    }
  end

  def self.arf_reports_list
    ResourceMocks.mock_action_call(:arf_reports, :index, [arf])
  end

  def self.policies_list
    ResourceMocks.mock_action_call(:policies, :index, [policy])
  end

  def self.scap_contents_list
    ResourceMocks.mock_action_call(:scap_contents, :index, [scap_content])
  end

  def self.tailoring_files_list
    ResourceMocks.mock_action_call(:tailoring_files, :index, [tailoring_file])
  end

  def self.oval_contents_list
    ResourceMocks.mock_action_call(:oval_contents, :index, [oval_content])
  end

  def self.oval_policies_list
    ResourceMocks.mock_action_call(:oval_policies, :index, [oval_policy])
  end
end
