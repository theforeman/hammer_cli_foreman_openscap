require File.join(File.dirname(__FILE__), 'test_helper')
require 'hammer_cli_foreman_openscap/oval_content'

describe HammerCLIForemanOpenscap::OvalContent do
  include CommandTestHelper

  context "ListCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalContent::ListCommand.new "", ctx }

    before :each do
      ComplianceResourceMock.oval_contents_list
    end

    context "parameters" do
      it_should_accept "no arguments"
      it_should_accept_search_params
    end

    context "output" do
      let(:expected_record_count) { cmd.resource.call(:index).length }
      it_should_print_n_records
      it_should_print_columns ["Id", "Name", "Original filename", "URL"]
    end
  end

  context "DeleteCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalContent::DeleteCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end
  end

  context "UpdateCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalContent::UpdateCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end
  end

  context "InfoCommand" do
    let(:cmd) { HammerCLIForemanOpenscap::OvalContent::InfoCommand.new("", ctx) }

    context "parameters" do
      it_should_accept "id", ["--id=1"]
    end

    context "output" do
      with_params ["--id=1"] do
        it_should_print_n_records 1
        it_should_print_columns ["Id", "Name", "Original filename", "URL", "Created at", "Digest"]
      end
    end
  end
end
