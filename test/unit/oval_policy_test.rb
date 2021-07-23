require File.join(File.dirname(__FILE__), 'test_helper')
require 'hammer_cli_foreman_openscap/oval_policy'

describe HammerCLIForemanOpenscap::OvalPolicy do
  include CommandTestHelper

  context "ListCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalPolicy::ListCommand.new "", ctx }

    before :each do
      ComplianceResourceMock.oval_policies_list
    end

    context "parameters" do
      it_should_accept "no arguments"
      it_should_accept_search_params
    end

    context "output" do
      let(:expected_record_count) { cmd.resource.call(:index).length }
      it_should_print_n_records
      it_should_print_columns ["Id", "Name", "Created at"]
    end
  end

  context "InfoCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalPolicy::InfoCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
      it_should_accept "name", ["--name=super_policy"]
    end

    context "output" do
      with_params ["--id=1"] do
        it_should_print_n_records 1
        it_should_print_columns ["Id", "Name", "Created at", "Period", "Weekday",
                                 "Day of month", "Cron line", "OVAL content Id",
                                 "Hostgroups"]
      end
    end
  end

  context "DeleteCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalPolicy::DeleteCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
      it_should_accept "name", ["--name=bad_policy"]
    end
  end

  context "UpdateCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalPolicy::UpdateCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
      it_should_accept "name", ["--name=bad_policy"]
    end
  end
end
