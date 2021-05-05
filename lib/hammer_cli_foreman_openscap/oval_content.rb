module HammerCLIForemanOpenscap
  class OvalContent < HammerCLIForeman::Command
    resource :oval_contents

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _('Id')
        field :name, _('Name')
        field :original_filename, _('Original filename')
        field :url, _('URL')
      end

      build_options
    end

    class InfoCommand < HammerCLIForemanOpenscap::InfoCommand
      output ListCommand.output_definition do
        field :created_at, _("Created at")
        field :original_filename, _("Digest")

        HammerCLIForeman::References.taxonomies(self)
      end
      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("OVAL Content has been deleted")
      failure_message _("Could not delete the OVAL content")

      build_options
    end

    class CreateCommand < HammerCLIForemanOpenscap::CreateCommand
      success_message _("OVAL Content successfully created")
      failure_message _("Failed to create OVAL content")

      def request_headers
        { :content_type => 'multipart/form-data', :multipart => true }
      end

      option "--scap-file", "SCAP_FILE", _("OVAL content file"),
                   :attribute_name => :option_scap_file,
                   :format => HammerCLIForemanOpenscap::Options::Normalizers::BinaryFile.new

      build_options
    end

    class UpdateCommand < HammerCLIForemanOpenscap::UpdateCommand
      success_message _("SCAP content updated")
      failure_message _("Could not update SCAP content")

      def request_headers
        { :content_type => 'multipart/form-data', :multipart => true }
      end

      option "--scap-file", "SCAP_FILE", _("OVAL content file"),
                   :attribute_name => :option_scap_file,
                   :format => HammerCLIForemanOpenscap::Options::Normalizers::BinaryFile.new
      build_options
    end

    class SyncCommand < HammerCLIForemanOpenscap::CreateCommand
      command_name 'sync'
      action :sync

      success_message _('OVAL contents synced with remote sources')
      failure_message _('Could not sync OVAL contents')

      output do
        field :id, _('Id')
        field :name, _('Name')
        field :full_messages, _('Full messages'), ::Fields::List
      end

      build_options
    end

    autoload_subcommands
  end
end
