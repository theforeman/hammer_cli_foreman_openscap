module HammerCLIForemanOpenscap
  class OvalPolicy < HammerCLIForeman::Command

    resource :oval_policies

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :name, _("Name")
        field :created_at, _("Created at")
      end
      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output ListCommand.output_definition do
        field :period, _("Period")
        field :weekday, _("Weekday")
        field :day_of_month, _("Day of month")
        field :cron_line, _("Cron line")
        field :oval_content_id, _("OVAL content Id")
        HammerCLIForeman::References.taxonomies(self)
        HammerCLIForeman::References.hostgroups(self)
      end
      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("OVAL policy has been deleted")
      failure_message _("Could not delete the OVAL policy")

      build_options
    end

    class CreateCommand < HammerCLIForemanOpenscap::CreateCommand
      success_message _("OVAL policy created")
      failure_message _("Could not create the OVAL policy")

      build_options

    end

    class UpdateCommand < HammerCLIForemanOpenscap::UpdateCommand
      success_message _("OVAL policy updated")
      failure_message _("Could not update the OVAL policy")

      build_options
    end

    class AssignHosts < HammerCLIForemanOpenscap::AssignCommand
      action :assign_hosts
      command_name 'assign-hosts'

      output do
        field :title, _('Title'), Fields::Field, :hide_blank => true
        field :result, _('Result'), Fields::Field, :hide_blank => true
        field :fail_message, _('Error Message'), Fields::Field, :hide_blank => true
      end

      build_options
    end

    class AssignHostgroups < HammerCLIForemanOpenscap::AssignCommand
      action :assign_hostgroups
      command_name 'assign-hostgroups'

      output do
        field :title, _('Title'), Fields::Field, :hide_blank => true
        field :result, _('Result'), Fields::Field, :hide_blank => true
        field :fail_message, _('Error Message'), Fields::Field, :hide_blank => true
      end

      build_options
    end

    autoload_subcommands
  end
end
