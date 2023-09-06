module HammerCLIForemanOpenscap
  class ScapContent < HammerCLIForeman::Command

    resource :scap_contents

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :title, _("Title")
        field :digest, _("Digest")
      end
      build_options
    end

    class CreateCommand < HammerCLIForemanOpenscap::CreateWithScapFileCommand
      success_message _("SCAP content successfully created")
      failure_message _("Failed to create SCAP content")

      scap_file_option _("SCAP content file")

      build_options
    end

    class BulkUpload < HammerCLIForemanOpenscap::CreateCommand
      command_name "bulk-upload"
      action :bulk_upload

      success_message _('Scap Contents uploaded.')
      failure_message _('Could not upload Scap Contents')

      def execute
        d = send_request
        any_errors = d['errors'].any?
        if d['results'].any? || any_errors
          d.delete('errors') unless any_errors
          print_data(d)
          return HammerCLI::EX_SOFTWARE if any_errors
        else
          print_success_message(d)
        end
        HammerCLI::EX_OK
      end

      output do
        field :errors, _('Errors'), Fields::List, :on_new_line => true, :separator => "\n", :hide_blank => true
        collection :results, _('Uploaded Scap Contents'), :hide_blank => true do
          field :id, _("Id")
          field :title, _("Title")
          field :original_filename, _("Original Filename")
        end
      end

      build_options
    end

    class DeleteCommand < HammerCLIForemanOpenscap::DeleteCommand
      success_message _("SCAP content deleted")
      failure_message _("Could not delete SCAP content")

      build_options
    end

    class InfoCommand < HammerCLIForemanOpenscap::InfoCommand
      output ListCommand.output_definition do
        field :created_at, _("Created at")
        field :original_filename, _("Original filename")

        collection :scap_content_profiles, _("SCAP content profiles"), :numbered => false do
          field :id, _("Id")
          field :profile_id, _("Profile id")
          field :title, _("Title")
        end
        HammerCLIForeman::References.taxonomies(self)
      end
      build_options
    end

    class UpdateCommand < HammerCLIForemanOpenscap::UpdateCommand
      success_message _("SCAP content updated")
      failure_message _("Could not update SCAP content")

      option "--scap-file", "SCAP_FILE", _("SCAP content file"),
                   :attribute_name => :option_scap_file,
                   :format => HammerCLI::Options::Normalizers::File.new
      build_options
    end

    class DownloadCommand < HammerCLIForemanOpenscap::DownloadXmlCommand
      success_message _("SCAP content file downloaded, saved to: ")
      failure_message _("Could not download the SCAP content file")

      build_options
    end

    autoload_subcommands
  end
end
